Algoritmo ContarPares
	Dimensionar vector[10]
    Definir i, contador Como Entero
    contador <- 0
    Para i <- 1 Hasta 10 Con Paso 1 Hacer
        Escribir "Ingrese el n�mero ", i, ": "
        Leer vector[i]
        Si vector[i] MOD 2 = 0 Entonces
            contador <- contador + 1
        FinSi
    FinPara
    Escribir "La cantidad de n�meros pares es: ", contador
FinAlgoritmo
