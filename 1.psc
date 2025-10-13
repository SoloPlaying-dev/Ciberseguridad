// -----------------------------------------------------
// FUNCIÓN 1: REGISTRAR INTENTO
Funcion RegistrarIntento(intentos Por Referencia, contador Por Referencia, usuario, servidor, ip, tipo, hora)
    intentos[contador, 1] <- usuario
    intentos[contador, 2] <- servidor
    intentos[contador, 3] <- ip
    intentos[contador, 4] <- tipo
    intentos[contador, 5] <- hora
    contador <- contador + 1 
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 2: GENERAR ALERTAS
Funcion GenerarAlertas(intentos, contador)
    Para i <- 1 Hasta contador - 1 Hacer
        Si intentos[i, 4] = "FALLIDO" Entonces
            Escribir "?? Alerta: Acceso fallido del usuario ", intentos[i,1], " en ", intentos[i,2]
        FinSi
    FinPara
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 3: MOSTRAR REPORTE
Funcion MostrarReporte(intentos, contador)
    Escribir "=== REPORTE DE INTENTOS ==="
    Para i <- 1 Hasta contador - 1 Hacer
        Escribir "Usuario: ", intentos[i,1], " | Servidor: ", intentos[i,2], " | IP: ", intentos[i,3], " | Tipo: ", intentos[i,4], " | Hora: ", intentos[i,5]
    FinPara
FinFuncion

// -----------------------------------------------------
Algoritmo SistemaMonitoreoAccesos
	
    Dimensionar intentos[50,5]
    Definir contador, i Como Entero
    Definir usuario, servidor, ip, tipo, hora Como Cadena
	contador <- 1 
    
    Escribir "Ingrese 3 intentos de acceso:"
    
    Para i <- 1 Hasta 3 Hacer
        Escribir Sin Saltar "Usuario: "; Leer usuario
        Escribir Sin Saltar "Servidor: "; Leer servidor
        Escribir Sin Saltar "IP: "; Leer ip
        Escribir Sin Saltar "Tipo de acceso (EXITOSO/FALLIDO): "; Leer tipo
        Escribir Sin Saltar "Hora: "; Leer hora
        RegistrarIntento(intentos, contador, usuario, servidor, ip, tipo, hora) 
    FinPara
    MostrarReporte(intentos, contador)
    GenerarAlertas(intentos, contador)
    
FinAlgoritmo