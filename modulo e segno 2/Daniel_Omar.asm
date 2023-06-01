	.orig x3000

	lea r0,array
	jsr somma

stop	brnzp stop

array	.fill b1000000000001100	;-12 (modulo e segno - 12 in binario con un 1 davanti a 16 bit (registro a 16bit)
	.fill b1000000000000111 ;-7
	.fill b0000000000001100 ;12
	.fill b0000000000000000

;*********************************************************

somma
	st r2,sr2	;memorizzo il contenuto di r2 in un'area di memoria per sicurezza
	AND r2,r2,#0	;adesso azzero R2
	
ciclo

	ldr r1,r0,#0	;carico in r1 il valore puntato da r0 (array)
	brz fine

	add r2,r2,r1	;sommo ogni volta r1 in r2

	add r0,r0,#1	;incremento contatore array

	brnzp ciclo

fine
	ret

sr2	.blkw 1
;*************************************************************

	.end