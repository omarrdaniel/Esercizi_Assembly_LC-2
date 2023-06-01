	.orig	x3000
	lea	r0,arrays
	lea	r1,arraye
	add	r2,r2,#15
	jsr	CONTA_SE
stop	brnzp	stop

arrays	.fill	-56
	.fill	15
	.fill	-9
	.fill	-15
	.fill	0
	.fill	15
arraye	.fill	-15

;********************************************

CONTA_SE
	st	r2,st2
	st	r3,st3
	st	r4,st4
	st	r5,st5
	st	r6,st7
	st	r7,st7

	and	r3,r3,#0	;contatore numero
	and	r4,r4,#0	;contatore opposto numero
	not	r1,r1
	add	r1,r1,#1	;faccio il complemento a 2 dell'ultimo indirizzo per capire se sono alla fine o no
	not	r2,r2
	add	r2,r2,#1



ciclo	add	r6,r0,r1
	brp	fine
	ldr	r5,r0,#0	;carico il primo elemento in r5
	add	r5,r5,r2
	brz	uguali
	not	r2,r2
	add	r2,r2,#1
	ldr	r5,r0,#0
	add	r5,r5,r2
	brz	opposto
	add	r0,r0,#1
	not	r2,r2
	add	r2,r2,#1
	brnzp	ciclo


uguali	add	r3,r3,#1	
	add	r0,r0,#1
	brnzp	ciclo

opposto	add	r4,r4,#1
	add	r0,r0,#1
	not	r2,r2
	add	r2,r2,#1
	brnzp	ciclo


fine	and	r0,r0,#0
	add	r0,r0,r3
	and	r1,r1,#0
	add	r1,r1,r4
	ld	r2,st2
	ld	r3,st3
	ld	r4,st4
	ld	r5,st5
	ld	r6,st6
	ld	r7,st7

	ret


st2	.blkw	1
st3	.blkw	1
st4	.blkw	1
st5	.blkw	1
st6	.blkw	1
st7	.blkw	1

;fine sottoprogramma
;*********************************************
	
	.end

