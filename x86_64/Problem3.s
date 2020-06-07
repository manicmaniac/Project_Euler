/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 */

.cstring
format: .asciz "%ld\n"

.text
.globl _main

_max_factor:
    movq $2, %rcx
0:
    cmpq %rdi, %rcx
    jae 2f
    movq %rdi, %rax
    xorq %rdx, %rdx
    divq %rcx
    testq %rdx, %rdx
    jz 1f
    incq %rcx
    jmp 0b
1:
    movq %rax, %rdi
    jmp 0b
2:
    movq %rcx, %rax
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    movq $600851475143, %rdi
    callq _max_factor
    leaq format(%rip), %rdi
    movq %rax, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
