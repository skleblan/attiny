#include <avr/sleep.h>
#include <avr/interrupt.h>

//1024 prescaler
//using 1 MHz clock
//60,000,000 / 1024 = 58593.75 ticks
//65536-58594 = 6942 ticks remaining
int timer_reset = 6942;

int minutes = 0;
int hours = 12;

int hours_button = 13;
int minutes_button = 12;

int datapin = 10;
int minutes_ones_clkpin = 9;  //SR_CLK_1
int hours_ones_clkpin = 8;    //SR_CLK_2
int combined_tens_clkpin = 7; //SR_CLK_3
int resetpin = 11;

void setup() {
  pinMode(datapin, OUTPUT);
  pinMode(minutes_ones_clkpin, OUTPUT);
  pinMode(hours_ones_clkpin, OUTPUT);
  pinMode(combined_tens_clkpin, OUTPUT);
  pinMode(resetpin, OUTPUT);

//  pinMode(hours_button, INPUT);
//  pinMode(minutes_button, INPUT);

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

void sendfourbits(int pin, int val)
{
  int i;
  int curval;
  for(i = 0; i < 4; i++)
  {
    curval = (val >> i) & 0x1;
    sendbit(pin, curval);
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

void loop() {
  int combined_tens = 0;
  
  while(1)
  {
    clock_tick();

    sendfourbits( minutes_ones_clkpin, (minutes % 10) );
    sendfourbits( hours_ones_clkpin, (hours % 10) );

    combined_tens = ((hours/10)<<3) | ((minutes/10)<<0);
    sendfourbits( combined_tens_clkpin, combined_tens);

    skl_sleep();
  }
}
