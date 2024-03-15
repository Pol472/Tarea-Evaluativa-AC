section .text
global main
main:
    ;write your code here
    xor eax, eax
    ret
    
section .data
    L db 5, 2, 8, 1, 4 ; Ejemplo de lista (puedes modificarla según tus necesidades)
    n equ 5 ; Número de elementos en la lista

section .text
    global _start

_start:
    mov esi, 0 ; Índice inicial
    mov eax, L[esi] ; Cargamos el primer elemento como mínimo
    mov ebx, esi ; Guardamos el índice del mínimo

loop_compare:
    inc esi ; Incrementamos el índice
    cmp esi, n ; Comparamos con el número total de elementos
    jz done ; Si hemos recorrido toda la lista, salimos

    mov edx, L[esi] ; Cargamos el siguiente elemento
    cmp edx, eax ; Comparamos con el mínimo actual
    jl update_min ; Si es menor, actualizamos el mínimo
    jmp loop_compare ; Si no, seguimos buscando

update_min:
    mov eax, edx ; Actualizamos el mínimo
    mov ebx, esi ; Guardamos el nuevo índice del mínimo
    jmp loop_compare ; Continuamos buscando

done:
    ; En este punto, ebx contiene el índice del mínimo
    ; Puedes usar este valor según tus necesidades (por ejemplo, imprimirlo)

    ; Aquí deberías agregar el código para imprimir o utilizar el índice mínimo

    ; Salimos del programa
    mov eax, 1
    int 0x80
