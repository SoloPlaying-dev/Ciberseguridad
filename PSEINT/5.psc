// -----------------------------------------------------
// FUNCIÓN 1: REGISTRAR HOST
Funcion RegistrarHost(hosts Por Referencia, contador Por Referencia, nombre)
    hosts[contador] <- nombre
    contador <- contador + 1
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 2: ANALIZAR VULNERABILIDADES
Funcion AnalizarVulnerabilidades(hosts, vulnerabilidades Por Referencia, contador)
    Para i <- 1 Hasta contador - 1 Hacer
        Escribir "Analizando host ", hosts[i], "..."
        // Azar(N) genera un número
        vulnerabilidades[i] <- Azar(4) 
    FinPara
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 3: MOSTRAR REPORTE
Funcion MostrarReporte(hosts, vulnerabilidades, contador)
    Escribir "=== REPORTE DE VULNERABILIDADES ==="
    Para i <- 1 Hasta contador - 1 Hacer
        Escribir "Host: ", hosts[i], " | Vulnerabilidades detectadas: ", vulnerabilidades[i]
        Si vulnerabilidades[i] > 1 Entonces
            Escribir "?? Riesgo alto en ", hosts[i]
        FinSi
    FinPara
FinFuncion

Algoritmo EscaneoVulnerabilidades
    
    // --- 1. DECLARACIÓN DE ARREGLOS (USANDO DIMENSIONAR) ---
    Dimensionar hosts[10]
    Dimensionar vulnerabilidades[10] 
    
    // --- 2. DECLARACIÓN DE VARIABLES SIMPLES (USANDO DEFINIR) ---
    Definir contador, i Como Entero
    Definir nombre Como Cadena
    contador <- 1
    
    // --- 3. CICLO DE REGISTRO ---
    Para i <- 1 Hasta 3 Hacer
        Escribir Sin Saltar "Ingrese nombre del host: ";
        Leer nombre
	
        // Llamada a la función, pasando 'hosts' y 'contador' POR REFERENCIA
        RegistrarHost(hosts, contador, nombre)
    FinPara
    
    // --- 4. ANALIZAR Y REPORTAR ---
    AnalizarVulnerabilidades(hosts, vulnerabilidades, contador)
    MostrarReporte(hosts, vulnerabilidades, contador)
FinAlgoritmo