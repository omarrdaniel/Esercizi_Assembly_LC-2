	.orig x3000

	ld r0,num
	jsr modstco2

fine	brnzp fine

num	.fill b1000000000001100	;-12 (modulo e segno - 12 in binario con un 1 davanti a 16 bit (registro a 16bit)

;*********************************************************

modstco2

	and r0,r0,r0	;verifico segno di r0
	brn conv	;se negativo converto
	ret		;se positivo lascio com'è

conv
	st r1,salvar1	;memorizzo il contenuto di r1 in un area di memoria per non alterarla
	ld r1,msb
	and r0,r0,r1	;faccio and tra mio num e msb così da togliere l'1 più significativo

	not r0,r0
	add r0,r0,#1	;compl a 2 per fargli tornare il -
	ld r1,salvar1	;carico in r1 il contenuto precedente per non alterare
	ret

msb	.fill b0111111111111111	;devo azzerrare bit più significativo
salvar1	.blkw	1

;*************************************************************

	.end