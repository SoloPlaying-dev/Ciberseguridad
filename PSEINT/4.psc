// -----------------------------------------------------
// FUNCIÓN 1: REGISTRAR EQUIPO
Funcion RegistrarEquipo(equipos Por Referencia, IPs Por Referencia, contador Por Referencia, nombre, ip, tipo, ubicacion, estado)
    equipos[contador] <- nombre
    IPs[contador,1] <- ip
    IPs[contador,2] <- tipo
    IPs[contador,3] <- ubicacion
    IPs[contador,4] <- estado
    contador <- contador + 1
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 2: MOSTRAR INVENTARIO
Funcion MostrarInventario(equipos, IPs, contador)
    Escribir "=== INVENTARIO DE EQUIPOS ==="
    Para i <- 1 Hasta contador - 1 Hacer
        Escribir "Equipo: ", equipos[i], " | IP: ", IPs[i,1], " | Tipo: ", IPs[i,2], " | Ubicación: ", IPs[i,3], " | Estado: ", IPs[i,4]
    FinPara
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 3: GENERAR ALERTAS
Funcion GenerarAlertas(equipos, IPs, contador)
    Para i <- 1 Hasta contador - 1 Hacer
        Si IPs[i,4] = "INACTIVO" Entonces
            Escribir "?? Alerta: El equipo ", equipos[i], " está inactivo."
        FinSi
    FinPara
FinFuncion

Algoritmo InventarioRed
    // --- 1. DECLARACIÓN DE ARREGLOS (USANDO DIMENSIONAR) ---
    Dimensionar equipos[10], IPs[10,4] 
    // --- 2. DECLARACIÓN DE VARIABLES SIMPLES (USANDO DEFINIR) ---
    Definir contador, i Como Entero
    Definir nombre, ip, tipo, ubicacion, estado Como Cadena
    contador <- 1
    
    // --- 3. CICLO DE REGISTRO ---
    Para i <- 1 Hasta 3 Hacer
        Escribir Sin Saltar "Equipo: "; Leer nombre
        Escribir Sin Saltar "IP: "; Leer ip
        Escribir Sin Saltar "Tipo: "; Leer tipo
        Escribir Sin Saltar "Ubicación: "; Leer ubicacion
        Escribir Sin Saltar "Estado (ACTIVO/INACTIVO): "; Leer estado
        
        // Llamada a la función, pasando las estructuras y el contador POR REFERENCIA
        RegistrarEquipo(equipos, IPs, contador, nombre, ip, tipo, ubicacion, estado)
    FinPara
    
    // --- 4. REPORTE Y ALERTAS ---
    MostrarInventario(equipos, IPs, contador)
    GenerarAlertas(equipos, IPs, contador)
    
FinAlgoritmo
