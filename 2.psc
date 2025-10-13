Funcion respuesta <- EsPar(numero)
    Si numero MOD 2 = 0 Entonces
        respuesta <- Verdadero
    Sino
        respuesta <- Falso
    FinSi
FinFuncion

Algoritmo ParOImpar
    Definir num Como Entero
    Escribir "Ingrese un número: "
    Leer num
    Si EsPar(num) Entonces
        Escribir "El número es par."
    Sino
        Escribir "El número es impar."
    FinSi
FinAlgoritmo
