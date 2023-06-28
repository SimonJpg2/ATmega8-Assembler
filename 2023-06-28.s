;+----------------------------------------------------------------------
;| Title		: myAVR Grundgerüst für ATmega8
;+----------------------------------------------------------------------
;| Funktion		: Alle LED's mit beiden Tastern aus und an schalten.
;| Schaltung	: T1=PD2, T2=PD3, L1=PB0, L2=PB1, L3=PB2
;+----------------------------------------------------------------------
;| Prozessor	: ATmega8
;| Takt		: 3,6864 MHz
;| Sprache       	: Assembler
;| Datum         	: 28.06.2023
;| Version       	: ...
;| Autor         	: SimonJpg
;+----------------------------------------------------------------------
.include	"AVR.H"
;------------------------------------------------------------------------
;Reset and Interrupt vector             ;VNr.  Beschreibung
	rjmp	main	;1   POWER ON RESET
	reti		;2   Int0-Interrupt
	reti		;3   Int1-Interrupt
	reti		;4   TC2 Compare Match
	reti		;5   TC2 Overflow
	reti		;6   TC1 Capture
	reti		;7   TC1 Compare Match A
	reti		;8   TC1 Compare Match B
	reti		;9   TC1 Overflow
	reti		;10  TC0 Overflow
	reti		;11  SPI, STC Serial Transfer Complete
	reti		;12  UART Rx Complete
	reti		;13  UART Data Register Empty
	reti		;14  UART Tx Complete
	reti		;15  ADC Conversion Complete
	reti		;16  EEPROM Ready
	reti		;17  Analog Comparator
	reti		;18  TWI (I²C) Serial Interface
	reti		;19  Store Program Memory Ready
;------------------------------------------------------------------------
;Start, Power ON, Reset
main:	ldi	r16,lo8(RAMEND)
	out	SPL,r16
	ldi	r16,hi8(RAMEND)
	out	SPH,r16
	;Hier Init-Code eintragen.
		
	cbi	DDRD,2	; Eingang T1
	cbi	DDRD,3	; Eingang T2
	
	sbi	PORTD,2	; Pullup T1
	sbi	PORTD,3	; Pullup T2
	
	sbi	DDRB,0	; Ausgang LED-Rot
	sbi	DDRB,1	; Ausgang LED-Gelb
	sbi	DDRB,2	; Ausgang LED-Grün
;------------------------------------------------------------------------
mainloop:	
	in	r17,PIND	; Werte Eingang in r17 laden
	andi	r17,0b00000100	; AND Vergleich T1
	breq	Toggle_LED	; Funktionsaufruf bei Tastendruck
	
	in	r17,PIND	; Werte Kontakte D in r17 
	andi	r17,0b00001000	; AND Vergleich T2
	breq	Toggle_LED	; Funktionsaufruf bei Tastendruck
	
	rjmp	mainloop
;------------------------------------------------------------------------
Toggle_LED:
	in	r16,PINB	; Wert der LED's in r16 laden
	com	r16	; Wert umkehren (Aus wird zu an / an wird zu aus)
	out	PORTB,r16	; Ausgabe an LED's
;------------------------------------------------------------------------	