# ==========================================================
# SIMULACIÓN DE ESCANEO DE VULNERABILIDADES
# Autor: (Hipolito Junior Rodriguez)
# Descripción:
#   Este programa simula el proceso de escaneo de vulnerabilidades
#   en una red. Permite registrar hosts, analizar sus servicios,
#   detectar vulnerabilidades y generar reportes de riesgo.
# ==========================================================

import random
import pandas as pd  # Para mostrar reportes en tablas

# -----------------------------
# ESTRUCTURAS DE DATOS
# -----------------------------
hosts = []                     # Lista de hosts (direcciones IP o nombres)
servicios = []                 # Matriz: servicios por host
vulnerabilidades = []          # Matriz: vulnerabilidades por host
riesgos = []                   # Vector de niveles de riesgo por host


# -----------------------------
# FUNCIONES PRINCIPALES
# -----------------------------
def RegistrarHost():
    """Registra un nuevo host en la red."""
    ip = input("Ingrese la dirección IP o nombre del host: ")
    hosts.append(ip)
    servicios.append([])         # Se crea una lista vacía de servicios para este host
    vulnerabilidades.append([])  # Lista vacía de vulnerabilidades
    riesgos.append("Desconocido")
    print(f"✅ Host '{ip}' registrado correctamente.")


def AnalizarVulnerabilidades():
    """Simula el escaneo de servicios y vulnerabilidades."""
    if not hosts:
        print("❌ No hay hosts registrados para analizar.")
        return

    print("\n🔍 Iniciando análisis de vulnerabilidades...")
    for i in range(len(hosts)):
        # Simulación de servicios detectados
        servicios_detectados = random.sample(
            ["HTTP", "SSH", "FTP", "DNS", "SMTP", "Telnet", "MySQL"],
            random.randint(1, 4)
        )
        servicios[i] = servicios_detectados

        # Simulación de vulnerabilidades
        vulns_detectadas = random.sample(
            ["CVE-2023-1234", "CVE-2022-7777", "CVE-2024-9900", "Sin vulnerabilidades"],
            random.randint(1, 3)
        )
        vulnerabilidades[i] = vulns_detectadas

        # Asignación de riesgo según vulnerabilidad
        if "Sin vulnerabilidades" in vulns_detectadas:
            riesgo = "Bajo"
        elif len(vulns_detectadas) == 1:
            riesgo = "Medio"
        else:
            riesgo = "Alto"

        riesgos[i] = riesgo
        print(f"Host: {hosts[i]} | Servicios: {servicios_detectados} | Riesgo: {riesgo}")

    print("✅ Escaneo completado.")


def MostrarReporte():
    """Muestra un reporte detallado de todos los hosts analizados."""
    if not hosts:
        print("📭 No hay datos registrados.")
        return

    data = []
    for i in range(len(hosts)):
        data.append([
            hosts[i],
            ", ".join(servicios[i]) if servicios[i] else "No escaneado",
            ", ".join(vulnerabilidades[i]) if vulnerabilidades[i] else "No escaneado",
            riesgos[i]
        ])
    
    df = pd.DataFrame(data, columns=["Host", "Servicios", "Vulnerabilidades", "Nivel de Riesgo"])
    print("\n📋 REPORTE DE VULNERABILIDADES:")
    print(df)


def GenerarAlertas():
    """Muestra alertas de seguridad según el nivel de riesgo."""
    print("\n🚨 ALERTAS DE SEGURIDAD:")
    alerta_generada = False

    for i in range(len(hosts)):
        if riesgos[i] == "Alto":
            print(f"⚠️ Host {hosts[i]} presenta vulnerabilidades críticas ({riesgos[i]}).")
            alerta_generada = True

    if not alerta_generada:
        print("✅ No se detectaron alertas críticas en la red.")


# -----------------------------
# MENÚ PRINCIPAL
# -------------------------
