# ===============================================
# SIMULADOR DE FIREWALL BÁSICO
# Autor: (Hipolito Junior Rodriguez)
# Descripción:
# Este programa simula el funcionamiento básico de un firewall:
# ===============================================

import datetime  # Para registrar hora de llegada
import pandas as pd  # Para mostrar reportes de forma tabular

# -----------------------------
# ESTRUCTURAS DE DATOS
# -----------------------------
# Vector con IPs bloqueadas
ips_bloqueadas = ["192.168.1.100", "10.0.0.5"]

# Matriz para registros de paquetes (IP, puerto, protocolo, hora, acción)
registros = []

# -----------------------------
# FUNCIONES PRINCIPALES
# -----------------------------

def RegistrarPaquete(ip, puerto, protocolo):
    """Registra la llegada de un paquete y aplica las reglas de bloqueo."""
    hora = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Verificar si la IP está bloqueada
    if ip in ips_bloqueadas:
        accion = "Bloqueado"
        GenerarAlertas(ip, puerto, protocolo)
    else:
        accion = "Permitido"
    
    # Guardamos el registro
    paquete = [ip, puerto, protocolo, hora, accion]
    registros.append(paquete)
    
    print(f"📦 Paquete recibido de {ip}:{puerto}/{protocolo} -> {accion}")


def GenerarAlertas(ip, puerto, protocolo):
    """Genera alerta cuando se detecta un paquete bloqueado."""
    print(f"⚠️ ALERTA: Paquete bloqueado de {ip} en puerto {puerto} usando {protocolo}.")


def MostrarRegistros():
    """Muestra todos los registros de paquetes procesados."""
    if not registros:
        print("No hay registros aún.")
        return
    
    df = pd.DataFrame(registros, columns=["IP Origen", "Puerto", "Protocolo", "Hora", "Acción"])
    print("\n📋 REGISTRO DE PAQUETES:\n")
    print(df)
    
    # Mostrar estadísticas simples
    total = len(df)
    bloqueados = len(df[df["Acción"] == "Bloqueado"])
    permitidos = len(df[df["Acción"] == "Permitido"])
    
    print("\n📊 ESTADÍSTICAS:")
    print(f"  Total de paquetes: {total}")
    print(f"  Permitidos: {permitidos}")
    print(f"  Bloqueados: {bloqueados}")


def AgregarRegla():
    """Permite al usuario agregar una nueva IP a la lista de bloqueadas."""
    nueva_ip = input("Ingrese la IP que desea bloquear: ")
    if nueva_ip not in ips_bloqueadas:
        ips_bloqueadas.append(nueva_ip)
        print(f"✅ IP {nueva_ip} agregada a la lista de bloqueadas.")
    else:
        print("⚠️ Esa IP ya está bloqueada.")


def MostrarReglas():
    """Muestra las IPs actualmente bloqueadas."""
    print("\n🚫 LISTA DE IPS BLOQUEADAS:")
    for i, ip in enumerate(ips_bloqueadas, 1):
        print(f"{i}. {ip}")


# -----------------------------
# MENÚ PRINCIPAL
# -----------------------------
def menu():
    while True:
        print("\n===== SIMULADOR DE FIREWALL BÁSICO =====")
        print("1. Registrar paquete entrante")
        print("2. Mostrar registros")
        print("3. Mostrar IPs bloqueadas")
        print("4. Agregar nueva regla (bloquear IP)")
        print("5. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            ip = input("Ingrese la IP de origen: ")
            puerto = input("Ingrese el puerto: ")
            protocolo = input("Ingrese el protocolo (TCP/UDP): ")
            RegistrarPaquete(ip, puerto, protocolo)
        
        elif opcion == "2":
            MostrarRegistros()
        
        elif opcion == "3":
            MostrarReglas()
        
        elif opcion == "4":
            AgregarRegla()
        
        elif opcion == "5":
            print("👋 Saliendo del simulador de firewall.")
            break
        
        else:
            print("❌ Opción inválida. Intente de nuevo.")


# -----------------------------
# EJECUCIÓN PRINCIPAL
# -----------------------------
if __name__ == "__main__":
    menu()
