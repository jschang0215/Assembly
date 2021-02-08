%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov ax, 0x1234
    
    PRINT_HEX 2, ax
    NEWLINE
    
    shl ax, 4 ; ���� ����Ʈ ���� 
    PRINT_HEX 2, ax
    NEWLINE
    
    shr ax, 4 ; ������ ����Ʈ ���� 
    PRINT_HEX 2, ax
    NEWLINE
    
    mov [a], word 0x1234
    PRINT_HEX 2, a
    NEWLINE
    
    shr word [a], 4
    PRINT_HEX 2, a
    NEWLINE
    
    mov [a1], byte 0b10110110
    mov [a2], byte 0b01010101
    PRINT_HEX 1, a1
    NEWLINE
    PRINT_HEX 1, a2
    NEWLINE
    
    mov [a1], byte 0b10110110
    mov [a2], byte 0b01010101
    mov al, [a2]
    or [a1], al ; �Ѵ� �޸𸮴� �Ұ� 
    PRINT_HEX 1, a1
    NEWLINE
    
    mov [a1], byte 0b10110110
    mov [a2], byte 0b01010101
    mov al, [a2]
    and [a1], al ; �Ѵ� �޸𸮴� �Ұ� 
    PRINT_HEX 1, a1
    NEWLINE
    
    mov al, byte 0b00000000
    not al ; �޸𸮴� �Ұ� 
    PRINT_HEX 1, al
    NEWLINE
    
    ; 2byte �̻� ���� 
    mov ax, 0xff12
    mov bx, 0xff23
    mul bx ; dx : ax = ax * bx
    shl edx, 16 ; 4�� ����Ʈ
    and eax, 0x0000ffff ; eax ���������� ������ 4�ڸ���
    or eax, edx ; eax edx ��ħ
    mov [result], eax
    PRINT_HEX 4, result
    NEWLINE
    
    ; 2byte �̻� ������
    mov eax, 0x12345678
    mov bx, 0x4567
    mov edx, eax ; eax�� dx:ax�� �и� 
    shr edx, 16
    and eax, 0x0000ffff
    div bx ; ax:dx / bx
    PRINT_HEX 2, ax ; �� 
    NEWLINE
    PRINT_HEX 2, dx ; ������ 
    NEWLINE
    
    xor rax, rax
    ret
    
section .bss
    a resw 1
    a1 resb 1
    a2 resb 1
    result resd 1