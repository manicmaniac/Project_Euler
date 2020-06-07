/*
 * A palindromic number reads the same both ways. The largest palindrome made from
 * the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

.cstring
format: .asciz "%ld\n"

.text
.globl _main

_make_palindrome:
    movq $10, %r10
    movq %rdi, %rcx
0:
    testq %rdi, %rdi
    jz 1f
    movq %rdi, %rax
    xorq %rdx, %rdx
    divq %r10
    movq %rax, %rdi
    movq %rdx, %r9
    movq %rcx, %rax
    mulq %r10
    movq %rax, %rcx
    addq %r9, %rcx
    jmp 0b
1:
    movq %rcx, %rax
    retq

_is_product_of_3_digits:
    movq $1000, %rcx
0:
    decq %rcx
    cmpq $100, %rcx
    jb 1f
    movq %rdi, %rax
    xorq %rdx, %rdx
    divq %rcx
    testq %rdx, %rdx
    jnz 0b
    cmpq $100, %rax
    jb 0b
    cmpq $999, %rax
    ja 0b
    movq $1, %rax
    retq
1:
    xorq %rax, %rax
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    movq $1000, %r12
0:
    decq %r12
    movq %r12, %rdi
    callq _make_palindrome
    movq %rax, %r13
    movq %rax, %rdi
    callq _is_product_of_3_digits
    testq %rax, %rax
    jz 0b
    leaq format(%rip), %rdi
    movq %r13, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
