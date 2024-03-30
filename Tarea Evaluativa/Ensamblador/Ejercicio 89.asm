%include "io.inc"
section .data
    radius dw 2
    
section .text
global main
main:
    mov eax, [radius]
    mov ebx,3
    mul eax
    mul ebx
    PRINT_UDEC 4, eax
    xor eax, eax
    xor ebx, ebx
    ret