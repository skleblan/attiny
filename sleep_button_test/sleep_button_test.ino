#include <avr/sleep.h>
#include <avr/interrupt.h>
#include <avr/io.h>

//64 prescaler
//using 1 MHz clock
//3,750,000 / 64 = 58593.75 ticks
//65536-58594 = 6942 ticks remaining
int timer_reset = 6942;

int blinkled = 9;
int buttonled = 7;
int button = 6; //aka Port A6

int blinkstatus = 0;
int buttonstatus = 0;


void setup() {
  pinMode(blinkled, OUTPUT);
  pinMode(buttonled, OUTPUT);
  //pinMode(button, INPUT);

  DDRA &= ~(1<<6); //clear DDRA6 to set it to input
  PORTA |= (1<<6); //set PORTA6 to high. unsure why. saw it in docs
  MCUCR &= ~(1<<PUD); //make sure PUD is cleared so that pullups are enabled
  
  cli();
  TCCR1A = 0;
  TCCR1B = 0;

  TCNT1 = timer_reset;
  TCCR1B |= (1 << CS11) | (1 << CS10); //64 prescaler
  TIMSK1 |= (1 << TOIE1); //enable timer overflow interrupt
  sei();
}

ISR(TIM1_OVF_vect)
{
  TCNT1 = timer_reset; //reload initial value
  blinkstatus = !blinkstatus;
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

void loop() {
  while(1)
  {
    digitalWrite(blinkled, blinkstatus);
    buttonstatus = digitalRead(button);
    digitalWrite(buttonled, buttonstatus);
    skl_sleep();
  }
}
