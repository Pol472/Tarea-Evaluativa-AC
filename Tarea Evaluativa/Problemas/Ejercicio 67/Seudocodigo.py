
l = [6,5,5]
n = 3

def Ordenacion (size, lista):
    
    C = False
    D = False
    
    for i in range(1, size):
        
        if lista[i] > lista[i - 1]:  C = True
            
        elif lista[i] < lista[i - 1]:  D = True
            
        if D & C : break
    
    if D & C : return "NO ESTA ORDENADA"
    elif D : return "D"
    else : return "C"


print(Ordenacion(n, l))