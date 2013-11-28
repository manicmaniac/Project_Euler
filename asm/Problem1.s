bits 64
section .text
global _start

_start:
        xor     eax, eax
        mov     edx, eax
        inc     eax         ; sys_write (01)
        mov     edi, eax    ; stdout    (01)
        mov     dl, len     ; length    (13)
        mov     rsi, msg    ; address
        syscall
        xor     edi, edi    ; return 0
        mov     eax, edi
        mov     al, 60      ; sys_exit
        syscall

section .data
        msg     db      'hello, world', 0x0A
        len     equ     $ - msg

