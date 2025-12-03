import tkinter as tk

class Aplicacion:
    def __init__(self):
        # 1. Configuración de la Ventana Principal
        self.ventana = tk.Tk()
        self.ventana.title("Aplicación de Selección")

        # 2. Etiqueta y Entrada para el Nombre
        self.label_nombre = tk.Label(self.ventana, text="Ingrese nombre:")
        self.label_nombre.grid(column=0, row=0, padx=5, pady=5, sticky="w")
        
        self.nombre = tk.StringVar()
        self.entry_nombre = tk.Entry(self.ventana, width=40, textvariable=self.nombre)
        self.entry_nombre.grid(column=0, row=1, padx=5, pady=5, sticky="ew")

        # 3. Etiqueta y Listbox para el País
        self.label_pais = tk.Label(self.ventana, text="Seleccione país:")
        self.label_pais.grid(column=0, row=2, padx=5, pady=5, sticky="w")
        
        self.listbox_pais = tk.Listbox(self.ventana, height=6) # Limitar la altura
        self.listbox_pais.grid(column=0, row=3, padx=5, pady=5, sticky="ew")
        
        paises = ["Argentina", "Chile", "Bolivia", "Paraguay", "Brasil", "Uruguay"]
        for pais in paises:
            self.listbox_pais.insert(tk.END, pais)

        # 4. Botón de Acción
        self.boton_recuperar = tk.Button(self.ventana, text="Recuperar Datos", command=self.mostrar_datos)
        self.boton_recuperar.grid(column=0, row=4, padx=5, pady=10)
        
        # 5. Etiqueta de Resultados (Mejora: para mostrar la salida dentro de la ventana)
        self.label_resultado = tk.Label(self.ventana, text="Esperando datos...", bg="lightyellow", wraplength=350)
        self.label_resultado.grid(column=0, row=5, padx=5, pady=5, sticky="ew")

        self.ventana.mainloop()

    def mostrar_datos(self):
         # Validar que se haya seleccionado al menos un elemento
         if len(self.listbox_pais.curselection()) != 0:
            # curselection() devuelve una tupla de índices de selección
            indice_seleccionado = self.listbox_pais.curselection()[0]
            pais_seleccionado = self.listbox_pais.get(indice_seleccionado)
            nombre_ingresado = self.nombre.get()
            
            # Mostrar el resultado en la etiqueta de la ventana
            mensaje = f"Nombre: {nombre_ingresado} | País: {pais_seleccionado}"
            self.label_resultado.config(text=mensaje)
            
            # Opcional: También puedes dejar el cambio de título como lo tenías:
            # self.ventana.title(mensaje) 
         else:
            self.label_resultado.config(text="¡Error! Por favor, selecciona un país de la lista.")

# Instanciación y ejecución
aplicacion1 = Aplicacion()