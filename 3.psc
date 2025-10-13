// -----------------------------------------------------
// FUNCI�N 1: VERIFICAR CONTRASE�A
Funcion Resultado <- VerificarContrase�a(pass)
    Si Longitud(pass) > 8 Entonces
        Resultado <- Verdadero
    Sino
        Resultado <- Falso 
    FinSi
FinFuncion

// -----------------------------------------------------
// FUNCI�N 2: REGISTRAR USUARIO
Funcion RegistrarUsuario(usuarios Por Referencia, contrase�as Por Referencia, contador Por Referencia, nombre, pass)
    usuarios[contador] <- nombre
    contrase�as[contador] <- pass
    contador <- contador + 1
FinFuncion

// -----------------------------------------------------
// FUNCI�N 3: GENERAR ALERTAS
Funcion GenerarAlertas(usuarios, contrase�as, contador)
    Para i <- 1 Hasta contador - 1 Hacer
        // Llama a la funci�n de verificaci�n (VerificarContrase�a)
        Si No VerificarContrase�a(contrase�as[i]) Entonces 
            Escribir "?? Contrase�a d�bil para usuario: ", usuarios[i]
        FinSi
    FinPara
FinFuncion

// -----------------------------------------------------
// ALGORITMO PRINCIPAL (Punto de inicio de ejecuci�n)
Algoritmo GestorContrase�as
    
    // --- 1. DECLARACI�N DE ARREGLOS (USANDO DIMENSIONAR) ---
    Dimensionar usuarios[10], contrase�as[10] 
    
    // --- 2. DECLARACI�N DE VARIABLES SIMPLES (USANDO DEFINIR) ---
    Definir contador, i Como Entero
    Definir nombre, pass Como Cadena
    contador <- 1 
    
    // --- 3. CICLO DE REGISTRO ---
    Para i <- 1 Hasta 3 Hacer
        Escribir Sin Saltar "Usuario: "; Leer nombre
        Escribir Sin Saltar "Contrase�a: "; Leer pass
        RegistrarUsuario(usuarios, contrase�as, contador, nombre, pass) 
    FinPara
    
    // --- 4. LLAMADA A ALERTAS ---
    GenerarAlertas(usuarios, contrase�as, contador)
    
FinAlgoritmo