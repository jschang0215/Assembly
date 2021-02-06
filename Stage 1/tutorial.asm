%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 0x1234 ; 32bit eax 레지스터에 0x1234 저장 
    mov ax, 0x1234 ; 16bit ax 레지스터에 0x1234 저장 
    mov ax, bx ; bx레지스터리 값 ax레지스터에 복사 
    
    mov al, [data_a] ; data_a 의 값을 al 레지스터에 복사 
    mov eax, [data_a] ; eax 레지스터에 data_a의 주소값 저장 
    mov [data_a], byte 0x12 ; data_a 메모리에 byte 단위 0x12 을 저장
    
    PRINT_HEX 1, al ; 16진수로 1byte al 출력 
    NEWLINE
    PRINT_DEC 1, al ; 10진수로 1byte al 출력 
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