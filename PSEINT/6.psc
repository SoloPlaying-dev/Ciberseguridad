// -----------------------------------------------------
// FUNCI�N 1: VALIDAR ACCESO (CORREGIDA)
Funci�n Resultado <- ValidarAcceso(mac)
	Si mac='00:00:00:00:00:01' Entonces
		Resultado <- Falso
	SiNo // MAC bloqueada
		Resultado <- Verdadero
	FinSi // MAC permitida
FinFunci�n

// -----------------------------------------------------
// FUNCI�N 2: REGISTRAR DISPOSITIVO
Funci�n RegistrarDispositivo(dispositivos Por Referencia,contador Por Referencia,mac,ip)
	dispositivos[contador,1]<-mac
	dispositivos[contador,2]<-ip
	contador <- contador+1
FinFunci�n

// -----------------------------------------------------
// FUNCI�N 3: GENERAR ALERTAS
Funci�n GenerarAlertas(dispositivos,contador)
	Para i<-1 Hasta contador-1 Hacer
		// Llama a la funci�n de verificaci�n (ValidarAcceso)
		Si  NO ValidarAcceso(dispositivos[i,1]) Entonces
			Escribir '?? Acceso NO autorizado para MAC: ', dispositivos[i,1]
		FinSi
	FinPara
FinFunci�n

Algoritmo ControlAccesosWiFi
	// --- 1. DECLARACI�N DE ARREGLOS (USANDO DIMENSIONAR) ---
	Dimensionar dispositivos(10,2)
	// --- 2. DECLARACI�N DE VARIABLES SIMPLES (USANDO DEFINIR) ---
	Definir contador, i Como Entero
	Definir mac, ip Como Cadena
	contador <- 1
	// --- 3. CICLO DE REGISTRO ---
	Para i<-1 Hasta 3 Hacer // Inicializa el �ndice en 1
		Escribir 'MAC: 'Sin Saltar
		Leer mac
		Escribir 'IP: 'Sin Saltar
		Leer ip
		// Llamada a la funci�n, pasando las estructuras y el contador POR REFERENCIA
		RegistrarDispositivo(dispositivos,contador,mac,ip)
	FinPara
	// --- 4. GENERAR ALERTAS ---
	GenerarAlertas(dispositivos,contador)
FinAlgoritmo
