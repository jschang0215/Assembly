%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    
    GET_DEC 1, al
    GET_DEC 1, bl
    
    PRINT_STRING str_a
    PRINT_DEC 1, al
    NEWLINE
    PRINT_STRING str_b
    PRINT_DEC 1, bl
    NEWLINE
    
    PRINT_STRING str_add
    mov cl, al
    add cl, bl
    PRINT_DEC 1, cl
    NEWLINE
    
    PRINT_STRING str_sub
    mov cl, al
    sub cl, bl
    PRINT_DEC 1, cl
    NEWLINE
    
    PRINT_STRING str_mul
    mov cl, al
    mov ax, 0
    mov al, cl
    mul bx
    PRINT_DEC 2, ax
    NEWLINE
    
    mov ax, 0
    mov al, cl
    div bl
    PRINT_STRING str_div
    PRINT_DEC 1, al
    NEWLINE
    PRINT_STRING str_mod
    mov bl, ah
    PRINT_DEC 1, bl
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