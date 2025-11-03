Algoritmo SumaElementosVector
    Dimensionar vector[10]
	Definir i, suma Como Entero
    suma <- 0
    Para i <- 1 Hasta 10 Con Paso 1 Hacer
        Escribir "Ingrese el número ", i, ": "
        Leer vector[i]
        suma <- suma + vector[i]
    FinPara
    Escribir "La suma total es: ", suma
FinAlgoritmo
