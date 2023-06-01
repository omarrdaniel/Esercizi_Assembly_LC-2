	.orig x3000
;es 2 (decresc)
	AND r0,r0,#0
	AND r1,r1,#0
	AND r2,r2,#0
	AND r3,r3,#0
	LEA r0,array
	LEA r1,arraye
	JSR ordina
fine	brnzp fine

array	.fill 1
	.fill 2
	.fill 3
	.fill 4
arraye	.fill 5


;sottoprogramma

ordina	ST r2,mem1	;in mem1 metto r2
	ST r3,mem2

ciclo	LDR r2,r0,#0
	LDR r3,r1,#0
	STR r2,r1,#0
	STR r3,r0,#0
	ADD r0,r0,#1
	ADD r1,r1,#-1
	NOT r2,r1
	ADD r2,r2,#1
	ADD r2,r0,r2
	brn ciclo
	RET

mem1	.blkw 1
mem2	.blkw 1
	.end