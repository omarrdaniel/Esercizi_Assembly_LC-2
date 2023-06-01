	.orig x3000
;es variante 2
	AND r0,r0,#0
	AND r1,r1,#0
	AND r2,r2,#0
	AND r3,r3,#0
	AND r4,r4,#0
	AND r5,r5,#0
	LEA r0,array
	AND r6,r6,#0
	LEA r6,arraye
	LD r1,num
	NOT r1,r1
	ADD r1,r1,#1
	JSR trova
fine	brnzp fine

array	.fill 42
	.fill 32
	.fill -71
	.fill 24
arraye	.fill 5
num	.fill 24

;sottoprogramma
trova	ADD r0,r0,#0

ciclo	LDR r2,r0,#0
	LDR r4,r6,#0
	BRZ notf
	ADD r3,r2,r1
	BRZ found
	ADD r5,r4,r1
	BRZ found
	ADD r0,r0,#1
	ADD r6,r6,#-1
	brnzp ciclo

notf	AND r0,r0,#0
	AND r3,r3,#0
	AND r2,r2,#0
	AND r4,r4,#0
	AND r5,r5,#0
	AND r6,r6,#0
	RET

found	AND r0,r0,#0
	ADD r0,r0,#1
	AND r3,r3,#0
	AND r2,r2,#0
	AND r4,r4,#0
	AND r5,r5,#0
	AND r6,r6,#0
	RET


	.end