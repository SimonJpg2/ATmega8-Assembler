;+----------------------------------------------------------------------
;| Title		: myAVR Grundgerüst für ATmega8
;+----------------------------------------------------------------------
;| Funktion		: ...
;| Schaltung	: ...
;+----------------------------------------------------------------------
;| Prozessor	: ATmega8
;| Takt		: 3,6864 MHz
;| Sprache       	: Assembler
;| Datum         	: ...
;| Version       	: ...
;| Autor         	: ...
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

	ldi	r20,0b11111111
	out	DDRB,r20

	ldi	r16,0b11111111	;PORTB auf Ausgang
	out	DDRB,r16	; Alle B ports auf Ausgang setzen
	
	cbi	DDRC,2	; Bit 2 auf Eingang für Taster
	sbi	PORTC,2	; Pullup
	

	;Hier Init-Code eintragen.
;------------------------------------------------------------------------
mainloop:	wdr
	cbi PORTC,0	;Wert bei Taster nicht gedrückt
	sbis PINC,2	; Auswertung Taster gedrückt
	rcall motor	; Motor drehen, wenn Taster gedrückt
	

	rjmp	mainloop	; Mainloop
;------------------------------------------------------------------------

motor:
	ldi	r20,0b00000101 	; Halbdrehung 1
	out	PORTB,r20	; Ausgabe 
	rcall	zeit
	

	ldi	r20,0b00000001	; Halbdrehung 2
	out	PORTB,r20	; Ausgabe
	rcall	zeit
	
	ldi	r20,0b00001001	; Halbdrehung 3
	out	PORTB,r20	; Ausgabe
	rcall	zeit

	ldi	r20,0b00001000	; Halbdrehung 4
	out	PORTB,r20	; Ausgabe
	rcall	zeit
	
	ldi	r20,0b00001010	; Halbdrehung 5
	out	PORTB,r20	; Ausgabe
	rcall	zeit	; Funktion zum warten

	ldi	r20,0b00000010	; Halbdrehung 6
	out	PORTB,r20	; Ausgabe
	rcall	zeit	; Funktion zum warten+

	ldi	r20,0b00000110	; Halbdrehung 7
	out	PORTB,r20	; Ausgabe
	rcall	zeit	; Funktion zum warten

	ldi	r20,0b00000100	; Halbdrehung 8
	out	PORTB,r20	; Ausgabe
	rcall	zeit	; Funktion zum warten

myWait_20ms:
	push	r16
	ldi	r16,13
myWait_20ms_3:
	push	r16
	;ldi	r16,95
myWait_20ms_2:
	push	r16
	;ldi	r16,255
myWait_20ms_1:
	dec	r16
	brne	myWait_20ms_1
	pop	r16
	dec	r16
	brne	myWait_20ms_2
	pop	r16
	dec	r16
	brne	myWait_20ms_3
	pop	r16
	ret
	
zeit:
	rcall	myWait_20ms	; Warteroutine (60ms)
