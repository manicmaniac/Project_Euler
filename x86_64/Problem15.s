/*
 * Starting in the top left corner of a 2×2 grid, there are 6 routes (without
 * backtracking) to the bottom right corner.
 *
 * [p_015]
 *
 * How many routes are there through a 20×20 grid?
 */

.cstring
format: .asciz "%.lf\n"

.text
.globl _main

_ncr:
    movq $1, %rax
    cvtsi2sd %rax, %xmm0
    subq %rsi, %rdi
0:
    movq %rdi, %rax
    addq %rsi, %rax
    cvtsi2sd %rax, %xmm1
    mulsd %xmm1, %xmm0
    decq %rdi
    jnz 0b
1:
    cvtsi2sd %rsi, %xmm1
    divsd %xmm1, %xmm0
    decq %rsi
    jnz 1b
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    movq $40, %rdi
    movq $20, %rsi
    callq _ncr
    leaq format(%rip), %rdi
    movq %rax, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
