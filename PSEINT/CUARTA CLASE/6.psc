Algoritmo CargarMostrarArreglo
    // 1. Declarar el arreglo o vector
    Dimensionar v[5]
    Definir i, num Como Entero // Separar las definiciones es más claro
    
    Para i <- 1 Hasta 5 Con Paso 1 Hacer
        Escribir "Ingrese un número para la posición ", i, ": "
        Leer v[i] 
    FinPara
    
    Escribir "Los números ingresados son: "
    
    Para i <- 1 Hasta 5 Con Paso 1 Hacer
        Escribir v[i]
    FinPara
FinAlgoritmo