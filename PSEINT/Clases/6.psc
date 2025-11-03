// -----------------------------------------------------
// FUNCIÓN 1: VALIDAR ACCESO (CORREGIDA)
Función Resultado <- ValidarAcceso(mac)
	Si mac='00:00:00:00:00:01' Entonces
		Resultado <- Falso
	SiNo // MAC bloqueada
		Resultado <- Verdadero
	FinSi // MAC permitida
FinFunción

// -----------------------------------------------------
// FUNCIÓN 2: REGISTRAR DISPOSITIVO
Función RegistrarDispositivo(dispositivos Por Referencia,contador Por Referencia,mac,ip)
	dispositivos[contador,1]<-mac
	dispositivos[contador,2]<-ip
	contador <- contador+1
FinFunción

// -----------------------------------------------------
// FUNCIÓN 3: GENERAR ALERTAS
Función GenerarAlertas(dispositivos,contador)
	Para i<-1 Hasta contador-1 Hacer
		// Llama a la función de verificación (ValidarAcceso)
		Si  NO ValidarAcceso(dispositivos[i,1]) Entonces
			Escribir '?? Acceso NO autorizado para MAC: ', dispositivos[i,1]
		FinSi
	FinPara
FinFunción

Algoritmo ControlAccesosWiFi
	// --- 1. DECLARACIÓN DE ARREGLOS (USANDO DIMENSIONAR) ---
	Dimensionar dispositivos(10,2)
	// --- 2. DECLARACIÓN DE VARIABLES SIMPLES (USANDO DEFINIR) ---
	Definir contador, i Como Entero
	Definir mac, ip Como Cadena
	contador <- 1
	// --- 3. CICLO DE REGISTRO ---
	Para i<-1 Hasta 3 Hacer // Inicializa el índice en 1
		Escribir 'MAC: 'Sin Saltar
		Leer mac
		Escribir 'IP: 'Sin Saltar
		Leer ip
		// Llamada a la función, pasando las estructuras y el contador POR REFERENCIA
		RegistrarDispositivo(dispositivos,contador,mac,ip)
	FinPara
	// --- 4. GENERAR ALERTAS ---
	GenerarAlertas(dispositivos,contador)
FinAlgoritmo
