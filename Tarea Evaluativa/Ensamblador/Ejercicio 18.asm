%include "io.inc"

section .text
global main
main:
    mov ebp, esp; for correct debugging
    call _Minimo
    xor eax, eax
    ret
    
section .data
    L dd 0, 8, 1, 6; Array
    n dd 4; Número de elementos del Array    

section .text
    global _Minimo
    
_Minimo:

    ;------------INICIO-PROLOGO--------------;
    push ebp
    mov ebp, esp
    
    push edx ; registros utilizados
    push ecx
    push eax
    push esi
    push ebx
    ;------------FINAL-PROLOGO---------------;

    ;iniciar
    mov esi, L; Índice inicial
    mov eax, [esi] ; Cargamos el primer elemento como mínimo
    mov ecx, [n] ; Guardamos el tamano del array
    mov ebx, 0 ; inicializar 

    .loop_compare:
    add esi, 4 ; Incrementamos el índice
    dec ecx    ; Decrementamos el tamano del array
    cmp ecx, 0 ; cuando el numero total de elementos sea igual a cero
    jE .done ; Si hemos recorrido toda la lista, salimos
    
    mov edx, [esi] ; Cargamos el siguiente elemento
    cmp edx, eax ; Comparamos con el mínimo actual
    jl .update_min ; Si es menor, actualizamos el mínimo
    jmp .loop_compare ; Si no, seguimos buscando

    .update_min:
    mov eax, edx ; Actualizamos el mínimo
    mov ebx, esi ; Guardamos el indice del minimo
    jmp .loop_compare ; Continuamos buscando

    .done:
    mov eax, ebx ; Guardo el indice aqui
    cmp eax, 0 ; Si el indice es 0 terminamos
    jE .exit 
    sub eax, L   ; Restamos valor indice final menos inicial
    mov ebx, 4    ; guardo 4 para en divisor
    xor edx, edx  ; limpio
    div ebx  ; divido
    .exit:
    PRINT_DEC 4, eax 
    
    
    ;------------INICIO-EPILOGO--------------;
    pop ebx
    pop esi
    pop eax
    pop ecx
    pop edx
    
    pop ebp ; restauramos la posicion de la base de la pila
    ret
    ;------------FINAL-EPILOGO---------------;
    