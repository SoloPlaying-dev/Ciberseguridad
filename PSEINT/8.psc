Algoritmo BuscarNumero
    Dimensionar vector[8]
	Definir encontrado Como Logico
	Definir i, num  Como Entero
    encontrado <- Falso
    Para i <- 1 Hasta 8 Con Paso 1 Hacer
        Escribir "Ingrese el n�mero ", i, ": "
        Leer vector[i]
    FinPara
    Escribir "Ingrese el n�mero a buscar: "
    Leer num
    Para i <- 1 Hasta 8 Con Paso 1 Hacer
        Si vector[i] = num Entonces
            encontrado <- Verdadero
        FinSi
    FinPara
    Si encontrado Entonces
        Escribir "El n�mero se encuentra en el vector."
    Sino
        Escribir "El n�mero NO se encuentra en el vector."
    FinSi
FinAlgoritmo
