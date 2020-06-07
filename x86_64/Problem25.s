/*
 * Show HTML problem contentShow HTML problem content  [icon_info]Published on
 * Friday, 30th August 2002, 06:00 pm; Solved by 151673;
 * Difficulty rating: 5%
 * 
 * Problem 25
 * 
 * The Fibonacci sequence is defined by the recurrence relation:
 * 
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 * 
 * Hence the first 12 terms will be:
 * 
 *     F[1] = 1
 *     F[2] = 1
 *     F[3] = 2
 *     F[4] = 3
 *     F[5] = 5
 *     F[6] = 8
 *     F[7] = 13
 *     F[8] = 21
 *     F[9] = 34
 *     F[10] = 55
 *     F[11] = 89
 *     F[12] = 144
 * 
 * The 12th term, F[12], is the first term to contain three digits.
 * 
 * What is the index of the first term in the Fibonacci sequence to contain 1000
 * digits?
 */

.cstring
format: .asciz "%ld\n"

.const
log10_sqrt5_plus_0_5: .double 0.849485002168
log10_phi: .double 0.20898764025

.text
.globl _main

_fib_digits:
    cvtsi2sd %rdi, %xmm0
    mulsd log10_phi(%rip), %xmm0
    subsd log10_sqrt5_plus_0_5(%rip), %xmm0
    cvtsd2si %xmm0, %rax
    incq %rax
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %r12, %r12
0:
    incq %r12
    movq %r12, %rdi
    movq %r12, %r13
    callq _fib_digits
    cmpq $1000, %rax
    jb 0b
    leaq format(%rip), %rdi
    movq %r13, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
