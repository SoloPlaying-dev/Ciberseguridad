#include <iostream>
#include <vector>
#include <string>
#include <ctime>
#include <sstream>
#include <iomanip>
#include <algorithm>

// --- 1. DEFINICION DE ESTRUCTURAS DE DATOS ---

// Estructura para almacenar los datos de cada intento de acceso
struct Intento {
    std::string usuario;
    std::string servidor;
    std::string ip_origen;
    std::time_t hora;        // Timestamp (hora UNIX)
    bool acceso_exitoso;     // true si fue exitoso, false si fallo
    std::string tipo_acceso; // Ej: "SSH", "Web", "RDP"
};

// --- 2. VECTORES GLOBALES (BASE DE DATOS SIMULADA) ---

// Base de datos de intentos de acceso
std::vector<Intento> registro_intentos;

// Usuarios validos (solo para simulacion de credenciales)
const std::vector<std::string> USUARIOS_VALIDOS = {"admin", "hipolito", "sysop", "devuser"};

// Servidores disponibles
const std::vector<std::string> SERVIDORES_DISPONIBLES = {"srv_web01", "db_master", "ftp_gateway"};


// --- 3. FUNCIONES DE LOGICA DEL SISTEMA ---

/**
 * @brief Registra un intento de acceso en el sistema.
 */
void RegistrarIntento(const std::string& usuario, const std::string& servidor, const std::string& ip_origen, const std::string& tipo_acceso, const std::string& contrasena_ingresada) {
    Intento nuevoIntento;
    nuevoIntento.usuario = usuario;
    nuevoIntento.servidor = servidor;
    nuevoIntento.ip_origen = ip_origen;
    nuevoIntento.tipo_acceso = tipo_acceso;
    nuevoIntento.hora = std::time(nullptr); // Registrar la hora actual

    // Simulación simple de acceso exitoso
    bool usuario_existe = std::find(USUARIOS_VALIDOS.begin(), USUARIOS_VALIDOS.end(), usuario) != USUARIOS_VALIDOS.end();
    
    if (usuario_existe && contrasena_ingresada == "secure") {
        nuevoIntento.acceso_exitoso = true;
        std::cout << "[REGISTRO EXITOSO] Acceso de " << usuario << " a " << servidor << ".\n";
    } else {
        nuevoIntento.acceso_exitoso = false;
        std::cout << "[REGISTRO FALLIDO] Intento de " << usuario << " desde " << ip_origen << " fallo.\n";
    }

    registro_intentos.push_back(nuevoIntento);
}

/** * @brief Analiza los intentos fallidos recientes para detectar ataques de fuerza bruta. 
 * Detecta y alerta una vez por IP sospechosa en la ventana de tiempo.
 */
void GenerarAlertas() {
    const int MAX_FALLOS = 3;
    const int TIEMPO_VENTANA_SEGUNDOS = 60; // Ventana de tiempo: 60 segundos
    std::time_t ahora = std::time(nullptr);
    
    // Vector para almacenar las IPs que ya han activado una alerta
    std::vector<std::string> ips_ya_alertadas;

    // Iterar sobre cada intento
    for (const auto& intento : registro_intentos) {
        
        // 1. Verificar si la IP ya ha sido alertada. Si ya está, pasar al siguiente intento.
        bool ya_alertado = std::find(ips_ya_alertadas.begin(), ips_ya_alertadas.end(), intento.ip_origen) != ips_ya_alertadas.end();
        if (ya_alertado) {
            continue; 
        }

        // 2. Solo analizar si el intento fue fallido
        if (intento.acceso_exitoso == false) {
            int contador_fallos = 0;
            
            // Buscar y contar TODOS los fallos de esta IP en la ventana de tiempo
            for (const auto& intento_previo : registro_intentos) {
                if (intento_previo.ip_origen == intento.ip_origen && 
                    intento_previo.acceso_exitoso == false &&
                    (ahora - intento_previo.hora) <= TIEMPO_VENTANA_SEGUNDOS) {
                    
                    contador_fallos++;
                }
            }

            // 3. Generar alerta si se supero el umbral
            if (contador_fallos >= MAX_FALLOS) {
                std::cout << "\n======================================================\n";
                std::cout << "!!! ALERTA DE SEGURIDAD: POSIBLE ATAQUE DE FUERZA BRUTA !!!\n";
                std::cout << "  IP Sospechosa: " << intento.ip_origen << "\n";
                std::cout << "  Fallas detectadas: " << contador_fallos << " en los ultimos " << TIEMPO_VENTANA_SEGUNDOS << " segundos.\n";
                std::cout << "  Ultimo intento contra: " << intento.servidor << " (Usuario: " << intento.usuario << ")\n";
                std::cout << "======================================================\n";
                
                // 4. Marcar esta IP como alertada para no repetir la alerta
                ips_ya_alertadas.push_back(intento.ip_origen);
            }
        }
    }
}

/**
 * @brief Muestra un reporte detallado de todos los intentos registrados.
 */
void MostrarReporte() {
    if (registro_intentos.empty()) {
        std::cout << "\n[REPORTE] No hay intentos registrados.\n";
        return;
    }

    std::cout << "\n--- REPORTE DETALLADO DE ACCESOS (" << registro_intentos.size() << " Registros) ---\n";
    std::cout << std::left << std::setw(10) << "USUARIO"
              << std::setw(15) << "SERVIDOR"
              << std::setw(16) << "IP ORIGEN"
              << std::setw(8) << "TIPO"
              << std::setw(10) << "ESTADO"
              << "HORA DE ACCESO\n";
    std::cout << std::string(80, '-') << "\n";

    for (const auto& intento : registro_intentos) {
        // Convertir time_t a una estructura de tiempo local (para mostrar la hora legible)
        std::tm* ltm = std::localtime(&intento.hora);
        std::stringstream ss;
        ss << std::put_time(ltm, "%Y-%m-%d %H:%M:%S");
        
        std::cout << std::left << std::setw(10) << intento.usuario
                  << std::setw(15) << intento.servidor
                  << std::setw(16) << intento.ip_origen
                  << std::setw(8) << intento.tipo_acceso
                  << std::setw(10) << (intento.acceso_exitoso ? "EXITO" : "FALLO")
                  << ss.str() << "\n";
    }
    std::cout << std::string(80, '-') << "\n";
}


// --- 4. FUNCION PRINCIPAL (SIMULACION Y USO) ---

int main() {
    // Configuracion para mejor formato de salida
    std::cout.setf(std::ios::left);
    
    std::cout << "--- INICIO DEL SISTEMA DE MONITOREO DE ACCESOS ---\n";

    // --- ESCENARIO 1: Intento fallido simple ---
    RegistrarIntento("sysop", "srv_web01", "192.168.1.10", "SSH", "wrongpass");
    
    // --- ESCENARIO 2: Acceso exitoso ---
    RegistrarIntento("admin", "db_master", "10.0.0.5", "RDP", "secure");

    // --- ESCENARIO 3: Simulacion de ataque de fuerza bruta (3 fallos rapidos desde la misma IP) ---
    std::cout << "\n>> Simulacion de Ataque de Fuerza Bruta...\n";
    RegistrarIntento("user_a", "ftp_gateway", "172.16.10.20", "FTP", "p1");
    RegistrarIntento("user_b", "ftp_gateway", "172.16.10.20", "FTP", "p2");
    RegistrarIntento("user_c", "ftp_gateway", "172.16.10.20", "FTP", "p3"); // Tercer fallo consecutivo

    // --- ESCENARIO 4: Intento exitoso despues de la alerta ---
    RegistrarIntento("devuser", "srv_web01", "10.0.0.5", "Web", "secure");

    
    // --- GENERACION DE REPORTES Y ALERTAS ---
    
    // 1. Generar alerta (deberia detectar el ataque de 172.16.10.20 una sola vez)
    GenerarAlertas();
    
    // 2. Mostrar el reporte de todos los eventos
    MostrarReporte();

    std::cout << "\n--- FIN DEL MONITOREO ---\n";
    return 0;
}