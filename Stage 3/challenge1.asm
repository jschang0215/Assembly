%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ; 3�� ������� �Ǻ�
    GET_DEC 2, a
    mov bl, 3
    mov ax, [a]
    div bl
    mov [mod], ah
    
    mov al, [mod]
    mov bl, 0
    cmp al, bl
    je L_mod_zero
    PRINT_STRING mod_not_zero_string
    jmp L_mod_zero_end
    
L_mod_zero:
    PRINT_STRING mod_zero_string
    
L_mod_zero_end:
    xor rax, rax
    ret
    
section .data
    mod_zero_string db '3�� ��� �Դϴ�.', 0x00
    mod_not_zero_string db '3�� ����� �ƴմϴ�.', 0x00
    
section .bss
    a resw 1
    mod resb 1