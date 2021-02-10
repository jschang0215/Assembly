%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    mov ax, 0x1234
    
    PRINT_HEX 2, ax
    NEWLINE
    
    shl ax, 4 ; 왼쪽 시프트 연산 
    PRINT_HEX 2, ax
    NEWLINE
    
    shr ax, 4 ; 오른쪽 시프트 연산 
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
    or [a1], al ; 둘다 메모리는 불가 
    PRINT_HEX 1, a1
    NEWLINE
    
    mov [a1], byte 0b10110110
    mov [a2], byte 0b01010101
    mov al, [a2]
    and [a1], al ; 둘다 메모리는 불가 
    PRINT_HEX 1, a1
    NEWLINE
    
    mov al, byte 0b00000000
    not al ; 메모리는 불가 
    PRINT_HEX 1, al
    NEWLINE
    
    ; 2byte 이상 곱셈 
    mov ax, 0xff12
    mov bx, 0xff23
    mul bx ; dx : ax = ax * bx
    shl edx, 16 ; 4번 시프트
    and eax, 0x0000ffff ; eax 레지스터의 마지막 4자리만
    or eax, edx ; eax edx 합침
    mov [result], eax
    PRINT_HEX 4, result
    NEWLINE
    
    ; 2byte 이상 나눗셈
    mov eax, 0x12345678
    mov bx, 0x4567
    mov edx, eax ; eax를 ax:dx로 분리 
    shr edx, 16
    and eax, 0x0000ffff
    div bx ; ax:dx / bx
    PRINT_HEX 2, ax ; 몫 
    NEWLINE
    PRINT_HEX 2, dx ; 나머지 
    NEWLINE
    
    mov ax, 0x1234
    mov ax, 0x0000
    and ax, 0x0000 ; ZF로 설정 
    PRINT_HEX 2, ax
    
    ; if 문 구현
    mov ax, 20
    mov bx, 30
    cmp ax, bx
    je myLabel1 ; 같을때 
    mov cx, 0
    jmp myLabel2 ; 무조건 이동 
    
myLabel1:
    mov cx, 100
   
myLabel2:
    PRINT_DEC 2, cx
    NEWLINE
    
    xor rax, rax
    ret
    
section .bss
    a resw 1
    a1 resb 1
    a2 resb 1
    result resd 1