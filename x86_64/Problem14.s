/*
 * The following iterative sequence is defined for the set of positive integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following sequence:
 *
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 *
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains
 * 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 * that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */

.cstring
format: .asciz "%ld\n"

.bss
limit = 1000000
.lcomm cache, limit * 2

.text
.globl _main

_next_collatz:
    movq %rdi, %rax
    andq $1, %rax
    jz 0f
    movq %rdi, %rax
    shl %rax
    addq %rdi, %rax
    incq %rax
    retq
0:
    movq %rdi, %rax
    shr %rax
    retq

_find_longest_collatz:
    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15
    xorq %r14, %r14
    xorw %r15w, %r15w
    leaq cache(%rip), %rbx
    movq $1, %r12
0:
    cmpq $limit, %r12
    ja 5f
    movw $1, %r13w
    movq %r12, %rdi
1:
    cmpq $1, %rdi
    jbe 3f
    callq _next_collatz
    movq %rax, %rdi
    cmpq $limit, %rdi
    ja 2f
    movw (%rbx, %rdi, 2), %ax
    testw %ax, %ax
    jz 2f
    addw %ax, %r13w
    jmp 3f
2:
    incw %r13w
    jmp 1b
3:
    cmpw %r15w, %r13w
    jbe 4f
    movq %r12, %r14
    movw %r13w, %r15w
4:
    movw %r13w, (%rbx, %r12, 2)
    addq $2, %r12
    jmp 0b
5:
    movq %r14, %rax
    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %rbx
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    callq _find_longest_collatz
    leaq format(%rip), %rdi
    movq %rax, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
