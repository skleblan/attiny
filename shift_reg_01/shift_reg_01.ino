int clockpin = 5;
int datapin = 0;

void setup() {
  pinMode(clockpin, OUTPUT);
  pinMode(datapin, OUTPUT);
}

void sendbit(int val)
{
  digitalWrite(clockpin, LOW);
  digitalWrite(datapin, val);
  digitalWrite(clockpin, HIGH);
}

void sendfourbits(int val)
{
  int i;
  int curval;
  for(i = 0; i < 4; i++)
  {
    curval = (val >> i) & 0x1;
    sendbit(curval);
  }
}

void loop() {
  int i;

//  sendbit(1);
//  delay(2000);
//
//  sendbit(0);
//  delay(2000);
//
//  sendbit(1);
//  delay(2000);
//
//  sendbit(0);
//  delay(2000);


  
  for(i = 0; i < 0xF; i++)
  {
    sendfourbits(i);
    delay(1000);
  }
}
