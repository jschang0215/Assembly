%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    PRINT_STRING msg1
    NEWLINE
    
    GET_DEC 1, al ; 1byte 입력해 al 레지스터에 저장
    GET_DEC 2, a ; 2byte 입력해 a 메모리에 저장 
    PRINT_DEC 1, al
    NEWLINE
    PRINT_DEC 2, a
    NEWLINE
    
    mov ax, 1
    mov bx, 2
    add ax, bx ; ax = ax+bx
    PRINT_DEC 2, ax
    NEWLINE
    mov [a], word 1 ; 옮기는 값이 메모리이므로 크기를 지정해야 함
    add [a], al
    PRINT_DEC 2, a
    NEWLINE
    sub [a], ax
    PRINT_DEC 2, a
    NEWLINE
    
    mov ax, 9 ; ax 레지스터 초기화해야 함 
    mov al, 2
    mov [a], word 2
    mov bx, [a]
    mul bx ; ax = bx(1byte만 가능)*al (레지스터에 있는 것만 곱셈 가능) 
    PRINT_DEC 2, ax
    NEWLINE
    
    mov ax, 7
    mov bl, 2
    div bl ; bl(1byte만 가능)/ax: al에 몫 저장. ah 에 나머지 저장 
    PRINT_DEC 1, al ; 몫 
    NEWLINE
    mov al, ah
    PRINT_DEC 1, al ; 나머지 
    NEWLINE
    xor rax, rax
    ret
    
section .data
    msg1 db 'hello world', 0x00 ; 문자열 끝에 반드시 0x00 붙임 
    
section .bss
    a resw 1