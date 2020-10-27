
#define PORTA	0x3B
#define DDRA	0x3A
#define PINA	0x39

#define p_PORTA  ((char*)PORTA)
#define p_DDRA  ((char*)DDRA)

int main(int argc, char** argv)
{
  *p_DDRA = 0xFF; //set all gpios as outputs

  *p_PORTA = 0x00; //set all gpios to low

  while(1);

  return 1;
}
