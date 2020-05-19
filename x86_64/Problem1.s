# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

.data
format: .asciz "%d\n"

.text
.globl _main
_main:
    pushq %rbp
    movq %rsp, %rbp
    movl $999, %ecx
    movl $3, %r8d
    movl $5, %r9d
    xorl %esi, %esi
0:
    movl %ecx, %eax
    xorl %edx, %edx
    idivl %r8d
    testl %edx, %edx
    jnz 1f
    addl %ecx, %esi
    jmp 2f
1:
    movl %ecx, %eax
    xorl %edx, %edx
    idivl %r9d
    testl %edx, %edx
    jnz 2f
    addl %ecx, %esi
2:
    loop 0b
    leaq format(%rip), %rdi
    callq _printf
    popq %rbp
    retq
