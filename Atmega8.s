;+----------------------------------------------------------------------
;| Title		: myAVR Grundgerüst für ATmega8
;+----------------------------------------------------------------------
;| Funktion		: 3 LED's mit Hilfe von zwei Tastern individuell ansteuern.
;| Schaltung		: T0 = PB0, T1 = PB1, LED0 = PC0, LED1 = PC1, LED2 = PC2.
;+----------------------------------------------------------------------
;| Prozessor		: ATmega8
;| Takt			: 3,6864 MHz
;| Sprache       	: Assembler
;| Datum         	: ...
;| Version       	: v0.1.0
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
	cbi	DDRB,0	; Eingang Taster 1
	cbi	DDRB,1	; Eingang Taster 2
	sbi	DDRC,0	; Ausgang LED rot
	sbi	DDRC,1	; Ausgang LED grün
	sbi	DDRC,2	; Ausgang LED gelb
	sbi	PORTB,0	; Pullup Taster 1
	sbi	PORTB,1	; Pullup Taster 2
;------------------------------------------------------------------------
mainloop:
	;Hier den Quellcode eintragen.
	in	r16,PINB	; Werte Kontakte B in r16 laden
	cpi	r16,0b00000011	; Vergleich r16 mit Konstante
	breq	ALAUS		; Verzweigung, wenn Z Flag gesetzt (Kein Taster gedrückt)
	cpi	r16,0b00000000	; Vergleich r16 mit Konstante
	breq	ALAN		; Verzweigung, wenn Z Flag gesetzt (Beide Taster gedrückt)
	in 	r18,PINB	; Werte Kontakte B in r18 laden
	andi	r18,0b00000001	; Logische UND verknüpfung mit Konstante
	out	PORTC,r18	; Ausgabe r18 an PORTC
	in	r19,PINB	; Werte von PINB an r19 übergeben
	andi	r19,0b00000010	; Logische UND verknüpfung mit Konstante
	lsl	r19		; Logische Verschiebung r19 um eins nach links
	out	PORTC,r19	; Ausgabe r19 an PORTC
	rjmp	mainloop
;------------------------------------------------------------------------
ALAUS: 
	ldi	r17,0b00000000	; Alle LED's aus
	out	PORTC,r17	; Ausgabe an PORTC
	ret			; Subroutine Return
;------------------------------------------------------------------------
ALAN:
	sbi	PORTC,1		; LED gelb an
	ret			; Subroutine Return
