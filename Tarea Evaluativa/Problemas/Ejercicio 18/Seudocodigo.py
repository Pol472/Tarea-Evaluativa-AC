
l = [4,3,5,6]
n = len(l)

def Minimun(size, lista):
    a = 0
    i = 0
    min = lista[0]
    while i < size:
        if lista[i] < min:
            a = i
            min = lista[i]
        i = i + 1
    
    return a 

print(Minimun(n,l))