	.orig x3000
;es variante 1
	AND r0,r0,#0	;azzero registro r0
	AND r2,r2,#0
	AND r3,r3,#0
	LEA r0,array
	LD r1,num
	NOT r1,r1
	ADD r1,r1,#1
	JSR ciclo
fine	brnzp fine

ciclo	LDR r2,r0,#0
	BRZ notf
	ADD r3,r2,r1
	BRZ found
	ADD r0,r0,#1
	brnzp ciclo
		
notf	AND r0,r0,#0
	AND r3,r3,#0
	AND r2,r2,#0
	RET

found	AND r0,r0,#0
	ADD r0,r0,#1
	AND r3,r3,#0
	AND r2,r2,#0
	RET

array	.fill 42
	.fill 32
	.fill -71
	.fill 24
	.fill 5

num	.fill 24
	.end