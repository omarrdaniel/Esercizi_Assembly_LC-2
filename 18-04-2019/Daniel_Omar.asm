	.orig	x3000
	lea	r0,stringa
	JSR	MAIUSC
stop	brnzp	stop

stringa	.stringz	"LasiglaUSAsignificaUnitedStatesofAmerica"

;************************************************************

MAIUSC
	ld	r4,diff
	ld	r5,codzm
	and	r6,r6,#0


ciclo
	ldr	r1,r0,#0
	brz	fine
	add	r1,r1,r5
	brp	trasf
	add	r0,r0,#1
	brnzp	ciclo

trasf
	add	r1,r1,r4
	str	r1,r0,#0
	add	r0,r0,#1
	add	r6,r6,#1
	brnzp	ciclo


fine
	ret

diff	.fill	-32
codzm	.fill	-90

;*******************************************************

	.end