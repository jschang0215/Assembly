%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ; ax:dx로 분리된 것을 ebx로 옮기기 
    mov ax, 0x1234
    mov dx, 0x5678
    mov ebx, 0x00000000
    
    mov bx, ax
    shl ebx, 16
    mov bx, dx
    
    PRINT_HEX 4, ebx
    NEWLINE
    
    xor rax, rax
    ret