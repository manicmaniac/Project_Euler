/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

.const
format: .asciz "%ld\n"

.text
.globl _main

_gcd:
    testq %rsi, %rsi
    jz 0f
    movq %rdi, %rax
    xorq %rdx, %rdx
    divq %rsi
    movq %rsi, %rdi
    movq %rdx, %rsi
    jmp _gcd
0:
    movq %rdi, %rax
    retq

_lcm:
    movq %rdi, %r8
    movq %rsi, %r9
    callq _gcd
    movq %rax, %rcx
    movq %r8, %rax
    xorq %rdx, %rdx
    mulq %r9
    divq %rcx
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    movq $20, %r12
    movq $1, %r13
0:
    movq %r13, %rdi
    movq %r12, %rsi
    callq _lcm
    movq %rax, %r13
    decq %r12
    jnz 0b
    leaq format(%rip), %rdi
    movq %r13, %rsi
    callq _printf
    popq %rbp
    retq
