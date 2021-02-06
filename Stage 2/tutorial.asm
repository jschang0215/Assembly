%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    PRINT_STRING msg1
    NEWLINE
    
    GET_DEC 1, al ; 1byte �Է��� al �������Ϳ� ����
    GET_DEC 2, a ; 2byte �Է��� a �޸𸮿� ���� 
    PRINT_DEC 1, al
    NEWLINE
    PRINT_DEC 2, a
    NEWLINE
    
    mov ax, 1
    mov bx, 2
    add ax, bx ; ax = ax+bx
    PRINT_DEC 2, ax
    NEWLINE
    mov [a], word 1 ; �ű�� ���� �޸��̹Ƿ� ũ�⸦ �����ؾ� ��
    add [a], al
    PRINT_DEC 2, a
    NEWLINE
    sub [a], ax
    PRINT_DEC 2, a
    NEWLINE
    
    mov ax, 9 ; ax �������� �ʱ�ȭ�ؾ� �� 
    mov al, 2
    mov [a], word 2
    mov bx, [a]
    mul bx ; ax = bx(1byte�� ����)*al (�������Ϳ� �ִ� �͸� ���� ����) 
    PRINT_DEC 2, ax
    NEWLINE
    
    mov ax, 7
    mov bl, 2
    div bl ; bl(1byte�� ����)/ax: al�� �� ����. ah �� ������ ���� 
    PRINT_DEC 1, al ; �� 
    NEWLINE
    mov al, ah
    PRINT_DEC 1, al ; ������ 
    NEWLINE
    xor rax, rax
    ret
    
section .data
    msg1 db 'hello world', 0x00 ; ���ڿ� ���� �ݵ�� 0x00 ���� 
    
section .bss
    a resw 1