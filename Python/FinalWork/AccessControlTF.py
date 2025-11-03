# ==========================================================
# CONTROL DE ACCESOS A RED WIFI
# Autor: (Hipolito Junior Rodriguez)
# Descripción:
#   Este programa simula un sistema de control de accesos a
#   una red WiFi, registrando dispositivos conectados,
#   validando límites de conexión y generando alertas.
# ==========================================================

import random
import pandas as pd  # para mostrar reportes en formato tabla

# -----------------------------
# ESTRUCTURAS DE DATOS
# -----------------------------
dispositivos = []        # Lista de dispositivos registrados (MAC)
usuarios = []            # Lista de nombres o identificadores de usuarios
conexiones = []          # Matriz: conexiones por usuario [ [MAC, IP, Estado] ]
LIMITE_CONEXIONES = 3    # Número máximo de conexiones por usuario


# -----------------------------
# FUNCIONES PRINCIPALES
# -----------------------------
def RegistrarDispositivo():
    """Registra un nuevo dispositivo en la red WiFi."""
    usuario = input("Ingrese el nombre del usuario: ")
    mac = input("Ingrese la dirección MAC del dispositivo: ")
    ip = f"192.168.1.{random.randint(2, 254)}"

    # Guardamos los datos
    dispositivos.append(mac)
    usuarios.append(usuario)
    conexiones.append([mac, ip, "Conectado"])

    print(f"✅ Dispositivo {mac} (Usuario: {usuario}) conectado con IP {ip}.")


def ValidarAcceso():
    """Valida el número de conexiones por usuario y genera alertas."""
    print("\n🔎 Validando conexiones...")
    conteo_usuarios = {}

    # Contar conexiones por usuario
    for u in usuarios:
        conteo_usuarios[u] = conteo_usuarios.get(u, 0) + 1

    for usuario, total in conteo_usuarios.items():
        if total > LIMITE_CONEXIONES:
            print(f"⚠️ ALERTA: Usuario {usuario} supera el límite ({total}/{LIMITE_CONEXIONES}).")
        else:
            print(f"✅ Usuario {usuario} dentro del límite ({total}/{LIMITE_CONEXIONES}).")


def GenerarAlertas():
    """Detecta dispositivos no autorizados en la red."""
    print("\n🚨 Analizando accesos no autorizados...")
    alertas = False
    for i in range(len(dispositivos)):
        # Simular detección aleatoria de dispositivos sospechosos
        sospechoso = random.choice([True, False, False])
        if sospechoso:
            print(f"⚠️ Dispositivo {dispositivos[i]} ({usuarios[i]}) podría ser NO AUTORIZADO.")