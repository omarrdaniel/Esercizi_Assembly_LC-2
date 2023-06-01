	.orig	x3000
	lea	r0,A
	lea	r1,A2
	ld	r2,N
	jsr	SOMMA_SE
stop	brnzp	stop

A	.fill	-56
	.fill	15
	.fill	-9
	.fill	15
	.fill	0

A2	.fill	5
	.fill	20
	.fill	5
	.fill	20

N	.fill	15
;*************************************
SOMMA_SE

	ld	r3,st3
	ld	r4,st4
	ld	r5,st5	
	not	r2,r2
	add	r2,r2,#1

ciclo	ldr	r3,r0,#0
	brz	fine
	ldr	r4,r1,#0
	add	r3,r3,r2
	brz	uguali
	add	r0,r0,#1
	add	r1,r1,#1
	brnzp	ciclo

uguali 	add	r5,r5,r4
	add	r0,r0,#1
	add	r1,r1,#1
	brnzp	ciclo


fine	and	r0,r0,#0
	add	r0,r5,#0	
	st	r3,st3
	st	r4,st4
	st	r5,st5
	ret

st3	.blkw	1
st4	.blkw	1
st5	.blkw	1
;*********************************

	.end