	.orig	x3000
	lea	r0,arrays
	lea	r1,arraye
	jsr	CONTA_PARI_DISPARI
stop	brnzp	stop


arrays	.fill	45
	.fill	32
	.fill	-4
arraye	.fill	7
;*******************************************************************
;qui sottoprogramma

CONTA_PARI_DISPARI
	st	r2,sr2
	st	r3,sr3
	st	r4,sr4
	st	r5,sr5
	st	r6,sr6
	and	r5,r5,#0	;contatore pari
	and	r6,r6,#0	;contatore dispari
	
	
ciclo
	not	r4,r0
	add	r4,r4,#1
	add	r4,r4,r1
	brn	finito
	ldr	r2,r0,#0
	and	r4,r2,#1
	brz	pari
;qui dispari
	add	r6,r6,#1
	add	r0,r0,#1
	brnzp	ciclo

pari
	add	r0,r0,#1
	add	r5,r5,#1
	brnzp	ciclo

finito
	and	r0,r0,#0
	and	r1,r1,#0
	add	r0,r0,r5
	add	r1,r1,r6
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4
	ld	r5,sr5
	ld	r6,sr6
	ret



sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
sr5	.blkw	1
sr6	.blkw	1
;fine sottoprogramma
;*******************************************************************
	.end