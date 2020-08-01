/*
 * The first two consecutive numbers to have two distinct prime factors are:
 * 
 * 14 = 2 × 7
 * 15 = 3 × 5
 * 
 * The first three consecutive numbers to have three distinct prime factors are:
 * 
 * 644 = 2² × 7 × 23
 * 645 = 3 × 5 × 43
 * 646 = 2 × 17 × 19.
 * 
 * Find the first four consecutive integers to have four distinct prime factors
 * each. What is the first of these numbers?
 */

.cstring
format: .asciz "%ld\n"

.text
.globl _main

_count_distinct_divisors:
    xorq %rcx, %rcx
    movq $2, %rsi
0:
    cmpq %rdi, %rsi
    ja 6f
    movq %rdi, %rax
    xorq %rdx, %rdx
    divq %rsi
    testq %rdx, %rdx
    jz 4f
    incq %rsi
    jmp 0b
4:
    movq %rax, %rdi
    xorq %rdx, %rdx
    divq %rsi
    testq %rdx, %rdx
    jz 4b
    incq %rcx
    jmp 0b
6:
    movq %rcx, %rax
    retq
    

_main:
    pushq %rbp
    movq %rsp, %rbp

    xorq %r12, %r12
    xorq %r13, %r13

0:
    cmpq $4, %r13
    jae 4f
    movq %r12, %rdi
    callq _count_distinct_divisors
    cmpq $4, %rax
    je 1f
    xorq %r13, %r13
    jmp 2f
1:
    incq %r13
2:
    incq %r12
    jmp 0b
4:
    subq $4, %r12
    leaq format(%rip), %rdi
    movq %r12, %rsi
    callq _printf
    xorq %rax, %rax

    popq %rbp
    retq
