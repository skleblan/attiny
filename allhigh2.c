
#define PORTA	0x3B
#define DDRA	0x3A
#define PINA	0x39

#define p_PORTA  ((char*)PORTA)
#define p_DDRA  ((char*)DDRA)

void set_gpio(int pin, int val)
{
  if(val > 0)
  {
    *p_PORTA = *p_PORTA | (1<<pin);
  }
  else
  {
    *p_PORTA = *p_PORTA & ~(1<<pin);
  }
}

int main(int argc, char** argv)
{
  int i;
  *p_DDRA = 0xFF; //set all gpios as outputs

  while(1)
  {
    for(i = 0; i < 8; i++)
    {
      set_gpio(i, 1);
    }
  }

  return 1;
}




