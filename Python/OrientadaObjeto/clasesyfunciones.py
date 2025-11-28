class Usuario:
    def __init__(self, nombre, edad):
        # Atributos de la clase
        self.nombre = nombre
        self.edad = edad
    
    def mostrar_datos(self):
        """Muestra el nombre y la edad del usuario."""
        print(f"Nombre del Usuario: {self.nombre}")
        print(f"Edad del Usuario: {self.edad} años")

# Ejemplo de uso:
print("--- Ejemplo Usuario ---")
usuario1 = Usuario("Ana García", 30)
usuario1.mostrar_datos()

class Rectangulo:
    def __init__(self, base, altura):
        # Atributos de la clase
        self.base = base
        self.altura = altura
    
    def calcular_area(self):
        """Calcula y devuelve el área del rectángulo (base * altura)."""
        area = self.base * self.altura
        return area

# Ejemplo de uso:
print("\n--- Ejemplo Rectangulo ---")
rectangulo1 = Rectangulo(base=10, altura=5)
area_rectangulo = rectangulo1.calcular_area()
print(f"Base: {rectangulo1.base}, Altura: {rectangulo1.altura}")
print(f"Área calculada: {area_rectangulo}")

class Coche:
    def __init__(self, marca, velocidad_inicial=0):
        # Atributos de la clase
        self.marca = marca
        self.velocidad = velocidad_inicial
    
    def aumentar_velocidad(self, incremento):
        """Aumenta la velocidad actual por el valor del incremento."""
        self.velocidad += incremento
        print(f"El coche {self.marca} ha aumentado su velocidad en {incremento} km/h.")
        print(f"Velocidad actual: {self.velocidad} km/h.")

# Ejemplo de uso:
print("\n--- Ejemplo Coche ---")
mi_coche = Coche("Toyota")
print(f"Coche: {mi_coche.marca}, Velocidad inicial: {mi_coche.velocidad} km/h")
mi_coche.aumentar_velocidad(50)
mi_coche.aumentar_velocidad(20)

class CuentaBancaria:
    def __init__(self, titular, balance_inicial=0.0):
        # Atributos de la clase
        self.titular = titular
        self.balance = balance_inicial
    
    def depositar(self, cantidad):
        """Añade una cantidad al balance de la cuenta."""
        if cantidad > 0:
            self.balance += cantidad
            print(f"Depósito de ${cantidad:.2f} realizado.")
        else:
            print("Error: La cantidad a depositar debe ser positiva.")
        self._mostrar_balance()
    
    def retirar(self, cantidad):
        """Retira una cantidad del balance, si hay fondos suficientes."""
        if cantidad > 0:
            if self.balance >= cantidad:
                self.balance -= cantidad
                print(f"Retiro de ${cantidad:.2f} realizado.")
            else:
                print("Error: Balance insuficiente para realizar el retiro.")
        else:
            print("Error: La cantidad a retirar debe ser positiva.")
        self._mostrar_balance()

    def _mostrar_balance(self):
        """Función interna para mostrar el balance actual."""
        print(f"Balance actual de {self.titular}: ${self.balance:.2f}")

# Ejemplo de uso:
print("\n--- Ejemplo CuentaBancaria ---")
cuenta = CuentaBancaria("Carlos Ruiz", 100.00)
cuenta.depositar(50.50)
cuenta.retirar(25.00)
cuenta.retirar(200.00) # Intento fallido

class Estudiante:
    def __init__(self, nombre, calificaciones):
        # Atributos de la clase
        self.nombre = nombre
        # Las calificaciones se guardan como una lista
        self.calificaciones = calificaciones
    
    def calcular_promedio(self):
        """Calcula el promedio (media) de todas las calificaciones."""
        if not self.calificaciones:
            return 0.0 # Devuelve 0 si no hay calificaciones
        
        suma = sum(self.calificaciones)
        cantidad = len(self.calificaciones)
        promedio = suma / cantidad
        return promedio

# Ejemplo de uso:
print("\n--- Ejemplo Estudiante ---")
notas_sofia = [85, 92, 78, 95, 88]
estudiante1 = Estudiante("Sofía López", notas_sofia)

promedio_final = estudiante1.calcular_promedio()

print(f"Estudiante: {estudiante1.nombre}")
print(f"Calificaciones: {estudiante1.calificaciones}")
print(f"Promedio calculado: {promedio_final:.2f}")