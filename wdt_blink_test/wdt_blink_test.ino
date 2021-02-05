#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>

int led_val = 0;
int led_pin = 1;

//depends on correct fuse bits being set
//default fuse vals for attiny84 are E:FF, H:DF, L:62
//see https://www.engbedded.com/fusecalc/
//to check on your dev, run "avrdude -p t84 -c usbtiny"
//corresponds to WDTON = 0
//  aka safety level 1
//  aka WDT is not always enabled

void setup() {
  pinMode(led_pin, OUTPUT);

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

ISR(WDT_vect)
{
    led_val = !led_val;
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(led_pin, led_val);
}
