.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@1+2+3+...n
	@r2=x
	@return x+fibonacci(x-1)

LL1	:
	push  {r1,r2,LR}
	cmp   r0,#1			@if(x==1)
	ITT   EQ
	moveq r0,#1
	popeq {r1,r2,pc}
	mov   r2,r0			@save x
	sub   r0,r0,#1		@fibonacci(x-1)
	bl    LL1
	add   r1,r2,r0		@x+fibonacci(x-1)
	mov   r0,r1			
	pop   {r1,r2,pc}



	.size fibonacci, .-fibonacci
	.end