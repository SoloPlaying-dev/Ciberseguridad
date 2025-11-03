Algoritmo BuscarNumero
    Dimensionar vector[8]
	Definir encontrado Como Logico
	Definir i, num  Como Entero
    encontrado <- Falso
    Para i <- 1 Hasta 8 Con Paso 1 Hacer
        Escribir "Ingrese el número ", i, ": "
        Leer vector[i]
    FinPara
    Escribir "Ingrese el número a buscar: "
    Leer num
    Para i <- 1 Hasta 8 Con Paso 1 Hacer
        Si vector[i] = num Entonces
            encontrado <- Verdadero
        FinSi
    FinPara
    Si encontrado Entonces
        Escribir "El número se encuentra en el vector."
    Sino
        Escribir "El número NO se encuentra en el vector."
    FinSi
FinAlgoritmo
