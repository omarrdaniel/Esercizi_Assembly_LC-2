	.orig	x3000
	lea	r0,array
	JSR	SOMMATORIA
stop	brnzp	stop


array	.fill	4
	.fill	2
	.fill	30000
	.fill	2
	.fill	15000
	.fill	0



;*****************************************************
;sottoprogramma

SOMMATORIA
	and	r2,r2,#0
	and	r3,r3,#0
	and	r4,r4,#0

ciclo	ldr	r1,r0,#0
	brz	fine
	brp	primo_pos
	add	r0,r0,#1
	ldr	r2,r0,#0
	brn	sec_neg
	add	r3,r1,r2
	add	r0,r0,#1
	brnzp	ciclo


primo_pos 
	add	r0,r0,#1
	ldr	r2,r0,#0
	brp	sec_pos
	add	r3,r1,r2
	brnzp	ciclo

sec_pos
	add	r3,r1,r2
	brn	over
	add	r0,r0,#1
	brnzp	ciclo

over
	add	r4,r4,#2
	brnzp	fine

sec_neg
	add	r3,r1,r2
	brp	under
	add	r0,r0,#1
	brnzp	ciclo

under
	add	r4,r4,#-2
	brnzp	fine


fine	;ld	ri,sri	i = indice matematico, faccio load di tutti i registri per riportare contesto iniziale
	add	r4,r4,#0
	brz	nonum
	ret

nonum	add	r3,r3,#0
	brp	sommapos
	brn	sommaneg

sommapos
	add	r4,r4,#1
	ret

sommaneg
	add	r4,r4,#-1
	ret

;*****************************************************************

	.end