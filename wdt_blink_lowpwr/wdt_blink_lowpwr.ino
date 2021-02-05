#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>
#include <avr/sleep.h>
#include <avr/power.h>

int led_val = 0;
int led_pin = 1;

void setup() {
  pinMode(led_pin, OUTPUT);

  power_all_disable();
  //from avr/power.h
  //4 for attiny84: tim/cnt 0, tim/cnt 1, serial comm, ADC

  //watchdog
  cli();
  wdt_reset();
  
  //set up WDT interrupt
  WDTCSR = (1<<WDCE)|(1<<WDE);
  
  //Start watchdog timer with 4s prescaller
  WDTCSR = (1<<WDIE)|(1<<WDE)|(1<<WDP3);
  
  //Enable global interrupts
  sei();
}

void my_sleep()
{
  set_sleep_mode(SLEEP_MODE_PWR_DOWN);
  sleep_enable();
  sei();
  sleep_cpu();
  sleep_disable();
}

ISR(WDT_vect)
{
    led_val = !led_val;
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(led_pin, led_val);

  my_sleep();
}
