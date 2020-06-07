/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 *
 * What is the 10 001st prime number?
 */

.cstring
format: .asciz "%ld\n"

.text
.globl _main

_is_prime:
    cmpq $2, %rdi
    je 2f
    jb 1f
    movq %rdi, %rax
    andq $1, %rax
    jz 1f
    cvtsi2sd %rdi, %xmm0
    sqrtsd %xmm0, %xmm0
    cvtsd2si %xmm0, %rsi
    movq $3, %rcx
0:
    cmpq %rcx, %rsi
    jb 2f
    movq %rdi, %rax
    xorq %rdx, %rdx
    divq %rcx
    testq %rdx, %rdx
    jz 1f
    addq $2, %rcx
    jmp 0b
1:
    xorq %rax, %rax
    retq
2:
    movq $1, %rax
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %r12, %r12
    xorq %r13, %r13
0:
    cmpq $10000, %r12 
    ja 1f
    incq %r13
    movq %r13, %rdi
    callq _is_prime
    testq %rax, %rax
    jz 0b
    incq %r12
    jmp 0b
1:
    leaq format(%rip), %rdi
    movq %r13, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
