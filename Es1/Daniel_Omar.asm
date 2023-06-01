	.orig x3000
;esercizio 1
	AND r1,r1,#0	;azzero registro r1
	AND r2,r2,#0	;azzero r2
	AND r0,r0,#0	;azzero r0
	LD r1,num1	;carico l'indirizzo di memoria di num1 in r1
	LD r2,num2	;carico l'indirizzo di memoria num2 in r2
	JSR confr	;jump to subroutine "confr" addr-->r7
fine	brnzp fine	;salto incondizionato a fine programma
num1	.fill 20	;fill area di memoria label num1 con n=20
num2	.fill 43	;fill area di memoria label num2 con n=43


;sottoprogramma
confr	not r2,r2	;complemento a 1 r2
	add r2,r2,#1	;complemento a 2 r2
	add r3,r1,r2	;sottrazione r1-r2
	brz zero	;salto se CC = Z
	brn neg		;salto se CC = N
	brp pos		;salto se CC = P
zero	ADD r0,r0,#0	;se n1=n2 metto 0-->r0
	AND r3,r3,#0	;azzero r3
	RET		;ritorno al chiamante
neg	ADD r0,r0,#-1	;se n1<n2 metto -1-->r0
	AND r3,r3,#0	;azzero r3
	RET		;ritorno al chiamante
pos	ADD r0,r0,#1	;se n1>n2 metto 1-->r0
	AND r3,r3,#0	;azzero registro r3
	RET		;ret al chiamante r7-->PC
	.end