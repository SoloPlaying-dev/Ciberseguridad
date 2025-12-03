import tkinter as tk
from tkinter import ttk # Importante para widgets con estilo

class Aplicacion:
    def __init__(self):
        # Configuración de la Ventana
        self.ventana = tk.Tk()
        self.ventana.title("Ejercicio 240 - Combobox")

        # 1. Entrada de Nombre
        self.label_nombre = ttk.Label(self.ventana, text="Ingrese nombre:")
        self.label_nombre.grid(column=0, row=0, padx=10, pady=5, sticky="w")
        
        self.nombre_var = tk.StringVar()
        self.entry_nombre = ttk.Entry(self.ventana, width=40, textvariable=self.nombre_var)
        self.entry_nombre.grid(column=0, row=1, padx=10, pady=5, sticky="ew")

        # 2. Combobox (Lista Desplegable)
        self.label_pais = ttk.Label(self.ventana, text="Seleccione país:")
        self.label_pais.grid(column=0, row=2, padx=10, pady=5, sticky="w")
        
        self.pais_var = tk.StringVar()
        paises = ("Argentina", "Chile", "Bolivia", "Paraguay", "Brasil", "Uruguay")
        
        self.combobox_pais = ttk.Combobox(self.ventana, 
            width=37, # Ajustar ancho para consistencia
            textvariable=self.pais_var, 
            values=paises,
            state='readonly')
        self.combobox_pais.current(0) # Establecer un valor por defecto
        self.combobox_pais.grid(column=0, row=3, padx=10, pady=5, sticky="ew")

        # 3. Botón de Acción (Usando ttk.Button)
        self.boton_recuperar = ttk.Button(self.ventana, text="Recuperar Datos", command=self.mostrar_datos)
        self.boton_recuperar.grid(column=0, row=4, padx=10, pady=15)
        
        # Ajustar expansión de la columna 0 (opcional, para que ocupe todo el espacio)
        self.ventana.columnconfigure(0, weight=1)

        self.ventana.mainloop()

    def mostrar_datos(self):
        # El método get() funciona directamente en Combobox y StringVar
        nombre_ingresado = self.nombre_var.get()
        pais_seleccionado = self.pais_var.get()
        
        # Actualizar el título con la información recuperada
        self.ventana.title(f"Nombre: {nombre_ingresado} | País: {pais_seleccionado}")

# Instanciación y ejecución
aplicacion1 = Aplicacion()