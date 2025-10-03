Algoritmo sin_titulo
	Definir Drog Como Entero
	Repetir
			Escribir "----------------Menu de Drog---------------"
			Escribir "1.- Acetaminophen"
			Escribir "2.- Paracetamol"
			Escribir "3.- Prodom"
			Escribir "4.- Salir" 
			Escribir "Seleccione Una Opcion: "
			Leer Drog
			Segun Drog Hacer
				1:
					Escribir "Para Dolores de CABEZA tenemos"
					Escribir " MK "
					Escribir "Cobrando La Orden."
				2:
					Escribir "Para La FIEBRE tenemos"
					Escribir " Paracetamol "
					Escribir "Cobrando La Orden"
				3:
					Escribir "Para La DIARREA tenemos"
					Escribir " Prodom "
					Escribir "Cobrando La Orden."
				De Otro Modo:
					Escribir "Gracias Por Visitarnos."
			Fin Segun
	Hasta Que Drog >= 4

FinAlgoritmo
