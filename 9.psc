Algoritmo PromedioCalificaciones
    Dimensionar notas[5]
	Definir i Como Entero
    Definir suma, promedio Como Real
    suma <- 0
    Para i <- 1 Hasta 5 Con Paso 1 Hacer
        Escribir "Ingrese la nota del estudiante ", i, ": "
        Leer notas[i]
        suma <- suma + notas[i]
    FinPara
    promedio <- suma / 5
    Escribir "El promedio general del grupo es: ", promedio
FinAlgoritmo
