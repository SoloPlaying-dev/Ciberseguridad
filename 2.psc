Funcion respuesta <- EsPar(numero)
    Si numero MOD 2 = 0 Entonces
        respuesta <- Verdadero
    Sino
        respuesta <- Falso
    FinSi
FinFuncion

Algoritmo ParOImpar
    Definir num Como Entero
    Escribir "Ingrese un n�mero: "
    Leer num
    Si EsPar(num) Entonces
        Escribir "El n�mero es par."
    Sino
        Escribir "El n�mero es impar."
    FinSi
FinAlgoritmo
