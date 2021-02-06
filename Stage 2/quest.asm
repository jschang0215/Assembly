%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    GET_DEC 1, a
    GET_DEC 1, b
    
    PRINT_STRING str_a
    PRINT_DEC 1, a
    NEWLINE
    PRINT_STRING str_b
    PRINT_DEC 1, b
    NEWLINE
    
    PRINT_STRING str_add
    mov al, [a]
    add al, [b]
    mov [val_add], al
    PRINT_DEC 1, val_add
    NEWLINE
    
    PRINT_STRING str_sub
    mov al, [a]
    sub al, [b]
    mov [val_sub], al
    PRINT_DEC 1, val_sub
    NEWLINE
    
    PRINT_STRING str_mul
    mov ax, 0
    mov al, [a]
    mov bx, [b]
    mul bx
    mov [val_mul], ax
    PRINT_DEC 1, val_mul
    NEWLINE
    
    mov ax, 0
    mov al, [a]
    mov bl, [b]
    div bl
    mov [val_div], al
    mov [val_mod], ah
    PRINT_STRING str_div
    PRINT_DEC 1, val_div
    NEWLINE
    PRINT_STRING str_mod
    PRINT_DEC 1, val_mod
    NEWLINE
    
    xor rax, rax
    ret
    
section .data
    str_a db 'a: ', 0x00
    str_b db 'b: ', 0x00
    str_add db 'Add: ', 0x00
    str_sub db 'Sub: ', 0x00
    str_mul db 'Mul: ', 0x00
    str_div db 'Div: ', 0x00
    str_mod db 'Mod: ', 0x00
    
section .bss
    a resb 1
    b resb 1
    val_add resb 1
    val_sub resb 1
    val_mul resw 1
    val_div resb 1
    val_mod resb 1