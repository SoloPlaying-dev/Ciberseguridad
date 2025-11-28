
# --- 1. Doble de un número entero ---
print("\n--- 1. Doble de un número entero ---")
try:
    num_entero = int(input("1. Introduce un número entero: "))
    doble = num_entero * 2
    print(f"El doble de {num_entero} es: {doble}")
except ValueError:
    print("Error: Debes introducir un número entero válido.")

# ----------------------------------------------------------------------

# --- 2. Suma de dos números enteros ---
print("\n--- 2. Suma de dos números enteros ---")
try:
    num1 = int(input("2. Introduce el primer número entero: "))
    num2 = int(input("2. Introduce el segundo número entero: "))
    suma = num1 + num2
    print(f"La suma de {num1} y {num2} es: {suma}")
except ValueError:
    print("Error: Debes introducir números enteros válidos.")

# ----------------------------------------------------------------------

# --- 3. Mitad de un número real (decimal) ---
print("\n--- 3. Mitad de un número real ---")
try:
    num_real = float(input("3. Introduce un número real (decimal): "))
    mitad = num_real / 2
    print(f"La mitad de {num_real} es: {mitad:.2f}")
except ValueError:
    print("Error: Debes introducir un número real válido.")

# ----------------------------------------------------------------------

# --- 4. Promedio de dos números reales ---
print("\n--- 4. Promedio de dos números reales ---")
try:
    real1 = float(input("4. Introduce el primer número real: "))
    real2 = float(input("4. Introduce el segundo número real: "))
    promedio = (real1 + real2) / 2
    print(f"El promedio de {real1} y {real2} es: {promedio:.2f}")
except ValueError:
    print("Error: Debes introducir números reales válidos.")

# ----------------------------------------------------------------------

# --- 5. Mayoría de edad (Booleano) ---
print("\n--- 5. Mayoría de edad (Lógico) ---")
try:
    edad = int(input("5. Escribe tu edad: "))
    # El resultado de la comparación (edad >= 18) es un valor booleano (True o False)
    es_mayor = edad >= 18 
    print(f"¿Es mayor de edad (18+)? {es_mayor}")
except ValueError:
    print("Error: Debes introducir un número entero para la edad.")

# ----------------------------------------------------------------------

# --- 6. Internet en casa (Booleano) ---
print("\n--- 6. Internet en casa (Lógico) ---")
try:
    # Solicitamos el input y lo convertimos a entero
    tiene_internet_input = int(input("6. ¿Tienes internet en casa? (1 = Sí, 0 = No): "))
    
    # Python trata el 0 como False y cualquier otro número como True en un contexto booleano.
    # Usaremos una comparación explícita para la lógica requerida (1=Sí, 0=No).
    tiene_internet_logico = tiene_internet_input == 1 
    
    print(f"Respuesta lógica guardada: {tiene_internet_logico}")
except ValueError:
    print("Error: Debes introducir solo 1 o 0.")

# ----------------------------------------------------------------------

# --- 7. Mostrar una letra ---
print("\n--- 7. Mostrar una letra ---")
letra = input("7. Escribe una letra: ")
# Aunque el input devuelve una cadena, guardamos solo el primer carácter si se escribió más de uno
letra_elegida = letra[0] if letra else ""
print(f"La letra que has escrito es: {letra_elegida}")

# ----------------------------------------------------------------------

# --- 8. Comparar un carácter con 'A' ---
print("\n--- 8. Comparar un carácter con 'A' ---")
caracter = input("8. Ingresa un carácter: ")

# Aseguramos que solo usamos el primer carácter y convertimos a mayúscula por si acaso
caracter_a_comparar = caracter[0].upper() if caracter else ""

if caracter_a_comparar == 'A':
    print('Correcto')
else:
    print('Incorrecto')

# ----------------------------------------------------------------------

# --- 9. Saludo con nombre ---
print("\n--- 9. Saludo con nombre ---")
nombre = input("9. Escribe tu nombre: ")
# Usamos f-string para formatear la salida
print(f"¡Hola, {nombre}! Bienvenido/a a Python.")

# ----------------------------------------------------------------------

# --- 10. Contar caracteres de una palabra ---
print("\n--- 10. Contar caracteres de una palabra ---")
palabra = input("10. Solicita una palabra: ")
# La función len() devuelve la longitud de una cadena
longitud = len(palabra)
print(f"La palabra '{palabra}' tiene {longitud} caracteres.")