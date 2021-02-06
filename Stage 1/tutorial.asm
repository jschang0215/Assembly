%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 0x1234 ; 32bit eax �������Ϳ� 0x1234 ���� 
    mov ax, 0x1234 ; 16bit ax �������Ϳ� 0x1234 ���� 
    mov ax, bx ; bx�������͸� �� ax�������Ϳ� ���� 
    
    mov al, [data_a] ; data_a �� ���� al �������Ϳ� ���� 
    mov eax, [data_a] ; eax �������Ϳ� data_a�� �ּҰ� ���� 
    mov [data_a], byte 0x12 ; data_a �޸𸮿� byte ���� 0x12 �� ����
    
    PRINT_HEX 1, al ; 16������ 1byte al ��� 
    NEWLINE
    PRINT_DEC 1, al ; 10������ 1byte al ��� 
    NEWLINE
    
    xor rax, rax
    ret
    
section .bss
    bss_a resb 1 ; 1byte
    bss_b resw 1 ; 2byte
    bss_c resd 2 ; 4byte
    bss_d resq 3 ; 8byte
    
section .data
    data_a db 0x12 ; 1byte
    data_b dw 0x1234 ; 2byte
    data_c dd 0x12345678 ; 4byte
    data_d dq 0x1234567890abcdef ; 8byte