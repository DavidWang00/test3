.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:

LL1	:
	push  {LR}
	cmp   r0,#1
	ITTE  EQ
	moveq r0,#0
	popeq {pc}
	cmpNE r0,#2
	ITT   EQ
	moveq r0,#1
	popeq {pc}
	push  {r0}
	sub   r0,r0,#1
	BL	  LL1
LL2:
	mov   r1,r0
	pop   {r0}
	push  {r1}
	sub   r0,r0,#2
	BL    LL1
	mov   r2,r0
	pop   {r1}
	add   r0,r1,r2
	pop   {pc}

	.size fibonacci, .-fibonacci
	.end
