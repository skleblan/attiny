avr-gcc -mmcu=avr25 -o allhigh.elf allhigh.c
objcopy -O ihex allhigh.elf allhigh.hex
avr-gcc -mmcu=avr25 -o allhigh2.elf allhigh2.c
objcopy -O ihex allhigh2.elf allhigh2.hex
