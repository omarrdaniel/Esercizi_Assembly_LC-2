	.orig	x3000
	and	r0,r0,#0
	lea	r0,stringa
	jsr CONV_MAIUS
stop	brnzp	stop




stringa	.stringz	"ciaoo"
;***************************************************************************

;qui sottoprogramma
CONV_MAIUS
	st	r1,sr1	;contiene la differenza tra lettera ascii della stringa e -32
	st	r2,sr2	;contiene ascii di Z per confronto se non è una lettera (-122)
	st	r3,sr3	;contiene la differenza per la trasformazione (-32)
	st	r4,sr4	;contiene codice ascii di a (-97)
	st	r5,sr5	;contiene contatore lettere cambiate
	st	r6,sr6	;contiene S[i]
	ld	r4,asciia
	ld	r3,diff
	add	r2,r0,#0
	and	r5,r5,#0	;azzero r5 per usarlo
	and	r1,r1,#0	;azzero registro 1 per usarlo
	ld	r2,asciiz


;ciclo per controllare tutte le lettere
ciclo
	ldr	r6,r0,#0	;carico in r6 la prima lettera
	brz	finestringa
;qui ciclo non finito
	add	r1,r6,r4	;r1 -> differenza tra lettera stringa e 97
	brn	notrasforma
;già maiuscola
	add	r1,r6,r2
	brp	notrasforma
;non è una lettera
;qui se minuscola, trasformo
	add	r6,r6,r3	;la trasformo in minuscola
	str	r6,r0,#0
	add	r5,r5,#1	;aggiungo 1 al contatore delle lettere modificate
	add	r0,r0,#1
	brnzp ciclo



;se trova CC a 0 come lettere, stringa finita e ret
finestringa	
	and	r0,r0,#0	;azzero r0
	add	r0,r5,#0	;r0 -> r5 (il contatore)
	ld	r1,sr1		;carico i registri per averli come prima
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4
	ld	r5,sr5
	ld	r6,sr6
	ret


;lettera già maiuscola, non trasformo
notrasforma
	add	r0,r0,#1	;passo alla prossima lettera
	brnzp	ciclo
	

sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
sr5	.blkw	1
sr6	.blkw	1
diff	.fill	-32
asciia	.fill	-97
asciiz	.fill	-122

;fine sottoprogramma
;***************************************************************************
	.end