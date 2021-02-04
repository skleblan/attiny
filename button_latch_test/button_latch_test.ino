#include <avr/io.h>

int raw_led_pin = 0;
int latch_led_pin = 2;

typedef enum button_latch_enum {
  rising,
  high,
  falling,
  low
} button_state_t;

typedef struct button_struct {
  int pin;
  button_state_t state;
} button_t;

button_t btn;

void setup() {
  pinMode(raw_led_pin, OUTPUT);
  pinMode(latch_led_pin, OUTPUT);
  DDRB &= ~(1<<1); //port b 1 corresponds to arduino pin 9
  PORTB |= (1<<1); //port b 1 corresponds to arduino pin 9
  MCUCR &= ~(1<<PUD);
  btn.pin = 9;
  btn.state = high;
}

int handle_button_states(button_t* lbtn, int active_high)
{
  int retval = 0;
  int rawval = digitalRead(lbtn->pin);
  switch(lbtn->state)
  {
    case rising:
      if(rawval)
      {
        lbtn->state = high;
        retval = 0;
      }
      break;
    case high:
      if(!rawval)
      {
        lbtn->state = falling;
        retval = !active_high;
      }
      break;
    case falling:
      if(!rawval)
      {
        lbtn->state = low;
        retval = 0;
      }
      break;
    case low:
      if(rawval)
      {
        lbtn->state = rising;
        retval = active_high;
      }
      break;
  }

  return retval;
}

int count = 0;

void loop() {
  digitalWrite(raw_led_pin, digitalRead(btn.pin));
  int latchval = handle_button_states(&btn, 0);
  digitalWrite(latch_led_pin, latchval);
  delay(10);
}
