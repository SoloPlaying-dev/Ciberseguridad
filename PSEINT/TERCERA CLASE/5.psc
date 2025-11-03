Algoritmo sin_titulo
	Definir monto, total Como Real
    Escribir "Ingrese el monto de la compra: "
    Leer monto
    Si monto > 500 Entonces
        total <- monto * 0.90
        Escribir "Total a pagar con 10% de descuento: ", total
    Sino
        Escribir "Total a pagar: ", monto
    FinSi
FinAlgoritmo
