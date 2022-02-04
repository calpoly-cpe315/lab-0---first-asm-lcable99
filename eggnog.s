    .global	main
main:
    // pre-increment the stack point to create space for two 8-byte registers
    // link register (x30), and frame pointer (x29), and store them.
	stp	x29, x30, [sp, -16]!

    // Load the argument and perform the call. Like 'printf("...")' in C.
	ldr	x0, =haiku1
	bl	printf
	ldr	x0, =haiku2
	bl	printf
	ldr	x0, =haiku3
	bl	printf

    // initialize the return value in the return register
	mov	x0, 0

    // restore the registers and post-decrement 
    // the stack pointer for consistency
	ldp	x29, x30, [sp], 16

    // return from the call
	ret

haiku1:
	.asciz "Eggnog for winter.\n"

haiku2:
	.asciz "Why is it not all year round?\n"

haiku3:
	.asciz "Yet a saddened truth.\n"
