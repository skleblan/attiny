
#include <avr/sleep.h>

#define PORTA	0x3B
#define DDRA	0x3A
#define PINA	0x39

#define MCUCR	0x35

#define SLEEP_MODE_SHIFT 3
#define SLEEP_MODE_IDLE		(0x0 << SLEEP_MODE_SHIFT)
#define SLEEP_MODE_ADC		(0x1 << SLEEP_MODE_SHIFT)
#define SLEEP_MODE_PWRDN	(0x2 << SLEEP_MODE_SHIFT)
#define SLEEP_MODE_STANDY	(0x3 << SLEEP_MODE_SHIFT)

#define p_PORTA  ((char*)PORTA)
#define p_DDRA  ((char*)DDRA)
#define p_PINA  ((char*)PINA)
#define p_MCUCR ((char*)MCUCR)

#define LEDPIN 2

void setup_gpio(void)
{
  *p_DDRA = *p_DDRA | (1<<LEDPIN);
  *p_MCUCR = *p_MCUCR | SLEEP_MODE_IDLE;
}

void sleep(int ms)
{
  //TODO: set timer
  //go to sleep
  *p_MCUCR = *p_MCUCR | (1<<5); //idx 5 in MCU CR
  //go to sleep
  sleep_cpu(); 
  //come out of sleep
  *p_MCUCR = *p_MCUCR & ~(1<<5);
}

void set_gpio(int pin, int val)
{
  if(val)
  {
    *p_PORTA = *p_PORTA | (1<<pin);
  }
  else
  {
    *p_PORTA = *p_PORTA & ~(1<<pin);
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
  init();
  setup_gpio();

  while(1)
  {
    led_state = !led_state;
    set_gpio(LEDPIN, led_state);
    sleep(500);
  }
  return 1;
}
