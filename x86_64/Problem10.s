/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */

.cstring
format: .asciz "%ld\n"

.bss
.lcomm array, 2000000
array_size = . - array

.text
.globl _main

_sieve:
    movw $0x101, (%rdi)
    cvtsi2sd %rsi, %xmm0
    sqrtsd %xmm0, %xmm0
    cvtsd2si %xmm0, %r8
    movq $1, %rcx
0:
    incq %rcx
    cmpq %rcx, %r8
    jbe 2f
    cmpb $0, (%rdi, %rcx)
    jne 0b
    movq %rcx, %rax
    mulq %rcx
    movq %rax, %r9
1:
    cmpq %r9, %rsi
    jb 0b
    movb $1, (%rdi, %r9)
    addq %rcx, %r9
    jmp 1b
2:
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    leaq array(%rip), %r12
    movq %r12, %rdi
    movq $array_size, %rsi
    callq _sieve
    xorq %rsi, %rsi
    movq $array_size, %rcx
0:
    cmpb $0, (%r12, %rcx)
    jne 1f
    addq %rcx, %rsi
1:
    loop 0b
    leaq format(%rip), %rdi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
