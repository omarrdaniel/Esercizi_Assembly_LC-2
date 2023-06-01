	.orig x3000
;esercizio 1
	AND r0,r0,#0
	AND r1,r1,#0	
	AND r2,r2,#0
	AND r3,r3,#0
	AND r4,r4,#0
	AND r5,r5,#0
	AND r6,r6,#0
	ADD r1,r1,#5
	brn neg1
	brp pos1
neg1	ADD r4,r4,#-1
pos1	ADD r5,r5,#1
	ADD r2,r2,#4
	brn neg2
	brn pos2
neg2	ADD r4,r4,#-1
pos2	ADD r5,r5,#1
	ADD r6,r4,r5
	brp ou
ou	ADD r0,r0,#1
	brn ouy
	brnzp fine
ouy	ADD r0,r0,#-1
	JSR somma
fine	brnzp fine


;sottoprogramma
somma	add r3,r1,r2
	RET
		
	.end