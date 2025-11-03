// -----------------------------------------------------
// FUNCIÓN 1: VERIFICAR CONTRASEÑA
Funcion Resultado <- VerificarContraseña(pass)
    Si Longitud(pass) > 8 Entonces
        Resultado <- Verdadero
    Sino
        Resultado <- Falso 
    FinSi
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 2: REGISTRAR USUARIO
Funcion RegistrarUsuario(usuarios Por Referencia, contraseñas Por Referencia, contador Por Referencia, nombre, pass)
    usuarios[contador] <- nombre
    contraseñas[contador] <- pass
    contador <- contador + 1
FinFuncion

// -----------------------------------------------------
// FUNCIÓN 3: GENERAR ALERTAS
Funcion GenerarAlertas(usuarios, contraseñas, contador)
    Para i <- 1 Hasta contador - 1 Hacer
        // Llama a la función de verificación (VerificarContraseña)
        Si No VerificarContraseña(contraseñas[i]) Entonces 
            Escribir "?? Contraseña débil para usuario: ", usuarios[i]
        FinSi
    FinPara
FinFuncion

// -----------------------------------------------------
// ALGORITMO PRINCIPAL (Punto de inicio de ejecución)
Algoritmo GestorContraseñas
    
    // --- 1. DECLARACIÓN DE ARREGLOS (USANDO DIMENSIONAR) ---
    Dimensionar usuarios[10], contraseñas[10] 
    
    // --- 2. DECLARACIÓN DE VARIABLES SIMPLES (USANDO DEFINIR) ---
    Definir contador, i Como Entero
    Definir nombre, pass Como Cadena
    contador <- 1 
    
    // --- 3. CICLO DE REGISTRO ---
    Para i <- 1 Hasta 3 Hacer
        Escribir Sin Saltar "Usuario: "; Leer nombre
        Escribir Sin Saltar "Contraseña: "; Leer pass
        RegistrarUsuario(usuarios, contraseñas, contador, nombre, pass) 
    FinPara
    
    // --- 4. LLAMADA A ALERTAS ---
    GenerarAlertas(usuarios, contraseñas, contador)
    
FinAlgoritmo