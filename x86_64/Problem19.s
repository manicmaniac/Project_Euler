/*
 * You are given the following information, but you may prefer to do some research
 * for yourself.
 * 
 *   • 1 Jan 1900 was a Monday.
 *   • Thirty days has September,
 *     April, June and November.
 *     All the rest have thirty-one,
 *     Saving February alone,
 *     Which has twenty-eight, rain or shine.
 *     And on leap years, twenty-nine.
 *   • A leap year occurs on any year evenly divisible by 4, but not on a century
 *     unless it is divisible by 400.
 * 
 * How many Sundays fell on the first of the month during the twentieth century (1
 * Jan 1901 to 31 Dec 2000)?
 */

.cstring
format: .asciz "%ld\n"

.text
.globl _main

_weekday:
    movq %rdx, %r8
    cmpq $2, %rsi
    ja 0f
    decq %rdi
    addq $12, %rsi
0:
    incq %rsi
    movq %rdi, %rax
    movq $100, %r9
    xorq %rdx, %rdx
    divq %r9
    movq %rdx, %rdi
    movq %rax, %rcx
    movq %rax, %r9
    shrq $2, %rcx
    addq %rcx, %rax
    shlq $2, %r9
    addq %r9, %rax
    movq %rax, %rcx
    movq %rsi, %rax
    movq $26, %r9
    mulq %r9
    movq $10, %r9
    xorq %rdx, %rdx
    divq %r9
    addq %rdi, %rax
    shrq $2, %rdi
    addq %rdi, %rax
    addq %r8, %rax
    addq %rcx, %rax
    addq $5, %rax
    movq $7, %r9
    xorq %rdx, %rdx
    divq %r9
    movq %rdx, %rax
    incq %rax
    retq

_main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %r12, %r12
    movq $1901, %r13
0:
    cmpq $2000, %r13
    ja 4f
    movq $1, %r14
1:
    cmpq $12, %r14
    ja 3f
    movq %r13, %rdi
    movq %r14, %rsi
    movq $1, %rdx
    callq _weekday
    cmpq $7, %rax
    jne 2f
    incq %r12
2:
    incq %r14
    jmp 1b
3:
    incq %r13
    jmp 0b
4:
    leaq format(%rip), %rdi
    movq %r12, %rsi
    callq _printf
    popq %rbp
    xorq %rax, %rax
    retq
