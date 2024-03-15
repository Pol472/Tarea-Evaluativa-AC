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
    mov edi, n ; Índice final (n - 1)

    call quicksort

    ; En este punto, la lista está ordenada
    ; Puedes usar la lista ordenada según tus necesidades

    ; Salimos del programa
    mov eax, 1
    int 0x80

quicksort:
    cmp esi, edi
    jae done ; Si el índice inicial es mayor o igual al índice final, salimos

    mov eax, [L + esi * 4] ; Pivote (elegimos el primer elemento como pivote)
    mov ebx, esi ; Índice para recorrer desde el inicio
    mov edx, edi ; Índice para recorrer desde el final

partition_loop:
    ; Encuentra un elemento mayor o igual al pivote desde el inicio
    cmp [L + ebx * 4], eax
    jge find_end

    inc ebx
    jmp partition_loop

find_end:
    ; Encuentra un elemento menor o igual al pivote desde el final
    cmp [L + edx * 4], eax
    jle swap_elements

    dec edx
    jmp find_end

swap_elements:
    ; Intercambia los elementos
    mov ecx, [L + ebx * 4]
    mov [L + ebx * 4], [L + edx * 4]
    mov [L + edx * 4], ecx

    inc ebx
    dec edx
    jmp partition_loop

done:
    ; Divide la lista en dos partes y aplica recursión
    push edi
    push ebx
    call quicksort

    pop ebx
    pop edi

    push ebx
    push esi
    call quicksort

    pop esi
    pop ebx
    ret
