#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

//Port A number 2 (pin 11 in DIP)
#define LEDPIN 2

void setup_gpio(void)
{
  DDRA = DDRA | (1<<LEDPIN);
}

void sleep(int ms)
{
  //TODO: set timer
  //enable sleep mode
  MCUCR = MCUCR | (1<<5); //idx 5 in MCU CR
  //go to sleep
  sleep_cpu(); 
  //come out of sleep
  //disable sleep mode
  MCUCR = MCUCR & ~(1<<5);
}

void set_gpio_b(int pin, int val)
{
  if(val)
  {
    PORTB = PORTB | (1<<pin);
  }
  else
  {
    PORTB = PORTB & ~(1<<pin);
  }
}

void set_gpio_a(int pin, int val)
{
  if(val)
  {
    PORTA = PORTA | (1<<pin);
  }
  else
  {
    PORTA = PORTA & ~(1<<pin);
  }
}

int read_gpio_b(int pin)
{
  int masked_val;
  masked_val = PORTB & ~(1 << pin);
  if(masked_val == 0)
    return 0;
  else
    return 1;
}

void delay_blocking(int ms)
{
  int i;
  int oca0_triggered;
  //currently using 8MHz clock
  TCCR0B = TCCR0B | (0x5 << 0); //prescalar 1024
  TCCR0A = TCCR0A | (0x2 << 0); //enable ctc mode
  TCCR0A = TCCR0A | (0x3 << 6); //set OC0A at time end
  TCNT0 = 0x00; //reset counter to 0
  OCR0A = 0x20; //about 4 millisecond (+/- 25%)

  for(i = 0; i < ms; i++)
  {
    set_gpio_b(2, 0); //reset OC0A
    oca0_triggered = 0;
    //OC0A i/o pin is number 2 on port b
    while(oca0_triggered == 0)
    {
      oca0_triggered = read_gpio_b(2);
    }
  }
}


int main(int argc, char** argv)
{
  int led_state;
  led_state = 0;
  setup_gpio();

  while(1)
  {
    if(led_state == 0)
      led_state = 1;
    else
      led_state = 0;
    set_gpio_a(LEDPIN, led_state);
    delay_blocking(500);
  }
  return 1;
}

#if 0
#define PORTA	0x3B
#define DDRA	0x3A
#define PINA	0x39

#define MCUCR	0x35

#define TCCR0A	0x50
#define TCCR0B	0x53
#define TCNT0	0x52
#define OCR0A	0x56
#define OCR0B	0X5C
#define TIMSK0	0x59
#define TIFR0	0x58

#define SLEEP_MODE_SHIFT 3
#define SLEEP_MODE_IDLE		(0x0 << SLEEP_MODE_SHIFT)
#define SLEEP_MODE_ADC		(0x1 << SLEEP_MODE_SHIFT)
#define SLEEP_MODE_PWRDN	(0x2 << SLEEP_MODE_SHIFT)
#define SLEEP_MODE_STANDY	(0x3 << SLEEP_MODE_SHIFT)

#define p_PORTA  ((char*)PORTA)
#define p_DDRA  ((char*)DDRA)
#define p_PINA  ((char*)PINA)
#define p_MCUCR ((char*)MCUCR)

#define p_TCNT0 ((char*)TCNT0)
#define p_OCR0A ((char*)OCR0A)
#define p_TCCR0A ((char*)TCCR0A)
#define p_TCCR0B ((char*)TCCR0B)
#endif


