Funcion valido <- ValidarPassword(pass)
    Si Longitud(pass) > 8 Entonces
        valido <- Verdadero
    Sino
        valido <- Falso
    FinSi
FinFuncion

Algoritmo PasswordSegura
    Definir pass Como Cadena
    Escribir "Ingrese la contrase�a: "
    Leer pass
    Si ValidarPassword(pass) Entonces
        Escribir "La contrase�a es v�lida."
    Sino
        Escribir "La contrase�a NO es v�lida."
    FinSi
FinAlgoritmo
