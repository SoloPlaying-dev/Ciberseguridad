Funcion valido <- ValidarPassword(pass)
    Si Longitud(pass) > 8 Entonces
        valido <- Verdadero
    Sino
        valido <- Falso
    FinSi
FinFuncion

Algoritmo PasswordSegura
    Definir pass Como Cadena
    Escribir "Ingrese la contraseña: "
    Leer pass
    Si ValidarPassword(pass) Entonces
        Escribir "La contraseña es válida."
    Sino
        Escribir "La contraseña NO es válida."
    FinSi
FinAlgoritmo
