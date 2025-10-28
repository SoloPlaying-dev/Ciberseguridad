# Creación de la tupla
vulnerabilidades = ('SQL Injection', 'Cross-Site Scripting', 'Buffer Overflow', 'Denegación de Servicio')

print(f"Tupla 'vulnerabilidades': {vulnerabilidades}")
print(f"Segundo elemento (índice 1): **{vulnerabilidades[1]}**")
print(f"Los dos últimos elementos: **{vulnerabilidades[-2:]}**")

try:
             # Intento de modificación
             vulnerabilidades[0] = 'Remote Code Execution'
except TypeError as e:
             print(f"\nIntento de modificación fallido (esperado):")
             print(f"**Error:** {e}")
             print(f"**Resultado:** Las tuplas son inmutables y no se pueden modificar después de su creación.")
             
        
        # Creación de la lista
puertos_abiertos = [22, 80, 443, 8080]

print(f"Lista inicial 'puertos_abiertos': {puertos_abiertos}")

puertos_abiertos.append(21)
print(f"a) Lista después de agregar 21: {puertos_abiertos}")

puertos_abiertos.remove(8080)
print(f"b) Lista después de eliminar 8080: {puertos_abiertos}")

puertos_abiertos.sort()
print(f"c) Lista ordenada de menor a mayor: **{puertos_abiertos}**")

# Creación del diccionario
dispositivo_red = {
    'IP': '192.168.1.10',
    'Hostname': 'Firewall-Corp',
    'Estado': 'Activo'
}

print(f"Diccionario inicial 'dispositivo_red': {dispositivo_red}")

print(f"a) Valor de 'Hostname': **{dispositivo_red['Hostname']}**")

dispositivo_red['Ubicación'] = 'Centro de Datos'
print(f"b) Diccionario tras agregar 'Ubicación': {dispositivo_red}")

dispositivo_red['Estado'] = 'Inactivo'
print(f"c) Diccionario tras cambiar 'Estado': {dispositivo_red}")

print(f"\nd) **Diccionario actualizado:**")
print(dispositivo_red)

