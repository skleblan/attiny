#include <avr/interrupt.h>

#define ledPin 7

void setup() {
  pinMode(ledPin, OUTPUT);

  cli();
  TCCR1A = 0;
  TCCR1B = 0;

  TCNT1 = 34286; //preload timer 65536-16MHz/256/2Hz
  TCCR1B |= (1 << CS12); //256 prescaler
  TIMSK1 |= (1 << TOIE1); //enable timer overflow interrupt
  sei();
}

ISR(TIM1_OVF_vect)
{
  TCNT1 = 34286; //preload timer
  digitalWrite(ledPin, digitalRead(ledPin) ^ 1);
}

void loop() {
  // put your main code here, to run repeatedly:

}
