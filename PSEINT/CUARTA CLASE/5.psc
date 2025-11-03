Funcion mayor <- MayorNumero(a, b, c)
    Si a >= b Y a >= c Entonces
        mayor <- a
    Sino
        Si b >= a Y b >= c Entonces
            mayor <- b
        Sino
            mayor <- c
        FinSi
    FinSi
FinFuncion

Algoritmo MayorDeTres
    Definir x, i, z, resultado Como Entero
    Escribir "Ingrese tres números: "
    Leer x, i, z
	
    resultado <- MayorNumero(x, i, z)
    Escribir "El mayor número es: ", resultado
FinAlgoritmo
