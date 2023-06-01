	.orig	x3000

	lea	r0,arrays
	lea	r1,arraye
	ld	r2,num
	jsr	CONTA_UNDER
stop	brnzp	stop

num	.fill	-32760
arrays	.fill	56
	.fill	-8
	.fill	0
	.fill	-9
arraye	.fill	-11

;qui inizio sottoprogramma
;*******************************************

CONTA_UNDER

	st	r3,sr3
	st	r4,sr4
	st	r5,sr5
	st	r6,sr6
	st	r7,sr7
	and	r3,r3,#0
	and	r4,r4,#0
	not	r1,r1
	add	r1,r1,#1

ciclo	add	r4,r0,r1
	brp	fine
	ldr	r5,r0,#0
	brn	neg
	add	r5,r5,r2
	str	r5,r0,#0
	add	r0,r0,#1
	brnzp	ciclo

neg	add	r5,r5,r2
	brp	uf
	str	r5,r0,#0
	add	r0,r0,#1
	brnzp	ciclo

uf	add	r3,r3,#1
	str	r5,r0,#0
	add	r0,r0,#1
	brnzp	ciclo



fine	and	r2,r2,#0
	add	r2,r2,r3
	ld	r3,sr3
	ld	r4,sr4
	ld	r5,sr5
	ld	r6,sr6
	ld	r7,sr7
	ret


sr3	.blkw	1
sr4	.blkw	1
sr5	.blkw	1
sr6	.blkw	1
sr7	.blkw	1

;fine sottoprogramma
;*****************************************************

	.end