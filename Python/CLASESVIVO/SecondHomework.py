# 1. Mayoría de edad---------------------------------------------------------------------------
print("Pide la edad al usuario. Si es mayor o igual a 18 muestra 'Eres mayor de edad', sino 'Eres menor de edad'.")
edad = int(input("1. Input you age: "))
if edad >= 18:
    print("YOU ARE OLD PERSON")
else:
    print("YOU ARE YOUNGER")


    # 2. Positivo, Negativo o Cero---------------------------------------------------------------------------
print("                                             Positivo, Negativo o Cero.                                       ")
numero = float(input("2. Introduce un número: "))
if numero > 0:
    print('El número es positivo')
elif numero < 0:
    print('El número es negativo')
else:
    print('El número es cero')

    # 3. Par o Impar---------------------------------------------------------------------------
print("                                                     Par o Impar                                             ")
numero = int(input("3. Introduce un número entero: "))
if numero % 2 == 0:
    print('El número es par')
else:
    print('El número es impar')

    # 4. Clasificación de notas (0-100)---------------------------------------------------------------------------
print("                                             Clasificación de notas                                          ")
nota = int(input("4. Introduce una nota (0-100): "))
if nota >= 90:
    print('Aprobado con A')
elif nota >= 70:
    print('Aprobado')
else:
    print('Reprobado')

    # 5. Descuento en compra---------------------------------------------------------------------------
print("                                             Descuento en compra                                              ")
monto_compra = float(input("5. Ingresa el monto de la compra: "))
if monto_compra > 500:
    descuento = monto_compra * 0.10
    total_a_pagar = monto_compra - descuento
    print(f'¡Descuento del 10% aplicado! Total a pagar: ${total_a_pagar:.2f}')
else:
    print(f'No aplica descuento. Total a pagar: ${monto_compra:.2f}')

    # 1. Números del 1 al 10 (Usando while)---------------------------------------------------------------------------
print("                                    Números del 1 al 10 (Usando while)                                         ")
print("\n--- Bucle I - 1. Números del 1 al 10 ---")
contador = 1
while contador <= 10:
    print(contador)
    contador += 1

    # 2. Sumar números hasta que se escriba 0---------------------------------------------------------------------------
print("                                  Sumar números hasta que se escriba 0                                        ")
print("\n--- Bucle I - 2. Sumar hasta 0 ---")
suma_total = 0
numero_ingresado = -1  # Inicializamos con un valor que no sea 0 para entrar al bucle

while numero_ingresado != 0:
    numero_str = input("Introduce un número para sumar (0 para terminar): ")
    try:
        numero_ingresado = float(numero_str)
        suma_total += numero_ingresado
    except ValueError:
        print("Entrada inválida. Por favor, introduce un número.")
        numero_ingresado = -1 # Mantiene el bucle si la entrada es inválida

# Se resta el último 0 ingresado (si se usó un float en la suma)
# Si solo se suman enteros, no es necesario, pero es más robusto si se usa float.
# suma_total -= 0 # No es estrictamente necesario, pero aclara la lógica

print(f'La suma total es: {suma_total}')

    # 3. Adivinar el número secreto (Ejemplo: 7)---------------------------------------------------------------------------
print("                                      Adivinar el número secreto                                                  ")
import random
numero_secreto = 7 # Puedes usar random.randint(1, 10) para hacerlo aleatorio
adivinanza = 0
print("\n--- Bucle I - 3. Adivina el número secreto (Pista: es menos de 10) ---")

while adivinanza != numero_secreto:
    try:
        adivinanza = int(input("Adivina el número: "))
        if adivinanza != numero_secreto:
            print("Incorrecto. Intenta de nuevo.")
    except ValueError:
        print("Entrada inválida. Por favor, introduce un número entero.")

print(f"¡Felicidades, adivinaste el número secreto: {numero_secreto}!")

    # 4. Valida una contraseña---------------------------------------------------------------------------
print("                                             PValida una contraseña                                                 ")
contrasena_correcta = "1234"
contrasena_ingresada = ""
print("\n--- Bucle I - 4. Validar contraseña ---")

while contrasena_ingresada != contrasena_correcta:
    contrasena_ingresada = input("Introduce la contraseña: ")
    if contrasena_ingresada != contrasena_correcta:
        print("Contraseña incorrecta. Vuelve a intentarlo.")

print("Acceso concedido.")

    # 5. Contador regresivo---------------------------------------------------------------------------
print("                                              Contador regresivo                                                  ")
print("\n--- Bucle I - 5. Contador regresivo ---")
try:
    num_inicial = int(input("Introduce el número inicial para la cuenta regresiva: "))
    contador = num_inicial
    while contador >= 1:
        print(contador)
        contador -= 1
except ValueError:
    print("Entrada inválida. Debe ser un número entero.")

    # 1. Tabla de multiplicar---------------------------------------------------------------------------
    print("                                         Tabla de multiplicar                                                ")
print("\n--- Bucle II - 1. Tabla de Multiplicar ---")
try:
    num = int(input("Introduce el número para ver su tabla (hasta 10): "))
    print(f"Tabla del {num}:")
    for i in range(1, 11):
        resultado = num * i
        print(f"{num} x {i} = {resultado}")
except ValueError:
    print("Entrada inválida. Debe ser un número entero.")

    # 2. Pide 10 números y calcula la suma total---------------------------------------------------------------------------
    print("                                         Pide 10 números y calcula la suma total                                ")
print("\n--- Bucle II - 2. Suma de 10 números ---")
suma_total = 0
cantidad_numeros = 10
for i in range(1, cantidad_numeros + 1):
    while True:
        try:
            numero = float(input(f"Introduce el número {i} de {cantidad_numeros}: "))
            suma_total += numero
            break
        except ValueError:
            print("Entrada inválida. Introduce un número válido.")

print(f"La suma total de los 10 números es: {suma_total}")

# 3. Calcula el factorial de un número---------------------------------------------------------------------------
print("                                         Calcula el factorial de un número                                       ")
print("\n--- Bucle II - 3. Factorial ---")
try:
    num = int(input("Introduce un número entero no negativo para calcular su factorial: "))
    if num < 0:
        print("El factorial no está definido para números negativos.")
    elif num == 0:
        print("El factorial de 0 es 1.")
    else:
        factorial = 1
        # Se usa range(1, num + 1) para multiplicar desde 1 hasta num
        for i in range(1, num + 1):
            factorial *= i
        print(f"El factorial de {num} es: {factorial}")
except ValueError:
    print("Entrada inválida. Debe ser un número entero.")

    # 4. Muestra todos los números pares entre 1 y 50---------------------------------------------------------------------------
print("                                      Muestra todos los números pares entre 1 y 50                                   ")
print("\n--- Bucle II - 4. Pares entre 1 y 50 ---")
print("Números pares:")

for i in range(2, 51, 2):
    print(i, end=" ")
print()

# 5. Pide 5 notas, calcula la suma y el promedio final---------------------------------------------------------------------------
print("                                     Pide 5 notas, calcula la suma y el promedio final                               ")
print("\n--- Bucle II - 5. Promedio de 5 notas ---")
suma_notas = 0
cantidad_notas = 5

for i in range(1, cantidad_notas + 1):
    while True:
        try:
            nota = float(input(f"Introduce la nota {i} de {cantidad_notas}: "))
            if 0 <= nota <= 100:
                suma_notas += nota
                break
            else:
                print("La nota debe estar entre 0 y 100.")
        except ValueError:
            print("Entrada inválida. Introduce un número válido.")

promedio_final = suma_notas / cantidad_notas
print(f"La suma total de las notas es: {suma_notas:.2f}")
print(f"El promedio final es: {promedio_final:.2f}")