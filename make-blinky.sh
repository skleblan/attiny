avr-gcc -mmcu=avr25 -o blinky01.elf blinky01.c
objcopy -O ihex blinky01.elf blinky01.hex
avr-gcc -mmcu=attiny84 -o blinky02.elf blinky02.c
objcopy -O ihex blinky02.elf blinky02.hex
