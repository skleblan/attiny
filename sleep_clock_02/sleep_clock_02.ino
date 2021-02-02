#include <avr/sleep.h>
#include <avr/interrupt.h>

#define ledPin 7

int ledstate = 0;

void setup() {
  pinMode(ledPin, OUTPUT);

  cli();
  TCCR1A = 0;
  TCCR1B = 0;

  TCNT1 = 34286; //65536-34286 = 31250 ticks remaining
  TCCR1B |= (1 << CS11) | (1 << CS10); //64 prescaler
  //31250 * 64 = 2,000,000 ticks
  //using 1 MHz clock
  TIMSK1 |= (1 << TOIE1); //enable timer overflow interrupt
  sei();
}

ISR(TIM1_OVF_vect)
{
  TCNT1 = 34286; //reload initial value
  ledstate = !ledstate;
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
    digitalWrite(ledPin, ledstate);

    skl_sleep();
  }
}
