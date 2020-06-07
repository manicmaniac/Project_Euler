/*
 * The sum of the squares of the first ten natural numbers is,
 *
 * 12 + 22 + ... + 102 = 385
 * The square of the sum of the first ten natural numbers is,
 *
 * (1 + 2 + ... + 10)2 = 552 = 3025
 * Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
 *
 * Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */

.cstring
format: .asciz "%ld\n"

.text
.globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %r12, %r12
    xorq %r13, %r13
    movq $100, %rcx
0:
    movq %rcx, %rax
    mulq %rax
    addq %rax, %r12
    addq %rcx, %r13
    loop 0b
    movq %r13, %rax
    mulq %rax
    subq %r12,  %rax
    leaq format(%rip), %rdi
    movq %rax, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
