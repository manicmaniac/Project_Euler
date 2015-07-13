bits 64
section .text
global _start

_start:
    mov     eax, 0x1    ; sys_write (01)
    mov     edi, eax    ; stdout    (01)
    mov      dl, len    ; length    (13)
    mov     rsi, msg    ; address
    syscall
    mov     eax, 0x0    ; return 0
    mov      al, 0x3c   ; sys_exit
    syscall

section .data
    msg      db     'hello, world', 0x0a
    len     equ     $ - msg

