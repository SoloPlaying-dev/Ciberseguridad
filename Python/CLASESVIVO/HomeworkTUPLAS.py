# =================================================================
##  Ejercicio 1: Tuplas (Inmutables)
# =================================================================
print("--- EJERCICIO 1: TUPLAS ---")

vulnerabilidades = ('SQL Injection', 'Cross-Site Scripting', 'Buffer Overflow', 'Denegación de Servicio')
print(f"Tupla inicial: {vulnerabilidades}")

# a) Segundo elemento
print(f"a) Segundo elemento: {vulnerabilidades[1]}")

# b) Dos últimos elementos
print(f"b) Dos últimos elementos: {vulnerabilidades[-2:]}")

# c) Intento de modificación (genera TypeError)
print("c) Intento de modificar (esperando error):")
try:
    vulnerabilidades[0] = 'Remote Code Execution'
except TypeError as e:
    print(f"**Error:** {e}")
    print("Las tuplas son inmutables.")


# =================================================================
##  Ejercicio 2: Listas (Mutables)
# =================================================================
print("\n--- EJERCICIO 2: LISTAS ---")

puertos_abiertos = [22, 80, 443, 8080]
print(f"Lista inicial: {puertos_abiertos}")

# a) Agrega el puerto 21
puertos_abiertos.append(21)
print(f"a) Después de agregar 21: {puertos_abiertos}")

# b) Elimina el puerto 8080
puertos_abiertos.remove(8080)
print(f"b) Después de eliminar 8080: {puertos_abiertos}")

# c) Muestra la lista ordenada
puertos_abiertos.sort()
print(f"c) Lista ordenada: **{puertos_abiertos}**")


# =================================================================
##  Ejercicio 3: Diccionarios (Clave-Valor)
# =================================================================
print("\n--- EJERCICIO 3: DICCIONARIOS ---")

dispositivo_red = {
    'IP': '192.168.1.10',
    'Hostname': 'Firewall-Corp',
    'Estado': 'Activo'
}
print(f"Diccionario inicial: {dispositivo_red}")

# a) Muestra el valor de 'Hostname'
print(f"a) Valor de 'Hostname': **{dispositivo_red['Hostname']}**")

# b) Agrega 'Ubicación'
dispositivo_red['Ubicación'] = 'Centro de Datos'
print(f"b) Después de agregar 'Ubicación': {dispositivo_red}")

# c) Cambia 'Estado'
dispositivo_red['Estado'] = 'Inactivo'
print(f"c) Después de cambiar 'Estado': {dispositivo_red}")

# d) Muestra todo el diccionario actualizado
print(f"d) Diccionario final: **{dispositivo_red}**")
