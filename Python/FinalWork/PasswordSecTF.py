# ===============================================
# GESTOR DE CONTRASEÑAS SEGURAS
# Autor: (Hipolito Junior Rodriguez)
# Descripción:
#   Este programa permite registrar usuarios con contraseñas,
# ===============================================

import re  # Para validar la fuerza de contraseñas
import pandas as pd  # Para mostrar reportes de forma tabular

# -----------------------------
# ESTRUCTURAS DE DATOS
# -----------------------------
usuarios = []         # Vector de nombres de usuario
contraseñas = []      # Vector de contraseñas (solo ejemplo educativo, en la realidad se deben cifrar)
alertas = []          # Vector para almacenar alertas generadas

# -----------------------------
# FUNCIONES PRINCIPALES
# -----------------------------

def VerificarContraseña(contraseña):
    """
    Evalúa la fuerza de una contraseña.
    Retorna una puntuación de 0 a 5 según criterios de seguridad.
    """
    score = 0
    
    # Longitud mínima
    if len(contraseña) >= 8:
        score += 1
    # Mayúsculas
    if re.search(r"[A-Z]", contraseña):
        score += 1
    # Minúsculas
    if re.search(r"[a-z]", contraseña):
        score += 1
    # Números
    if re.search(r"[0-9]", contraseña):
        score += 1
    # Símbolos especiales
    if re.search(r"[@$!%*?&]", contraseña):
        score += 1
    
    return score


def GenerarAlertas(usuario, contraseña, score):
    """Genera alertas si la contraseña es débil."""
    if score <= 2:
        alerta = f"⚠️ Alerta: La contraseña del usuario '{usuario}' es débil ({contraseña})"
        alertas.append(alerta)
        print(alerta)


def RegistrarUsuario():
    """Permite registrar un nuevo usuario con su contraseña."""
    usuario = input("Ingrese el nombre de usuario: ")
    contraseña = input("Ingrese la contraseña: ")

    score = VerificarContraseña(contraseña)

    if score <= 2:
        print("❌ Contraseña débil. Intente con una más segura.")
    else:
        usuarios.append(usuario)
        contraseñas.append(contraseña)
        print("✅ Usuario registrado exitosamente.")
    
    GenerarAlertas(usuario, contraseña, score)


def MostrarUsuarios():
    """Muestra la lista de usuarios registrados y su nivel de seguridad."""
    if not usuarios:
        print("No hay usuarios registrados aún.")
        return
    
    data = []
    for i in range(len(usuarios)):
        score = VerificarContraseña(contraseñas[i])
        if score <= 2:
            nivel = "Débil"
        elif score <= 4:
            nivel = "Media"
        else:
            nivel = "Fuerte"
        data.append([usuarios[i], "*" * len(contraseñas[i]), nivel])
    
    df = pd.DataFrame(data, columns=["Usuario", "Contraseña", "Seguridad"])
    print("\n📋 LISTA DE USUARIOS Y CONTRASEÑAS:")
    print(df)


def MostrarAlertas():
    """Muestra las alertas registradas."""
    if not alertas:
        print("No hay alertas por ahora.")
    else:
        print("\n🚨 ALERTAS DE CONTRASEÑAS DÉBILES:")
        for alerta in alertas:
            print(alerta)


# -----------------------------
# MENÚ PRINCIPAL
# -----------------------------
def menu():
    while True:
        print("\n===== GESTOR DE CONTRASEÑAS SEGURAS =====")
        print("1. Registrar nuevo usuario")
        print("2. Mostrar usuarios y niveles de seguridad")
        print("3. Ver alertas generadas")
        print("4. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            RegistrarUsuario()
        
        elif opcion == "2":
            MostrarUsuarios()
        
        elif opcion == "3":
            MostrarAlertas()
        
        elif opcion == "4":
            print("👋 Saliendo del gestor de contraseñas.")
            break
        
        else:
            print("❌ Opción inválida. Intente de nuevo.")


# -----------------------------
# EJECUCIÓN PRINCIPAL
# -----------------------------
if __name__ == "__main__":
    menu()
