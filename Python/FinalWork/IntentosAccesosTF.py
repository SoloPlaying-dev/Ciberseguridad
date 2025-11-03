# ===============================================
# SISTEMA DE MONITOREO DE ACCESOS
# Autor: (Hipolito Junior Rodriguez)
# Descripción: Este programa registra y monitorea los intentos de acceso
# ===============================================

import datetime  # Para registrar fecha y hora
import pandas as pd  # Para crear reportes más organizados (biblioteca recomendada)

# -----------------------------
# ESTRUCTURAS DE DATOS (Vectores y Matrices)
# -----------------------------
usuarios = ["admin", "Profe", "maria", "guest"]
servidores = ["ServidorAdm", "ServidorDB", "ServidorSSH"]

# Matriz (lista de listas) para registrar intentos
intentos = []  # Cada intento será una lista: [usuario, servidor, ip, tipo, hora, resultado]

# -----------------------------
# FUNCIONES PRINCIPALES
# -----------------------------

def RegistrarIntento(usuario, servidor, ip, tipo, resultado):
    """Registra un intento de acceso con su información básica."""
    if usuario not in usuarios or servidor not in servidores:
        print(f"⚠️ Error: Usuario o Servidor no reconocido.")
        return
    hora = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    intento = [usuario, servidor, ip, tipo, hora, resultado]
    intentos.append(intento)
    print(f"✅ Intento registrado: {usuario} -> {servidor} ({resultado})")
    
    # Verificamos si hay actividad sospechosa (mismo IP con fallos repetidos)
    GenerarAlertas(ip)


def GenerarAlertas(ip):
    """Genera alerta si una IP tiene más de 3 fallos recientes."""
    fallos = [i for i in intentos if i[2] == ip and i[5] == "Fallo"]
    if len(fallos) >= 3:
        print(f"⚠️ ALERTA: IP {ip} tiene {len(fallos)} intentos fallidos. Posible amenaza detectada.")


def MostrarReporte():
    """Muestra todos los intentos en forma de tabla y estadísticas básicas."""
    if not intentos:
        print("No hay intentos registrados todavía.")
        return

    df = pd.DataFrame(intentos, columns=["Usuario", "Servidor", "IP", "Tipo", "Hora", "Resultado"])
    print("\n📋 REPORTE DE INTENTOS DE ACCESO:\n")
    print(df)
    
    # Estadísticas
    total = len(df)
    exitos = len(df[df["Resultado"] == "Éxito"])
    fallos = len(df[df["Resultado"] == "Fallo"])
    
    print("\n📊 ESTADÍSTICAS:")
    print(f"  Total de intentos: {total}")
    print(f"  Éxitos: {exitos}")
    print(f"  Fallos: {fallos}")


# -----------------------------
# MENÚ PRINCIPAL
# -----------------------------
def menu():
    while True:
        print("\n===== SISTEMA DE MONITOREO DE ACCESOS =====")
        print("1. Registrar intento de acceso")
        print("2. Mostrar reporte de intentos")
        print("3. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            usuario = input("Ingrese nombre de usuario: ")
            servidor = input("Ingrese nombre del servidor: ")
            ip = input("Ingrese la dirección IP: ")
            tipo = input("Tipo de acceso (Remoto/Local): ")
            resultado = input("Resultado (Éxito/Fallo): ")
            RegistrarIntento(usuario, servidor, ip, tipo, resultado)
        
        elif opcion == "2":
            MostrarReporte()
        
        elif opcion == "3":
            print("👋 Saliendo del sistema. Hasta luego.")
            break
        
        else:
            print("❌ Opción inválida. Intente nuevamente.")


# -----------------------------
# EJECUCIÓN PRINCIPAL
# -----------------------------
if __name__ == "__main__":
    menu()
