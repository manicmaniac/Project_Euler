/*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a^2 + b^2 = c^2
 *
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

.const
format: .asciz "%ld\n"

.text
.globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp
    movq $1, %rdi
    movq $1, %rsi
0:
    movq %rdi, %rax
    addq %rsi, %rax
    mulq %rdi
    cmpq $500, %rax
    je 2f
    cmpq %rdi, %rsi
    jb 1f
    incq %rdi
    movq $1, %rsi
1:
    incq %rsi
    jmp 0b
2:
    movq %rdi, %rax
    mulq %rsi
    shlq $1, %rax
    movq %rax, %r12
    movq %rsi, %rax
    mulq %rax
    mulq %rax
    movq %rax, %rsi
    movq %rdi, %rax
    mulq %rax
    mulq %rax
    subq %rsi, %rax
    mulq %r12
    leaq format(%rip), %rdi
    movq %rax, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
