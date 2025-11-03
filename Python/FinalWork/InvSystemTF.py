# ==========================================================
# SISTEMA DE INVENTARIO DE EQUIPOS DE RED
# Autor: (Hipolito Junior Rodriguez)
# Descripción:
#   Este programa gestiona el inventario de equipos de red,
#   permitiendo registrar, actualizar y monitorear el estado
#   de routers, switches y computadoras.
# ==========================================================

import pandas as pd  # Para mostrar los reportes tabulados

# -----------------------------
# ESTRUCTURAS DE DATOS
# -----------------------------
nombres_equipos = []     # Vector de nombres
tipos_equipos = []       # Vector de tipos (router, switch, pc, etc.)
ips_equipos = []         # Vector de direcciones IP
estados_equipos = []     # Vector de estados (activo, mantenimiento, caído)
alertas = []             # Vector de alertas generadas


# -----------------------------
# FUNCIONES PRINCIPALES
# -----------------------------
def RegistrarEquipo():
    """Permite registrar un nuevo equipo de red."""
    nombre = input("Nombre del equipo: ")
    tipo = input("Tipo (Router/Switch/PC/Servidor): ")
    ip = input("Dirección IP: ")
    estado = input("Estado (Activo/Mantenimiento/Caído): ")

    nombres_equipos.append(nombre)
    tipos_equipos.append(tipo)
    ips_equipos.append(ip)
    estados_equipos.append(estado)

    print(f"✅ Equipo '{nombre}' registrado correctamente.")
    GenerarAlerta(nombre, estado)


def MostrarInventario():
    """Muestra todos los equipos registrados con su información."""
    if not nombres_equipos:
        print("📭 No hay equipos registrados aún.")
        return

    data = []
    for i in range(len(nombres_equipos)):
        data.append([
            nombres_equipos[i],
            tipos_equipos[i],
            ips_equipos[i],
            estados_equipos[i]
        ])
    
    df = pd.DataFrame(data, columns=["Nombre", "Tipo", "Dirección IP", "Estado"])
    print("\n📋 INVENTARIO DE EQUIPOS DE RED:")
    print(df)


def ActualizarEstado():
    """Permite actualizar el estado de un equipo ya registrado."""
    if not nombres_equipos:
        print("No hay equipos para actualizar.")
        return

    nombre = input("Ingrese el nombre del equipo que desea actualizar: ")

    if nombre in nombres_equipos:
        index = nombres_equipos.index(nombre)
        nuevo_estado = input("Nuevo estado (Activo/Mantenimiento/Caído): ")
        estados_equipos[index] = nuevo_estado
        print(f"🔁 Estado del equipo '{nombre}' actualizado a {nuevo_estado}.")
        GenerarAlerta(nombre, nuevo_estado)
    else:
        print("❌ Equipo no encontrado.")


def GenerarAlerta(nombre, estado):
    """Genera alertas si el equipo está caído o en mantenimiento."""
    if estado.lower() in ["caído", "mantenimiento"]:
        alerta = f"⚠️ Alerta: El equipo '{nombre}' se encuentra en estado '{estado}'."
        alertas.append(alerta)
        print(alerta)


def MostrarAlertas():
    """Muestra todas las alertas registradas."""
    if not alertas:
        print("✅ No hay alertas activas.")
    else:
        print("\n🚨 ALERTAS DE RED:")
        for alerta in alertas:
            print(alerta)


# -----------------------------
# MENÚ PRINCIPAL
# -----------------------------
def menu():
    while True:
        print("\n===== SISTEMA DE INVENTARIO DE EQUIPOS DE RED =====")
        print("1. Registrar nuevo equipo")
        print("2. Mostrar inventario completo")
        print("3. Actualizar estado de un equipo")
        print("4. Mostrar alertas de red")
        print("5. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            RegistrarEquipo()
        elif opcion == "2":
            MostrarInventario()
        elif opcion == "3":
            ActualizarEstado()
        elif opcion == "4":
            MostrarAlertas()
        elif opcion == "5":
            print("👋 Cerrando sistema de inventario...")
            break
        else:
            print("❌ Opción inválida. Intente de nuevo.")


# -----------------------------
# EJECUCIÓN PRINCIPAL
# -----------------------------
if __name__ == "__main__":
    menu()
