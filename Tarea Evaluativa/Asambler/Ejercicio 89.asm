section .text
global main
main:
    ;write your code here
    xor eax, eax
    ret
    
    section .data
    radio dd 5.0 ; Ejemplo de radio (puedes modificarlo según tus necesidades)

section .text
    global _start

_start:
    fldpi ; Cargar el valor de pi en la pila de FPU
    fld dword [radio] ; Cargar el radio en la pila de FPU
    fmul ; Multiplicar pi por el radio
    fmul ; Multiplicar el resultado por el radio nuevamente
    fstp dword [area] ; Almacenar el resultado en la variable 'area'

    ; Aquí puedes usar el valor de 'area' según tus necesidades

    ; Salir del programa
    mov eax, 1
    int 0x80

section .bss
    area resd 1 ; Variable para almacenar el área
