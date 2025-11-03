Funcion promedio <- Prom(n1, n2, n3)
    promedio <- (n1 + n2 + n3) / 3
FinFuncion

Algoritmo PromedioEstudiante
	
    Definir n1, n2, n3, promedio Como Real
    Escribir "Ingrese las tres notas: "
    Leer n1, n2, n3
	
    promedio <- Prom(n1, n2, n3)
	
    Escribir "El promedio es: ", promedio
	
    Si promedio >= 70 Entonces
        Escribir "El estudiante aprobó."
    Sino
        Escribir "El estudiante reprobó."
    FinSi
FinAlgoritmo
