
//#include <avr/sleep.h>

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

//Port A number 2 (pin 11 in DIP)
#define LEDPIN 2

void setup_gpio(void)
{
  *p_DDRA = 0xFF;
}

void delay_blocking(int ms)
{
  int i;
  //volatile int cur_count //how to implement?
  //currently using 8MHz clock
  
  *p_TCCR0B = *p_TCCR0B | (0x5 << 0); //set prescalar to 1024

  for(i = 0; i < ms; i++)
  {
    *p_TCNT0 = 0x00; //reset counter to 0
    *p_OCR0A = 0x08; //about 1 millisecond (+/- 25%)

    while(*p_TCNT0 < *p_OCR0A); //wait
  }
}

void set_gpio(int pin, int val)
{
  if(val)
  {
    *p_PORTA = 0xFF;
  }
  else
  {
    *p_PORTA = 0x00;
  }
}

void init(void)
{
  //
}

int main(int argc, char** argv)
{
  int led_state;
  led_state = 0;
  setup_gpio();

  while(1)
  {
    if(led_state == 1)
      led_state = 0;
    else
      led_state = 1;

    set_gpio(LEDPIN, led_state);
    delay_blocking(1000);
  }
  return 1;
}
