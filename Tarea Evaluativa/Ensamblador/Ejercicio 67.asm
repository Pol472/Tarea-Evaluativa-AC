%include "io.inc"


section .text
global main
main:
    mov ebp, esp; for correct debugging
    call _Ordenar
    xor eax, eax
    ret

section .data
    L dd 4, 3, 5, 6 ; Array
    n dd 4; Número de elementos del Array      
        
section .text
    global _Ordenar
    
    _Ordenar:
    
     ;------------INICIO-PROLOGO--------------;
    push ebp
    mov ebp, esp
    
    push edx ; registros utilizados
    push ecx
    push eax
    push esi
    ;------------FINAL-PROLOGO---------------;
    
    ;iniciar
    mov esi, L; Índice inicial
    mov eax, [esi] ; Cargamos el primer elemento como mínimo
    mov ecx, [n] ; Guardamos el tamano del array

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
    jmp .loop_compare ; Continuamos buscando

    .done:
    
    mov esi, L ; idexador
    mov ecx, [n] ; guardar tamano del array

    ; Lo que haremos sera: teniendo el minimo ponerlo en la primera posicion
    ; e ir incrementando su valor en 1 hasta llegar al final del intervalo
    While:
    cmp ecx, 0 ; Cuando el numero total de elementos sea cero
    jE  exit   ; salimos 
    mov [esi], eax  ; guardo el minimo en las respectivas posiciones del array
    PRINT_DEC 4, [esi]
    PRINT_STRING ' '
    add  eax, 1 ; incremento en uno el minimo 
    add esi, 4 ; Incrementamos el indice
    dec ecx ; Decrementamos el tamano del array
    jmp While
    
    
    exit:
     ;------------INICIO-EPILOGO--------------;
    pop esi
    pop eax
    pop ecx
    pop edx
    
    pop ebp ; restauramos la posicion de la base de la pila
    ret
    ;------------FINAL-EPILOGO---------------;


    
    
    