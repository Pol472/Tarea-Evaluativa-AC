def Order_On(n, L):
    
    a = 0
    i = 1
    while i < n:
        if L[i] < L[a]:
            a = i
        i = i + 1
        
    i = 1
    L[0] = L[a]
    
    while i < n :
        L[i] = L[i - 1] + 1
        i = i + 1
    return L