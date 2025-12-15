#include <iostream>
#include <string>
#include <algorithm> // Necesario para std::max en Ejercicio 5
#include <vector>    // Necesario para colecciones en Ejercicio 6

// --- 1. Operaciones Básicas ---
void ejercicio1() {
    std::cout << "\n--- 1. Operaciones Básicas ---\n";
    int num1, num2;
    std::cout << "Ingrese el primer número entero: ";
    if (!(std::cin >> num1)) return; 
    std::cout << "Ingrese el segundo número entero: ";
    if (!(std::cin >> num2)) return;

    double division = 0.0;
    if (num2 != 0) {
        division = static_cast<double>(num1) / num2;
    }

    std::cout << "Suma: " << (num1 + num2) << "\n";
    std::cout << "Resta: " << (num1 - num2) << "\n";
    std::cout << "Multiplicación: " << (num1 * num2) << "\n";
    if (num2 != 0) {
        std::cout << "División: " << division << "\n";
    } else {
        std::cout << "División: Indefinida (División por cero)\n";
    }
}

// --- 2. Ficha de Usuario ---
void ejercicio2() {
    std::cout << "\n--- 2. Ficha de Usuario ---\n";
    std::string nombre;
    int edad;
    float estatura;

    std::cin.ignore(); // Limpiar el buffer de entrada antes de getline
    std::cout << "Ingrese su nombre: ";
    std::getline(std::cin, nombre);

    std::cout << "Ingrese su edad (años): ";
    if (!(std::cin >> edad)) return;
    std::cout << "Ingrese su estatura (metros): ";
    if (!(std::cin >> estatura)) return;

    std::cout << "\n--- FICHA DE USUARIO ---\n";
    std::cout << "Nombre: " << nombre << "\n";
    std::cout << "Edad: " << edad << " años\n";
    std::cout << "Estatura: " << estatura << " metros\n";
    std::cout << "------------------------\n";
}

// --- 3. Conversión de Celsius a Fahrenheit ---
void ejercicio3() {
    std::cout << "\n--- 3. Conversión de Celsius a Fahrenheit ---\n";
    double celsius, fahrenheit;

    std::cout << "Ingrese la temperatura en grados Celsius (°C): ";
    if (!(std::cin >> celsius)) return;

    // Fórmula: F = C * (9/5) + 32
    fahrenheit = celsius * (9.0 / 5.0) + 32.0;

    std::cout << celsius << " °C equivalen a " << fahrenheit << " °F\n";
}

// --- 4. Área de un Rectángulo ---
void ejercicio4() {
    std::cout << "\n--- 4. Área de un Rectángulo ---\n";
    float base, altura, area;

    std::cout << "Ingrese la base del rectángulo: ";
    if (!(std::cin >> base)) return;
    std::cout << "Ingrese la altura del rectángulo: ";
    if (!(std::cin >> altura)) return;

    area = base * altura;

    std::cout << "El área del rectángulo es: " << area << "\n";
}

// --- 5. Estructura Estudiante y Mejor Promedio ---
struct Estudiante {
    std::string nombre;
    int edad;
    float promedio;
};

void ejercicio5() {
    std::cout << "\n--- 5. Estructura Estudiante y Mejor Promedio ---\n";

    // Registro de 3 estudiantes
    Estudiante estudiante1 = {"Ana", 20, 9.5f};
    Estudiante estudiante2 = {"Luis", 21, 8.8f};
    Estudiante estudiante3 = {"Maria", 19, 9.7f};

    // Determinar el mejor promedio
    float mejorPromedio = std::max({estudiante1.promedio, estudiante2.promedio, estudiante3.promedio});

    std::cout << "Estudiantes registrados:\n";
    std::cout << "1. " << estudiante1.nombre << " (Promedio: " << estudiante1.promedio << ")\n";
    std::cout << "2. " << estudiante2.nombre << " (Promedio: " << estudiante2.promedio << ")\n";
    std::cout << "3. " << estudiante3.nombre << " (Promedio: " << estudiante3.promedio << ")\n";
    std::cout << "El mejor promedio es: " << mejorPromedio << "\n";
}

// --- 6. Estructura Producto y Valor Total de Inventario ---
struct Producto {
    std::string nombre;
    double precio;
    int cantidad;
};

void ejercicio6() {
    std::cout << "\n--- 6. Estructura Producto y Valor Total de Inventario ---\n";

    // Registro de 5 productos usando un vector
    std::vector<Producto> inventario = {
        {"Laptop", 1200.00, 5},
        {"Mouse", 25.50, 50},
        {"Teclado", 75.00, 15},
        {"Monitor", 350.00, 10},
        {"Webcam", 50.00, 20}
    };

    double valorTotalInventario = 0.0;
    std::cout << "Inventario registrado:\n";

    // Cálculo del valor total usando un ciclo for-each
    for (const auto& p : inventario) {
        double valorProducto = p.precio * p.cantidad;
        valorTotalInventario += valorProducto;
        std::cout << "- " << p.nombre << " (" << p.cantidad << " uds @ $" << p.precio << " c/u, Valor: $" << valorProducto << ")\n";
    }

    std::cout << "El valor total del inventario es: $" << valorTotalInventario << "\n";
}

// --- 7. Tabla de Multiplicar con Ciclo for ---
void ejercicio7() {
    std::cout << "\n--- 7. Tabla de Multiplicar con Ciclo for ---\n";
    int numero;
    
    std::cout << "Ingrese un número entero para ver su tabla de multiplicar: ";
    if (!(std::cin >> numero)) return;

    std::cout << "\n--- Tabla del " << numero << " ---\n";
    for (int i = 1; i <= 12; ++i) {
        int resultado = numero * i;
        std::cout << numero << " x " << i << " = " << resultado << "\n";
    }
}

// --- 8. Suma de Números con Ciclo while ---
void ejercicio8() {
    std::cout << "\n--- 8. Suma de Números con Ciclo while ---\n";
    int numero;
    long long sumaTotal = 0; // Usar long long para evitar desbordamiento

    std::cout << "Ingrese números para sumarlos. Ingrese 0 para terminar.\n";

    while (true) {
        std::cout << "Ingrese un número: ";
        if (!(std::cin >> numero)) return;

        if (numero == 0) {
            break;
        }
        sumaTotal += numero;
    }

    std::cout << "La suma total de los números ingresados es: " << sumaTotal << "\n";
}

// --- 9. Menú de Calculadora con Ciclo do-while ---
void ejercicio9() {
    std::cout << "\n--- 9. Menú de Calculadora con Ciclo do-while ---\n";
    int opcion, num1, num2, resultado;

    do {
        std::cout << "\n--- Menú de Operaciones ---\n";
        std::cout << "1. Sumar\n";
        std::cout << "2. Restar\n";
        std::cout << "3. Multiplicar\n";
        std::cout << "4. Salir\n";
        std::cout << "Seleccione una opción (1-4): ";
        
        if (!(std::cin >> opcion)) {
             std::cin.clear();
             std::cin.ignore(10000, '\n');
             opcion = 0; // Forzar re-intento o salida
        }

        if (opcion >= 1 && opcion <= 3) {
            std::cout << "Ingrese el primer número: ";
            if (!(std::cin >> num1)) return;
            std::cout << "Ingrese el segundo número: ";
            if (!(std::cin >> num2)) return;
        }

        switch (opcion) {
            case 1:
                resultado = num1 + num2;
                std::cout << "Resultado de la suma: " << resultado << "\n";
                break;
            case 2:
                resultado = num1 - num2;
                std::cout << "Resultado de la resta: " << resultado << "\n";
                break;
            case 3:
                resultado = num1 * num2;
                std::cout << "Resultado de la multiplicación: " << resultado << "\n";
                break;
            case 4:
                std::cout << "Saliendo del programa. ¡Adiós!\n";
                break;
            default:
                std::cout << "Opción no válida. Intente de nuevo.\n";
                break;
        }
    } while (opcion != 4);
}

// --- 10. Conteo de Pares e Impares con Ciclo for ---
void ejercicio10() {
    std::cout << "\n--- 10. Conteo de Pares e Impares con Ciclo for ---\n";
    int numero;
    int contadorPares = 0;
    int contadorImpares = 0;

    std::cout << "A continuación, ingrese 10 números enteros.\n";

    for (int i = 1; i <= 10; ++i) {
        std::cout << "Ingrese el número " << i << ": ";
        if (!(std::cin >> numero)) return;

        // Si el residuo de la división por 2 es 0, es par.
        if (numero % 2 == 0) {
            contadorPares++;
        } else {
            contadorImpares++;
        }
    }

    std::cout << "\n--- RESUMEN ---\n";
    std::cout << "Total de números pares: " << contadorPares << "\n";
    std::cout << "Total de números impares: " << contadorImpares << "\n";
}

// Función principal para llamar a todos los ejercicios
int main() {
    // Configuración para mejor visualización de números flotantes
    std::cout.setf(std::ios::fixed);
    std::cout.precision(2);

    // Llamada secuencial a todos los ejercicios
    ejercicio1();
    ejercicio2();
    ejercicio3();
    ejercicio4();
    ejercicio5();
    ejercicio6();
    ejercicio7();
    ejercicio8();
    ejercicio9();
    ejercicio10();

    return 0;
}