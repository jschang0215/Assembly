%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov al, [a]
    mov [bss_a], al
    mov ax, [b]
    mov [bss_b], ax
    mov eax, [c]
    mov [bss_c], eax
    mov rax, [d]
    mov [bss_d], rax
    
    PRINT_HEX 1, bss_a
    NEWLINE
    PRINT_HEX 2, bss_b
    NEWLINE
    PRINT_HEX 4, bss_c
    NEWLINE
    PRINT_HEX 8, bss_d
    NEWLINE
    
    xor rax, rax
    ret
    
section .data
    a db 0x12
    b dw 0x1234
    c dd 0x12345678
    d dq 0x123456789abcdef
   
section .bss
    bss_a resb 1
    bss_b resw 1
    bss_c resd 1
    bss_d resq 1