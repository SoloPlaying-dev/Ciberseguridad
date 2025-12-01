class Animal:
    """Clase base para todos los animales."""
    def hablar(self):
        """Método base que debe ser sobreescrito por las clases hijas."""
        return "El animal hace un sonido."

class Perro(Animal):
    """Clase para perros, hereda de Animal."""
    def hablar(self):
        """Sobreescribe el método hablar para el perro."""
        return "Guau, guau!"

class Gato(Animal):
    """Clase para gatos, hereda de Animal."""
    def hablar(self):
        """Sobreescribe el método hablar para el gato."""
        return "Miau."

# Ejemplo de uso
print("--- 1. Animales ---")
mi_perro = Perro()
mi_gato = Gato()
print(f"El perro dice: {mi_perro.hablar()}")
print(f"El gato dice: {mi_gato.hablar()}")

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 2
class Empleado:
    """Clase base para empleados con nombre y salario."""
    def __init__(self, nombre, salario):
        self.nombre = nombre
        self.salario = salario

    def calcular_bono(self):
        """Método base para calcular el bono. Debe ser sobreescrito."""
        return 0  # Bono por defecto

class Gerente(Empleado):
    """Clase para gerentes con un bono basado en un porcentaje mayor."""
    def calcular_bono(self):
        """Calcula un bono del 10% del salario para el gerente."""
        return self.salario * 0.10

class Tecnico(Empleado):
    """Clase para técnicos con un bono de monto fijo."""
    def calcular_bono(self):
        """Calcula un bono fijo de $500 para el técnico."""
        return 500

# Ejemplo de uso
print("\n--- 2. Empleados y Bonos ---")
gerente = Gerente("Ana Pérez", 60000)
tecnico = Tecnico("Luis Gómez", 40000)

print(f"Bono de {gerente.nombre}: ${gerente.calcular_bono():,.2f}")
print(f"Bono de {tecnico.nombre}: ${tecnico.calcular_bono():,.2f}")

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 3
import math

class Figura:
    """Clase base para figuras geométricas."""
    def area(self):
        """Método base para calcular el área."""
        raise NotImplementedError("Las subclases deben implementar este método.")

class Circulo(Figura):
    """Clase para un círculo, calcula el área como pi * radio^2."""
    def __init__(self, radio):
        self.radio = radio

    def area(self):
        """Calcula el área del círculo."""
        return math.pi * (self.radio ** 2)

class Cuadrado(Figura):
    """Clase para un cuadrado, calcula el área como lado * lado."""
    def __init__(self, lado):
        self.lado = lado

    def area(self):
        """Calcula el área del cuadrado."""
        return self.lado * self.lado

# Ejemplo de uso
print("\n--- 3. Figuras y Área ---")
mi_circulo = Circulo(5)
mi_cuadrado = Cuadrado(4)

print(f"Área del Círculo (radio 5): {mi_circulo.area():.2f}")
print(f"Área del Cuadrado (lado 4): {mi_cuadrado.area()}")
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 4
class Vehiculo:
    """Clase base para cualquier vehículo."""
    def mover(self):
        """Método base de movimiento."""
        return "El vehículo se está moviendo."

class Carro(Vehiculo):
    """Clase para un carro."""
    def mover(self):
        """Implementación de movimiento para un carro."""
        return "El carro acelera con el motor."

class Bicicleta(Vehiculo):
    """Clase para una bicicleta."""
    def mover(self):
        """Implementación de movimiento para una bicicleta."""
        return "La bicicleta se mueve pedaleando."

# Ejemplo de uso
print("\n--- 4. Vehículos y Movimiento ---")
un_carro = Carro()
una_bici = Bicicleta()

print(f"Carro: {un_carro.mover()}")
print(f"Bicicleta: {una_bici.mover()}")
#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 5
class Dispositivo:
    """Clase base para dispositivos electrónicos."""
    def encender(self):
        """Método base para encender el dispositivo."""
        return "Dispositivo encendido."

class Laptop(Dispositivo):
    """Clase para una laptop."""
    def encender(self):
        """Sobreescribe el método para una laptop."""
        return "La laptop está iniciando el sistema operativo..."

class Telefono(Dispositivo):
    """Clase para un teléfono."""
    def encender(self):
        """Sobreescribe el método para un teléfono."""
        return "El teléfono vibra y muestra el logo de inicio."

# Ejemplo de uso
print("\n--- 5. Dispositivos y Encendido ---")
mi_laptop = Laptop()
mi_telefono = Telefono()

print(f"Laptop: {mi_laptop.encender()}")
print(f"Teléfono: {mi_telefono.encender()}")