def nombre(): #funcion to print name
    print("Hipolito ES EL MEJOR")
    nombre()

def mostrar_mensaje(mensaje):
    print("--------------------------------------------------------")
    print(mensaje)
    print("--------------------------------------------------------")

def sumar():
    valor1=int(input("Ingrese el primer numero a sumar"))
    valor2=int(input("Ingrese el segundo numero a sumar: "))
    suma=valor1+valor2
    print("El Resultado de la Suma es: ",suma)

    def restar():
        valor1=int(input("Ingrese el primer numero a restar: "))
        valor2=int(input("Ingrese el segundo numero a restar: "))
        resta=valor1-valor2
        print("El Resultado de la Resta es: ",resta)

    def multiplicar():
        valor1=int(input("Ingrese el primer numero a multiplicar: "))
        valor2=int(input("Ingrese el segundo numero a multiplicar: "))
        multiplicacion=valor1*valor2
        print("El Resultado de la Multiplicacion es: ",multiplicacion)

    def dividir():
        valor1=int(input("Ingrese el primer numero a dividir: "))
        valor2=int(input("Ingrese el segundo numero a dividir: "))
        division=valor1/valor2
        print("El Resultado de la Division es: ",division)

    mostrar_mensaje("Fin de la Division")
    mostrar_mensaje("Fin de la Suma")    
    mostrar_mensaje("Fin de la Resta")
    mostrar_mensaje("Fin de la Multiplicacion")
    restar()
    multiplicar()
    dividir()
    sumar()

