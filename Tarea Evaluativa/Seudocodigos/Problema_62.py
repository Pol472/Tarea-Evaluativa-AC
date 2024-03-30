def Ordenacion (n, lista):
    
    C = False
    D = False
    i = 0
    
    while i < n - 1:
        
        if lista[i + 1] > lista[i]:  C = True
            
        elif lista[i + 1] < lista[i]:  D = True
            
        if D & C : break
        
        i = i + 1
    
    if D & C : return "NO ORDENADA"
    elif D : return "D"
    else : return "C"
