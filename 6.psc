Algoritmo CargarMostrarArreglo
    // 1. Declarar el arreglo o vector
    Dimensionar v[5]
    Definir i, num Como Entero // Separar las definiciones es m�s claro
    
    Para i <- 1 Hasta 5 Con Paso 1 Hacer
        Escribir "Ingrese un n�mero para la posici�n ", i, ": "
        Leer v[i] 
    FinPara
    
    Escribir "Los n�meros ingresados son: "
    
    Para i <- 1 Hasta 5 Con Paso 1 Hacer
        Escribir v[i]
    FinPara
FinAlgoritmo