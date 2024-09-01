;
;	>> Expanding Universe - Variant 1 <<
;
;	A 32-byte intro for the Atari 800 XL (c) 2010-10-19 by JAC!
;
;	There already was evidence that the universe is expanding permanently.
;	Now there is also evidence that it originally started with 32 bytes ;-)
;
;	This one shows a twirl of particles which expands with every iteration.
;	In the end, it will become a chaotic star field.
;
;	At certain times during the expansion, there is a balance between dark matter
;	and the ordinary matter is broken. A changing background color indicates this.
;	If the background changes back to black again, it is saved to turn off the
;	demo without destroying the earth.
;
;	This version uses a black background at the expense of having a group 
;	of smaller, even more chaotic Atari particles in the upper quarter.
;
;	Since the zero-page content is destroyed completely, you must cold-start your Atari.
;	Since the zero page also contains frame counters, the effect is always a different
;	depending on how long the machine has already been running. 
;
;	Created using WUDSN IDE. Visit https://www.wudsn.com to increase my hit counter.


	org $2000
loop	inx		;Next double scanline
wait	cpx $d40b	;Wait for next double scanline
	beq wait
	stx $d012	;Set missile 0 rainbow color
	and #1		;Use lowest bit of previous line
	adc $00,x	;Carry will be set due to CPX
	sta $00,x	;ZP,x will wrap at $ff to $00
	sta $d004	;Set missle 0 horizontal position
	asl $d402	;Reset DL low pointer to force blank line
	asl $d011	;This will put "10" into bit 1 and 0 because $d011 is GRAFM
	bcc loop	;Carry is cleared due to ASL above

	run loop
 