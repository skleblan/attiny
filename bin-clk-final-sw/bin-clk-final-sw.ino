#include <avr/sleep.h>
#include <avr/interrupt.h>
#include <avr/io.h>

//1024 prescaler
//using 1 MHz clock
//60,000,000 / 1024 = 58593.75 ticks
//65536-58594 = 6942 ticks remaining
int timer_reset = 6942;

int minutes = 0;
int hours = 12;

//arduino pin numbers (not same as physical pin numbers)
int hours_button = 0;
int minutes_button = 1;
int datapin = 3;
int minutes_ones_clkpin = 4;  //SR_CLK_1
int hours_ones_clkpin = 5;    //SR_CLK_2
int combined_tens_clkpin = 6; //SR_CLK_3
int resetpin = 2;

int timer_wakeup = 0;

void setup() {
  pinMode(datapin, OUTPUT);
  pinMode(minutes_ones_clkpin, OUTPUT);
  pinMode(hours_ones_clkpin, OUTPUT);
  pinMode(combined_tens_clkpin, OUTPUT);
  pinMode(resetpin, OUTPUT);

  DDRA &= ~(1<<hours_button); //hours button. clear DDRA0 to set it to input
  PORTA |= (1<<hours_button); //hours button. set PORTA0 to high. unsure why. saw it in docs
  
  DDRA &= ~(1<<minutes_button); //same for minutes button
  PORTA |= (1<<minutes_button); //same for minutes button
  
  MCUCR &= ~(1<<PUD); //make sure PUD is cleared so that pullups are enabled

  cli();
  TCCR1A = 0;
  TCCR1B = 0;

  TCNT1 = timer_reset;
  TCCR1B |= (1 << CS12) | (1 << CS10); //1024 prescaler
  TIMSK1 |= (1 << TOIE1); //enable timer overflow interrupt
  sei();
}

ISR(TIM1_OVF_vect)
{
  timer_wakeup = 1;
  TCNT1 = timer_reset; //reload initial value
  cli();
}

void skl_sleep()
{
  set_sleep_mode(SLEEP_MODE_IDLE);
  
  sleep_enable();
  sei();
  sleep_cpu();
  sleep_disable();
}

void sendbit(int clockpin, int val)
{
  digitalWrite(clockpin, LOW);
  digitalWrite(datapin, val);
  digitalWrite(clockpin, HIGH);
}

void sendfourbits(int pin, int val, int reverse_bit_order)
{
  int i;
  int curval;

  if(reverse_bit_order)
  {
    for(i = 3; i >= 0; i--)
    {
      curval = (val >> i) & 0x1;
      sendbit(pin, curval);
    }
  }
  else
  {
    for(i = 0; i < 4; i++)
    {
      curval = (val >> i) & 0x1;
      sendbit(pin, curval);
    }
  }
}

void clock_tick()
{
  minutes++;
  if(minutes > 59)
  {
    minutes = 0;
    hours++;
    if(hours > 12)
    {
      hours = 1;
    }
  }
}

void update_display()
{
  int combined_tens = 0;
  int reverse_bits = 1; //think I wired the shift registers to the LED's backwards
  sendfourbits( minutes_ones_clkpin, (minutes % 10), reverse_bits );
  sendfourbits( hours_ones_clkpin, (hours % 10), reverse_bits );

  combined_tens = ((hours/10)<<3) | ((minutes/10)<<0);
  sendfourbits( combined_tens_clkpin, combined_tens, reverse_bits);
}

void handle_buttons()
{
  int hours_val = digitalRead(hours_button);
  int mins_val = digitalRead(minutes_button);
  
  if(!hours_val)
  {
    hours += 1;
    if(hours > 12)
    {
      hours = 1;
    }
  }
  else if(!mins_val)
  {
    minutes += 1;
    if(minutes > 59)
    {
      minutes = 0;
      //do not update hours
    }
  }
}

void loop() {
  while(1)
  {
    if(timer_wakeup)
    {
      timer_wakeup = 0;
      clock_tick();
    }
    else
    {
      //we woke up via button
      handle_buttons();
    }

    update_display();

    skl_sleep();
  }
}
