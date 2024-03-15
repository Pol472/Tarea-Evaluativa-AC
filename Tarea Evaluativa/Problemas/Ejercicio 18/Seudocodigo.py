
l = [43,10,14,3,2,3,67,25]
n = len(l)

def Minimun(size, lista):
    a = 0
    i = 1
    while i < size:
        if lista[i] < lista[a]:
            a = i
        i = i + 1
    
    return a 


import numpy as np


def coeficientes_interpolacion_hermite(nodos, valores_funcion, valores_derivada):
    num_nodos = len(nodos)
    num_coeficientes = 2 * num_nodos
    
    coeficientes = np.zeros(num_coeficientes)
    
    # Crear una matriz con el doble de tamaño para incluir las derivadas de cada punto
    puntos = np.zeros(2*num_nodos)
    valores = np.zeros(2*num_nodos)
    
    # Completar la información con los valores de f(x) y f'(x) en cada nodo
    for i in range(num_nodos):
        puntos[2*i] = nodos[i]
        puntos[2*i + 1] = nodos[i]
        
        valores[2*i] = valores_funcion[i]
        valores[2*i + 1] = valores_funcion[i] + valores_derivada[i]
    
    # Calcular las diferencias divididas de Newton
    diferencias = np.zeros(num_coeficientes)
    diferencias[0] = valores[0]
    
    for j in range(1, num_coeficientes):
        for i in range(num_coeficientes-1, j-1, -1):
            valores[i] = (valores[i] - valores[i-1]) / (puntos[i] - puntos[i-j])

        diferencias[j] = valores[j]
    
    coeficientes[0] = diferencias[0]
    for i in range(1, num_coeficientes):
        coeficientes[i] = diferencias[i]
    
    return coeficientes




x = [0 ,3 ,5 ,8, 13]
y = [0, 225, 383, 623, 993]
dy = [75, 77, 80, 74, 72]

coeficientes = coeficientes_interpolacion_hermite(x ,y,dy)
print(coeficientes)
from numpy . polynomial . polynomial import polyval




q = coeficientes


    
print("q ({0}) = {1} ". format (10, polyval ( 10, q ) ) )


