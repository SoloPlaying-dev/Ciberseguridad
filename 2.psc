// -----------------------------------------------------
// FUNCI�N 1: REGISTRAR PAQUETE
Funcion RegistrarPaquete(registros Por Referencia, contador Por Referencia, ip, puerto, protocolo)
    registros[contador, 1] <- ip
    registros[contador, 2] <- puerto
    registros[contador, 3] <- protocolo
    contador <- contador + 1
FinFuncion

// -----------------------------------------------------
// FUNCI�N 2: GENERAR ALERTAS
Funcion GenerarAlertas(registros, contador, IPsBloqueadas)
    Para i <- 1 Hasta contador - 1 Hacer
        Para j <- 1 Hasta 5 Hacer // 5 es el tama�o m�ximo dimensionado del arreglo IPsBloqueadas
            Si registros[i,1] = IPsBloqueadas[j] Entonces
                Escribir "?? Paquete bloqueado de IP: ", registros[i,1], " (Protocolo: ", registros[i,3], ")"
            FinSi
        FinPara
    FinPara
FinFuncion

// -----------------------------------------------------
// FUNCI�N 3: MOSTRAR REGISTROS
Funcion MostrarRegistros(registros, contador)
    Escribir "=== REGISTRO DE PAQUETES ==="
    Para i <- 1 Hasta contador - 1 Hacer
        Escribir "IP: ", registros[i,1], " | Puerto: ", registros[i,2], " | Protocolo: ", registros[i,3]
    FinPara
FinFuncion

// -----------------------------------------------------
// ALGORITMO PRINCIPAL (Punto de inicio de ejecuci�n)
Algoritmo SimuladorFirewall
    
    // --- 1. DECLARACI�N DE ARREGLOS (USANDO DIMENSIONAR) ---
    Dimensionar registros[20,3], IPsBloqueadas[5] 
    
    // --- 2. DECLARACI�N DE VARIABLES SIMPLES (USANDO DEFINIR) ---
	Definir contador, i Como Entero // 'puerto' es mejor como Entero si solo son n�meros
    Definir ip, protocolo, puerto Como Cadena
    contador <- 1
    
    // --- 3. CARGA DE IPs BLOQUEADAS ---
    IPsBloqueadas[1] <- "192.168.1.10"
    IPsBloqueadas[2] <- "10.0.0.5"
    IPsBloqueadas[3] <- "172.16.0.3"
    Escribir "Registrar 3 paquetes entrantes:"
    
    // --- 4. CICLO DE REGISTRO ---
    Para i <- 1 Hasta 3 Hacer
        Escribir Sin Saltar "IP origen: "; Leer ip
        Escribir Sin Saltar "Puerto: "; Leer puerto
        Escribir Sin Saltar "Protocolo: "; Leer protocolo
		RegistrarPaquete(registros, contador, ip, puerto, protocolo) 
    FinPara
    
    // --- 5. REPORTE Y ALERTAS ---
    MostrarRegistros(registros, contador)
    GenerarAlertas(registros, contador, IPsBloqueadas)
    
FinAlgoritmo