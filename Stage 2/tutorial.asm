%include "io64.inc"

section .text
global CMAIN
CMAIN:
    PRINT_STRING msg1
    NEWLINE
    xor rax, rax
    ret
    
section .data
    msg1 db 'hello world', 0x00