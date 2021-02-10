%include "io64.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 2, a
    GET_DEC 2, b
    GET_DEC 2, c
    
    mov ax, [a]
    mov bx, [b]
    
    cmp ax, bx
    jg L_a_is_greater
    mov [max], bx
    mov [min], ax
    jmp L_a_is_greater_end
    
L_a_is_greater:
    mov [max], ax
    mov [min], bx
    
L_a_is_greater_end:
    mov ax, [c]
    mov bx, [max]
    
    cmp ax, bx
    jg L_c_is_greater
    
    mov bx, [min]
    cmp ax, bx
    jl L_c_is_smaller
    
L_c_is_greater:
    mov [max], ax
    jmp L_c_is_greater_end
    
L_c_is_smaller:
    mov [min], ax
    
L_c_is_greater_end:
    PRINT_DEC 2, max
    NEWLINE
    PRINT_DEC 2, min
    NEWLINE
    
    mov ax, [max]
    mov bx, [min]
    mul bx
    shl edx, 16
    and eax, 0x0000ffff
    or eax, edx
    mov [total], eax
    
    PRINT_DEC 4, total
    NEWLINE
    
    xor rax, rax
    ret
    
section .bss
    a resw 1
    b resw 1
    c resw 1
   
    max resw 1
    min resw 1
    total resd 1