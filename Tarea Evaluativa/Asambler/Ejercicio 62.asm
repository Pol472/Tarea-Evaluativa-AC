section .text
global main
main:
    ;write your code here
    xor eax, eax
    ret
    
    section .data
    L dd 5, 2, 8, 1, 4 ; Ejemplo de lista (puedes modificarla según tus necesidades)
    n equ 5 ; Número de elementos en la lista

section .text
    global _start

_start:
    mov esi, 0 ; Índice inicial
    mov eax, [L + esi] ; Cargamos el primer elemento

check_order:
    inc esi ; Incrementamos el índice
    cmp esi, n ; Comparamos con el número total de elementos
    jz sorted ; Si hemos recorrido toda la lista, está ordenada

    mov edx, [L + esi] ; Cargamos el siguiente elemento
    cmp edx, eax ; Comparamos con el elemento anterior
    jl descending ; Si es menor, es orden decreciente
    jg ascending ; Si es mayor, es orden creciente
    jmp check_order ; Si no, seguimos buscando

ascending:
    mov eax, edx ; Actualizamos el elemento anterior
    jmp check_order

descending:
    ; Aquí puedes agregar el código para manejar el caso de orden decreciente
    ; Por ejemplo, imprimir un mensaje o realizar alguna acción específica
    ; ...

sorted:
    ; En este punto, la lista está ordenada (creciente o decreciente)
    ; Puedes usar esta información según tus necesidades

    ; Salimos del programa
    mov eax, 1
    int 0x80
