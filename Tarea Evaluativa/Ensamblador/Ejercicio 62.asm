%include "io.inc"

section .text
global main
main:
    mov ebp, esp; for correct debugging
    call start
    ret
    
    section .data
    L dd 1, 2, 1, 2 ; Array
    n dd 4 ; Tamano del Array

section .text
    global Tipo_de_ordenamiento

    start:
    
    ;------------INICIO-PROLOGO--------------;
    push ebp
    mov ebp, esp
    
    push edx ; registros utilizados
    push ecx
    push eax
    push esi
    push ebx
    ;------------FINAL-PROLOGO---------------;
    
    
    mov esi, L; Índice inicial
    xor eax, eax  ; C = False
    xor ebx, ebx  ; D = False
    mov ecx, [n] ; Guardamos el tamano del array 

    Order:
    add esi, 4 ; Incrementamos el índice
    dec ecx    ; Decrementamos el tamano del array
    cmp ecx, 0 ; cuando el numero total de elementos sea igual a cero
    jE Done ; Si hemos recorrido toda la lista, salimos

    mov edx, [esi] ; Cargamos el siguiente elemento
    cmp edx, [esi - 4] ; Comparamos con el elemento anterior
    jl descending ; Si es menor, es orden decreciente
    jg ascending ; Si es mayor, es orden creciente
    jmp Order ; Si no, seguimos buscando

    ascending:
    mov eax, 1  ; C = True
    jmp Order ; Continuamos

    descending:
    mov ebx, 1  ; D = True
    jmp Order ; Continuamos
    
    Done:
    cmp eax, ebx ; 
    jE SIN_ORDENACION
    jl DECRECIENTE
    jg CRECIENTE 
    
    SIN_ORDENACION:
    cmp eax, 0
    jE CRECIENTE
    PRINT_STRING 'NO ORDENADA'
    jmp Exit
    
    DECRECIENTE:
    PRINT_STRING 'D'
    jmp Exit
    
    CRECIENTE:
    PRINT_STRING 'C'
    jmp Exit
    
    
    
    Exit:
    ;------------INICIO-EPILOGO--------------;
    pop ebx
    pop esi
    pop eax
    pop ecx
    pop edx
    
    pop ebp ; restauramos la posicion de la base de la pila
    ret
    ;------------FINAL-EPILOGO---------------;
    
