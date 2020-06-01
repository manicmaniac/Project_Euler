/*
 * Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
 *
 * 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 *
 * By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
 */

.const
format: .asciz "%ld\n"

.text
.globl _main
_main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %r8, %r8
    movq $1, %r9
    xorq %rsi, %rsi
0:
    xaddq %r8, %r9
    cmpq $4000000, %r9
    ja 1f
    movq %r9, %rax
    andq $1, %rax
    jnz 0b
    addq %r9, %rsi
    jmp 0b
1:
    leaq format(%rip), %rdi
    callq _printf
    popq %rbp
    retq