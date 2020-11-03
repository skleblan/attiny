//use internal 1MHz clock
//attiny84
//programmer usbtinyisp
const int ledpin = 2;

void setup() {
  pinMode(ledpin, OUTPUT);
}

void loop() {
  digitalWrite(ledpin, HIGH);
  delay(1000);
  digitalWrite(ledpin, LOW);
  delay(1000);
}
