	.orig	x3000
	lea	r0,array
	lea	r1,strr1
	ldr	r1,r1,#0
	jsr	OR_ARRAY
stop	brnzp	stop


array	.fill	b0000111100001111
	.fill	b0011001100110011
	.fill	b1100110011001100
	.fill	b0000000000000000
strr1	.fill	b1111000011110000
;*******************************************************************
;qui sottoprogramma

OR_ARRAY
	st	r2,sr2
	st	r3,sr3
	st	r4,sr4
	st	r5,sr5
	st	r6,sr6
	not	r3,r1

ciclo
	ldr	r5,r0,#0
	brz	fine
	not	r2,r5
	and	r4,r2,r3
	not	r4,r4
	str	r4,r0,#0
	add	r0,r0,#1
	brnzp	ciclo

fine
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