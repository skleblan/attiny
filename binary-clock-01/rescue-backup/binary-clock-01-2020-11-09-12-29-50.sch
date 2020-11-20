EESchema Schematic File Version 2
LIBS:binary-clock-01-rescue
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:cd4015b
LIBS:binary-clock-01-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +3.3V #PWR?
U 1 1 5FA3C662
P 4100 1200
F 0 "#PWR?" H 4100 1050 50  0001 C CNN
F 1 "+3.3V" H 4100 1340 50  0000 C CNN
F 2 "" H 4100 1200 50  0001 C CNN
F 3 "" H 4100 1200 50  0001 C CNN
	1    4100 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5FA3C871
P 2600 3450
F 0 "#PWR?" H 2600 3200 50  0001 C CNN
F 1 "GND" H 2600 3300 50  0000 C CNN
F 2 "" H 2600 3450 50  0001 C CNN
F 3 "" H 2600 3450 50  0001 C CNN
	1    2600 3450
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 5FA3D5CD
P 1450 1900
F 0 "#PWR?" H 1450 1750 50  0001 C CNN
F 1 "+BATT" H 1450 2040 50  0000 C CNN
F 2 "" H 1450 1900 50  0001 C CNN
F 3 "" H 1450 1900 50  0001 C CNN
	1    1450 1900
	1    0    0    -1  
$EndComp
$Comp
L LF33_TO220 U?
U 1 1 5FA3D7D9
P 2350 1900
F 0 "U?" H 2200 2025 50  0000 C CNN
F 1 "LF33_TO220" H 2350 2025 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 2350 2125 50  0001 C CIN
F 3 "" H 2350 1850 50  0001 C CNN
	1    2350 1900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5FA3E0D2
P 1800 2050
F 0 "C?" H 1825 2150 50  0000 L CNN
F 1 "0.33uC" H 1825 1950 50  0000 L CNN
F 2 "" H 1838 1900 50  0001 C CNN
F 3 "" H 1800 2050 50  0001 C CNN
	1    1800 2050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5FA3E399
P 2950 2100
F 0 "C?" H 2975 2200 50  0000 L CNN
F 1 "0.1uC" H 2975 2000 50  0000 L CNN
F 2 "" H 2988 1950 50  0001 C CNN
F 3 "" H 2950 2100 50  0001 C CNN
	1    2950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1200 4100 4050
Wire Wire Line
	4100 2250 4250 2250
Wire Wire Line
	2500 3450 4250 3450
Wire Wire Line
	2650 1900 4100 1900
Wire Wire Line
	2950 1900 2950 1950
Wire Wire Line
	1450 1900 2050 1900
Connection ~ 1800 1900
Wire Wire Line
	1800 2200 1800 2700
Wire Wire Line
	2950 2700 2950 2250
Wire Wire Line
	1800 2700 2950 2700
Wire Wire Line
	2350 2200 2350 2700
Connection ~ 2350 2700
Wire Wire Line
	2500 3450 2500 2700
Connection ~ 2500 2700
Connection ~ 2600 3450
Connection ~ 4100 1900
Connection ~ 2950 1900
$Comp
L cd4015b U?
U 1 1 5FA7781D
P 4450 5950
F 0 "U?" H 4700 5350 60  0000 C CNN
F 1 "cd4015b" H 4250 5350 60  0000 C CNN
F 2 "" H 4450 5950 60  0001 C CNN
F 3 "" H 4450 5950 60  0001 C CNN
	1    4450 5950
	1    0    0    -1  
$EndComp
$Comp
L cd4015b U?
U 1 1 5FA78260
P 4450 4650
F 0 "U?" H 4700 4050 60  0000 C CNN
F 1 "cd4015b" H 4250 4050 60  0000 C CNN
F 2 "" H 4450 4650 60  0001 C CNN
F 3 "" H 4450 4650 60  0001 C CNN
	1    4450 4650
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA7D3E7
P 9450 3650
F 0 "D?" H 9450 3750 50  0000 C CNN
F 1 "LED" H 9450 3550 50  0000 C CNN
F 2 "" H 9450 3650 50  0001 C CNN
F 3 "" H 9450 3650 50  0001 C CNN
	1    9450 3650
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA7D78D
P 9450 4000
F 0 "D?" H 9450 4100 50  0000 C CNN
F 1 "LED" H 9450 3900 50  0000 C CNN
F 2 "" H 9450 4000 50  0001 C CNN
F 3 "" H 9450 4000 50  0001 C CNN
	1    9450 4000
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA7E332
P 10150 2950
F 0 "D?" H 10150 3050 50  0000 C CNN
F 1 "LED" H 10150 2850 50  0000 C CNN
F 2 "" H 10150 2950 50  0001 C CNN
F 3 "" H 10150 2950 50  0001 C CNN
	1    10150 2950
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA7E338
P 9450 3300
F 0 "D?" H 9450 3400 50  0000 C CNN
F 1 "LED" H 9450 3200 50  0000 C CNN
F 2 "" H 9450 3300 50  0001 C CNN
F 3 "" H 9450 3300 50  0001 C CNN
	1    9450 3300
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA82926
P 10150 5050
F 0 "D?" H 10150 5150 50  0000 C CNN
F 1 "LED" H 10150 4950 50  0000 C CNN
F 2 "" H 10150 5050 50  0001 C CNN
F 3 "" H 10150 5050 50  0001 C CNN
	1    10150 5050
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA8292C
P 10150 5400
F 0 "D?" H 10150 5500 50  0000 C CNN
F 1 "LED" H 10150 5300 50  0000 C CNN
F 2 "" H 10150 5400 50  0001 C CNN
F 3 "" H 10150 5400 50  0001 C CNN
	1    10150 5400
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA82932
P 10150 4350
F 0 "D?" H 10150 4450 50  0000 C CNN
F 1 "LED" H 10150 4250 50  0000 C CNN
F 2 "" H 10150 4350 50  0001 C CNN
F 3 "" H 10150 4350 50  0001 C CNN
	1    10150 4350
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA82938
P 10150 4700
F 0 "D?" H 10150 4800 50  0000 C CNN
F 1 "LED" H 10150 4600 50  0000 C CNN
F 2 "" H 10150 4700 50  0001 C CNN
F 3 "" H 10150 4700 50  0001 C CNN
	1    10150 4700
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA85B6C
P 10150 2250
F 0 "D?" H 10150 2350 50  0000 C CNN
F 1 "LED" H 10150 2150 50  0000 C CNN
F 2 "" H 10150 2250 50  0001 C CNN
F 3 "" H 10150 2250 50  0001 C CNN
	1    10150 2250
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA85B72
P 10150 2600
F 0 "D?" H 10150 2700 50  0000 C CNN
F 1 "LED" H 10150 2500 50  0000 C CNN
F 2 "" H 10150 2600 50  0001 C CNN
F 3 "" H 10150 2600 50  0001 C CNN
	1    10150 2600
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA85B78
P 9450 1550
F 0 "D?" H 9450 1650 50  0000 C CNN
F 1 "LED" H 9450 1450 50  0000 C CNN
F 2 "" H 9450 1550 50  0001 C CNN
F 3 "" H 9450 1550 50  0001 C CNN
	1    9450 1550
	-1   0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5FA85B7E
P 10150 1900
F 0 "D?" H 10150 2000 50  0000 C CNN
F 1 "LED" H 10150 1800 50  0000 C CNN
F 2 "" H 10150 1900 50  0001 C CNN
F 3 "" H 10150 1900 50  0001 C CNN
	1    10150 1900
	-1   0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5FAB256B
P 8750 1550
F 0 "R?" V 8830 1550 50  0000 C CNN
F 1 "R" V 8750 1550 50  0000 C CNN
F 2 "" V 8680 1550 50  0001 C CNN
F 3 "" H 8750 1550 50  0001 C CNN
	1    8750 1550
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAB55F9
P 8750 2050
F 0 "R?" V 8830 2050 50  0000 C CNN
F 1 "R" V 8750 2050 50  0000 C CNN
F 2 "" V 8680 2050 50  0001 C CNN
F 3 "" H 8750 2050 50  0001 C CNN
	1    8750 2050
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAB5FC9
P 8750 2350
F 0 "R?" V 8830 2350 50  0000 C CNN
F 1 "R" V 8750 2350 50  0000 C CNN
F 2 "" V 8680 2350 50  0001 C CNN
F 3 "" H 8750 2350 50  0001 C CNN
	1    8750 2350
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAB71CB
P 8750 2650
F 0 "R?" V 8830 2650 50  0000 C CNN
F 1 "R" V 8750 2650 50  0000 C CNN
F 2 "" V 8680 2650 50  0001 C CNN
F 3 "" H 8750 2650 50  0001 C CNN
	1    8750 2650
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC0813
P 8750 2950
F 0 "R?" V 8830 2950 50  0000 C CNN
F 1 "R" V 8750 2950 50  0000 C CNN
F 2 "" V 8680 2950 50  0001 C CNN
F 3 "" H 8750 2950 50  0001 C CNN
	1    8750 2950
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC0819
P 8750 3350
F 0 "R?" V 8830 3350 50  0000 C CNN
F 1 "R" V 8750 3350 50  0000 C CNN
F 2 "" V 8680 3350 50  0001 C CNN
F 3 "" H 8750 3350 50  0001 C CNN
	1    8750 3350
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC081F
P 8750 3650
F 0 "R?" V 8830 3650 50  0000 C CNN
F 1 "R" V 8750 3650 50  0000 C CNN
F 2 "" V 8680 3650 50  0001 C CNN
F 3 "" H 8750 3650 50  0001 C CNN
	1    8750 3650
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC0825
P 8750 3950
F 0 "R?" V 8830 3950 50  0000 C CNN
F 1 "R" V 8750 3950 50  0000 C CNN
F 2 "" V 8680 3950 50  0001 C CNN
F 3 "" H 8750 3950 50  0001 C CNN
	1    8750 3950
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC2E19
P 8750 4500
F 0 "R?" V 8830 4500 50  0000 C CNN
F 1 "R" V 8750 4500 50  0000 C CNN
F 2 "" V 8680 4500 50  0001 C CNN
F 3 "" H 8750 4500 50  0001 C CNN
	1    8750 4500
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC2E1F
P 8750 4800
F 0 "R?" V 8830 4800 50  0000 C CNN
F 1 "R" V 8750 4800 50  0000 C CNN
F 2 "" V 8680 4800 50  0001 C CNN
F 3 "" H 8750 4800 50  0001 C CNN
	1    8750 4800
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC2E25
P 8750 5100
F 0 "R?" V 8830 5100 50  0000 C CNN
F 1 "R" V 8750 5100 50  0000 C CNN
F 2 "" V 8680 5100 50  0001 C CNN
F 3 "" H 8750 5100 50  0001 C CNN
	1    8750 5100
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5FAC2E2B
P 8750 5400
F 0 "R?" V 8830 5400 50  0000 C CNN
F 1 "R" V 8750 5400 50  0000 C CNN
F 2 "" V 8680 5400 50  0001 C CNN
F 3 "" H 8750 5400 50  0001 C CNN
	1    8750 5400
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5FAE750E
P 10700 5700
F 0 "#PWR?" H 10700 5450 50  0001 C CNN
F 1 "GND" H 10700 5550 50  0000 C CNN
F 2 "" H 10700 5700 50  0001 C CNN
F 3 "" H 10700 5700 50  0001 C CNN
	1    10700 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1550 10700 5700
Wire Wire Line
	10700 4350 10300 4350
Wire Wire Line
	10300 4700 10700 4700
Connection ~ 10700 4700
Wire Wire Line
	10300 5050 10700 5050
Connection ~ 10700 5050
Wire Wire Line
	10300 5400 10700 5400
Connection ~ 10700 5400
Wire Wire Line
	10700 3300 9600 3300
Connection ~ 10700 4350
Wire Wire Line
	9600 3650 10700 3650
Connection ~ 10700 3650
Wire Wire Line
	9600 4000 10700 4000
Connection ~ 10700 4000
Wire Wire Line
	10300 2950 10700 2950
Connection ~ 10700 3300
Wire Wire Line
	10300 2600 10700 2600
Connection ~ 10700 2950
Wire Wire Line
	10300 2250 10700 2250
Connection ~ 10700 2600
Wire Wire Line
	10300 1900 10700 1900
Connection ~ 10700 2250
Wire Wire Line
	9600 1550 10700 1550
Connection ~ 10700 1900
Wire Wire Line
	8900 1550 9300 1550
Wire Wire Line
	8900 2050 9350 2050
Wire Wire Line
	9350 2050 9350 1900
Wire Wire Line
	9350 1900 10000 1900
Wire Wire Line
	8900 2350 9400 2350
Wire Wire Line
	9400 2350 9400 2250
Wire Wire Line
	9400 2250 10000 2250
Wire Wire Line
	8900 2650 9450 2650
Wire Wire Line
	9450 2650 9450 2600
Wire Wire Line
	9450 2600 10000 2600
Wire Wire Line
	8900 2950 10000 2950
Wire Wire Line
	8900 3350 9100 3350
Wire Wire Line
	9100 3350 9100 3300
Wire Wire Line
	9100 3300 9300 3300
Wire Wire Line
	8900 3650 9300 3650
Wire Wire Line
	8900 3950 9100 3950
Wire Wire Line
	9100 3950 9100 4000
Wire Wire Line
	9100 4000 9300 4000
Wire Wire Line
	8900 4500 9500 4500
Wire Wire Line
	9500 4500 9500 4350
Wire Wire Line
	9500 4350 10000 4350
Wire Wire Line
	8900 4800 9600 4800
Wire Wire Line
	9600 4800 9600 4700
Wire Wire Line
	9600 4700 10000 4700
Wire Wire Line
	8900 5100 9700 5100
Wire Wire Line
	9700 5100 9700 5050
Wire Wire Line
	9700 5050 10000 5050
Wire Wire Line
	8900 5400 10000 5400
Wire Wire Line
	3850 5050 3100 5050
Wire Wire Line
	3100 5050 3100 6350
Wire Wire Line
	3100 6350 3850 6350
Wire Wire Line
	5000 4550 6900 4550
Wire Wire Line
	5650 4550 5650 5850
Wire Wire Line
	5650 5850 5000 5850
Wire Wire Line
	3100 5500 5650 5500
Connection ~ 5650 5500
Connection ~ 3100 5500
Wire Wire Line
	3850 5150 3350 5150
Wire Wire Line
	3350 6450 3850 6450
Wire Wire Line
	4100 4050 5400 4050
Wire Wire Line
	5400 4050 5400 5750
Wire Wire Line
	5400 4450 5000 4450
Connection ~ 4100 2250
Wire Wire Line
	5400 5750 5000 5750
Connection ~ 5400 4450
Wire Wire Line
	3350 3450 3350 6450
Connection ~ 3350 3450
Connection ~ 3350 5150
$Comp
L ATTINY84-20PU U?
U 1 1 5FA3C159
P 5300 2850
F 0 "U?" H 4450 3600 50  0000 C CNN
F 1 "ATTINY84-20PU" H 6000 2100 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 5300 2650 50  0001 C CIN
F 3 "" H 5300 2850 50  0001 C CNN
	1    5300 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4650 6800 4650
Wire Wire Line
	5750 4650 5750 5950
Wire Wire Line
	5750 5950 5000 5950
Wire Wire Line
	3850 4950 2950 4950
Wire Wire Line
	2950 4950 2950 6250
Wire Wire Line
	2950 6250 3850 6250
Wire Wire Line
	2950 5400 5750 5400
Connection ~ 5750 5400
Connection ~ 2950 5400
Wire Wire Line
	6800 4650 6800 2350
Wire Wire Line
	6800 2350 6350 2350
Connection ~ 5750 4650
Wire Wire Line
	6900 4550 6900 2450
Wire Wire Line
	6900 2450 6350 2450
Connection ~ 5650 4550
Wire Wire Line
	3850 6150 3750 6150
Wire Wire Line
	3750 6150 3750 6750
Wire Wire Line
	3750 6750 6900 6750
Wire Wire Line
	3850 6050 3700 6050
Wire Wire Line
	3700 6050 3700 6850
Wire Wire Line
	3700 6850 6800 6850
Wire Wire Line
	8600 5400 8300 5400
Wire Wire Line
	8300 5400 8300 6200
Wire Wire Line
	6900 6750 6900 6200
Wire Wire Line
	6900 6200 8300 6200
Wire Wire Line
	8200 6100 8200 5100
Wire Wire Line
	8200 5100 8600 5100
Wire Wire Line
	8200 6100 6800 6100
Wire Wire Line
	6800 6100 6800 6850
Wire Wire Line
	3850 5950 3650 5950
Wire Wire Line
	3650 5950 3650 6950
Wire Wire Line
	3650 6950 6700 6950
Wire Wire Line
	6700 6950 6700 6000
Wire Wire Line
	6700 6000 8100 6000
Wire Wire Line
	8100 6000 8100 4800
Wire Wire Line
	8100 4800 8600 4800
Wire Wire Line
	5000 6350 6600 6350
Wire Wire Line
	6600 6350 6600 5900
Wire Wire Line
	6600 5900 8000 5900
Wire Wire Line
	8000 5900 8000 4500
Wire Wire Line
	8000 4500 8600 4500
Wire Wire Line
	5000 6450 6500 6450
Wire Wire Line
	6500 6450 6500 5800
Wire Wire Line
	6500 5800 7400 5800
Wire Wire Line
	7400 5800 7400 2550
Wire Wire Line
	7400 2550 6350 2550
Wire Wire Line
	5000 6050 6400 6050
Wire Wire Line
	6400 6050 6400 5700
Wire Wire Line
	6400 5700 7900 5700
Wire Wire Line
	7900 5700 7900 3950
Wire Wire Line
	7900 3950 8600 3950
Wire Wire Line
	5000 6150 6300 6150
Wire Wire Line
	6300 6150 6300 5600
Wire Wire Line
	6300 5600 7800 5600
Wire Wire Line
	7800 5600 7800 3650
Wire Wire Line
	7800 3650 8600 3650
Wire Wire Line
	5000 6250 6200 6250
Wire Wire Line
	6200 6250 6200 5500
Wire Wire Line
	6200 5500 7700 5500
Wire Wire Line
	7700 5500 7700 3350
Wire Wire Line
	7700 3350 8600 3350
Wire Wire Line
	3850 5850 3750 5850
Wire Wire Line
	3750 5850 3750 5650
Wire Wire Line
	3750 5650 6100 5650
Wire Wire Line
	6100 5650 6100 5400
Wire Wire Line
	6100 5400 7600 5400
Wire Wire Line
	7600 5400 7600 1550
Wire Wire Line
	7600 1550 8600 1550
Wire Wire Line
	3850 5750 3650 5750
Wire Wire Line
	3650 5750 3650 5600
Wire Wire Line
	3650 5600 6000 5600
Wire Wire Line
	6000 5600 6000 5300
Wire Wire Line
	6000 5300 7500 5300
Wire Wire Line
	7500 5300 7500 2650
Wire Wire Line
	7500 2650 6350 2650
Wire Wire Line
	5000 4750 7300 4750
Wire Wire Line
	7300 4750 7300 2950
Wire Wire Line
	7300 2950 8600 2950
Wire Wire Line
	5000 4850 7200 4850
Wire Wire Line
	7200 4850 7200 2850
Wire Wire Line
	7200 2850 8400 2850
Wire Wire Line
	8400 2850 8400 2650
Wire Wire Line
	8400 2650 8600 2650
Wire Wire Line
	5000 4950 7100 4950
Wire Wire Line
	7100 4950 7100 2750
Wire Wire Line
	7100 2750 8200 2750
Wire Wire Line
	8200 2750 8200 2350
Wire Wire Line
	8200 2350 8600 2350
Wire Wire Line
	3850 4550 3700 4550
Wire Wire Line
	3700 4550 3700 4300
Wire Wire Line
	3700 4300 7000 4300
Wire Wire Line
	7000 4300 7000 2050
Wire Wire Line
	7000 2050 8600 2050
Wire Wire Line
	3850 4450 3600 4450
Wire Wire Line
	3600 4450 3600 4200
Wire Wire Line
	3600 4200 6700 4200
Wire Wire Line
	6700 4200 6700 2750
Wire Wire Line
	6700 2750 6350 2750
$EndSCHEMATC