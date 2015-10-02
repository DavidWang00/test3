.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@
	@r1=x
	@return fibonacci(x-1) +fibonacci(x-2)

LL1	:
	push  {r1,r2,r3,LR}
	cmp   r0,#1			@if(x==1)
	ITT   EQ
	moveq r0,#1
	popeq {r1,r2,r3,pc}
	
	cmp   r0,#2			@if(x==2)
	ITT   EQ
	moveq r0,#1
	popeq {r1,r2,r3,pc}	
	
	mov   r1,r0			@save x
	sub   r0,r0,#1		@fibonacci(x-1)
	bl    LL1
	
	mov   r3,r0         @x0=x-1
	mov   r0,r1
	sub   r0,r0,#2		@fibonacci(x-2)
	bl    LL1

	add   r0,r3,r0		@fibonacci(x-1)+fibonacci(x-2)   x0+x1
		
	pop   {r1,r2,r3,pc}



	.size fibonacci, .-fibonacci
	.end