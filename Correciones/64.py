import tkinter as tk
from tkinter import ttk 

class Aplicacion:
    def __init__(self):
        # 1. Configuración de la Ventana
        self.ventana = tk.Tk()
        self.ventana.title("Ejercicio 240 - Combobox")

        # 2. Entrada de Nombre
        self.label_nombre = ttk.Label(self.ventana, text="Ingrese nombre:")
        self.label_nombre.grid(column=0, row=0, padx=10, pady=5, sticky="w")
        
        self.nombre_var = tk.StringVar()
        self.entry_nombre = ttk.Entry(self.ventana, width=40, textvariable=self.nombre_var)
        self.entry_nombre.grid(column=0, row=1, padx=10, pady=5, sticky="ew")

        # 3. Combobox (Lista Desplegable)
        self.label_pais = ttk.Label(self.ventana, text="Seleccione país:")
        self.label_pais.grid(column=0, row=2, padx=10, pady=5, sticky="w")
        
        self.pais_var = tk.StringVar()
        paises = ("Argentina", "Chile", "Bolivia", "Paraguay", "Brasil", "Uruguay")
        
        self.combobox_pais = ttk.Combobox(self.ventana, 
        width=37, # Ajuste de ancho
        textvariable=self.pais_var, 
        values=paises,
        state='readonly')
        self.combobox_pais.current(0) # Selecciona 'Argentina' por defecto
        self.combobox_pais.grid(column=0, row=3, padx=10, pady=5, sticky="ew")

        # 4. Botón de Acción (Usando ttk.Button para estilo)
        self.boton_recuperar = ttk.Button(self.ventana, text="Recuperar Datos", command=self.mostrar_datos)
        self.boton_recuperar.grid(column=0, row=4, padx=10, pady=15)
        
        self.ventana.columnconfigure(0, weight=1)

        self.ventana.mainloop()

    def mostrar_datos(self):
        # El método get() recupera el valor de la variable o del Combobox
        nombre_ingresado = self.nombre_var.get()
        pais_seleccionado = self.combobox_pais.get()
        
        # Actualizar el título con la información recuperada
        self.ventana.title(f"Nombre: {nombre_ingresado} | País: {pais_seleccionado}")

# Instanciación y ejecución
aplicacion1 = Aplicacion()