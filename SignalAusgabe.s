;+----------------------------------------------------------------------
;| Title		: myAVR Grundgerüst für ATmega8
;+----------------------------------------------------------------------
;| Funktion		: Bestimmtes Signal erzeugen
;| Schaltung	: ...
;+----------------------------------------------------------------------
;| Prozessor	: ATmega8
;| Takt		: 3,6864 MHz
;| Sprache       	: Assembler
;| Datum         	: 01.11.2023
;| Version       	: v0.1.0
;| Autor         	: Simon Balcke
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
	
	cbi	DDRB,0	; PORTB0 auf Eingang T1
	cbi	DDRB,1	; PORTB1 auf Eingang T2
	sbi	PORTB,0	; Pullup
	sbi	PORTB,1	; Pullup
	sbi	DDRC,0	; PORTC0 auf Ausgang
;------------------------------------------------------------------------
mainloop:	
	;Hier den Quellcode eintragen.
	sbis	PINB,0	; Auswertung T1
	rjmp	__t1__	; Funktion t1
	
	sbis	PINB,1	; Auswertung T2
	rjmp	__t2__	; Funktion t2
	
	rjmp	mainloop	; Mainloop

; +-------------------------------------------------------------------------	
; | Warteroutine
; +-------------------------------------------------------------------------	

myWait_20ms:
	push	r16
	ldi	r16,13 
myWait_20ms_3:
	push	r16
	ldi	r16,95
myWait_20ms_2:
	push	r16
	ldi	r16,255
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

__t1__:
	sbi	PORTC,0     ; Signal auf high

	rcall	myWait_20ms ; +-----------------------------------------------
	rcall	myWait_20ms ; | Warteroutine 0,5s
	rcall	myWait_20ms ; +-----------------------------------------------
	rcall 	myWait_20ms
	rcall 	myWait_20ms
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms 
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	cbi	PORTC,0     ; Signal auf low
	
	rcall	myWait_20ms ; +-----------------------------------------------
	rcall	myWait_20ms ; | Warteroutine 1,5s
	rcall	myWait_20ms ; +-----------------------------------------------
	rcall	myWait_20ms
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	rjmp	mainloop
__t2__:

	sbi	PORTC,0     ; Signal auf high

	rcall	myWait_20ms ; +-----------------------------------------------
	rcall	myWait_20ms ; | Warteroutine 1,0s
	rcall	myWait_20ms ; +-----------------------------------------------
	rcall 	myWait_20ms
	rcall 	myWait_20ms
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms 
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	cbi	PORTC,0     ; Signal auf low
	
	rcall	myWait_20ms ; +-----------------------------------------------
	rcall	myWait_20ms ; | Warteroutine 1,0s
	rcall	myWait_20ms ; +-----------------------------------------------
	rcall	myWait_20ms
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms
	rcall	myWait_20ms 
	rcall	myWait_20ms
	
	rjmp 	mainloop