import tkinter as tk
from tkinter import messagebox

# 1. Ventana Básica con Mensaje de Bienvenida (Label)
def interfaz_basica():
    """Crea una ventana simple con un mensaje de bienvenida."""
    # 1. Crear la ventana principal (root window)
    root = tk.Tk()
    root.title("Ventana Básica")
    root.geometry("400x150") # Establece el tamaño inicial

    # 2. Crear un Label con el mensaje
    mensaje_label = tk.Label(
        root, 
        text="¡Bienvenido a la Interfaz Gráfica con Tkinter!",
        font=("Arial", 14),
        fg="blue", # Color del texto
        pady=20 # Espacio vertical interno
    )
    # 3. Empaquetar el Label para que sea visible
    mensaje_label.pack(expand=True)

    # Iniciar el bucle principal de la aplicación
    root.mainloop()

# 2. Interfaz con Entry, Button y Label para mostrar texto
def interfaz_mostrar_texto():
    """Interfaz para tomar texto de un Entry y mostrarlo en un Label."""
    root = tk.Tk()
    root.title("Mostrar Texto")
    root.geometry("400x200")
    
    # Función que se ejecuta al presionar el botón
    def actualizar_label():
        # Obtener el texto del Entry
        texto = entrada_texto.get()
        # Actualizar el texto del Label
        resultado_label.config(text=f"Tu mensaje: {texto}", fg="green")
        # Opcional: Limpiar el Entry después de obtener el texto
        entrada_texto.delete(0, tk.END)

    # 1. Crear el Entry (campo de entrada de texto)
    entrada_texto = tk.Entry(root, width=40, font=("Arial", 12))
    entrada_texto.pack(pady=10)

    # 2. Crear el Botón
    boton_mostrar = tk.Button(
        root, 
        text="Mostrar Texto", 
        command=actualizar_label, # Asignar la función a ejecutar
        bg="lightblue",
        font=("Arial", 10)
    )
    boton_mostrar.pack(pady=5)

    # 3. Crear el Label para mostrar el resultado
    resultado_label = tk.Label(
        root, 
        text="Esperando entrada...", 
        font=("Arial", 12), 
        pady=10
    )
    resultado_label.pack()

    root.mainloop()

# 3. Calculadora Sencilla (Suma de dos números)
def interfaz_calculadora_suma():
    """Calculadora básica para sumar dos números."""
    root = tk.Tk()
    root.title("Calculadora de Suma")
    root.geometry("350x250")
    
    # Contenedor principal con padding
    main_frame = tk.Frame(root, padx=15, pady=15)
    main_frame.pack(expand=True, fill='both')

    def sumar():
        try:
            # Obtener los valores de los Entries
            num1 = float(entrada_num1.get())
            num2 = float(entrada_num2.get())
            
            # Realizar la suma
            resultado = num1 + num2
            
            # Mostrar el resultado
            resultado_label.config(text=f"Resultado: {resultado}", fg="green")
            
        except ValueError:
            # Manejar el caso en que la entrada no es un número válido
            resultado_label.config(text="Error: Ingresa números válidos.", fg="red")

    # Layout para el Número 1
    tk.Label(main_frame, text="Número 1:", font=("Arial", 10)).grid(row=0, column=0, sticky="w", pady=5)
    entrada_num1 = tk.Entry(main_frame, width=20, font=("Arial", 10))
    entrada_num1.grid(row=0, column=1, padx=10, pady=5)

    # Layout para el Número 2
    tk.Label(main_frame, text="Número 2:", font=("Arial", 10)).grid(row=1, column=0, sticky="w", pady=5)
    entrada_num2 = tk.Entry(main_frame, width=20, font=("Arial", 10))
    entrada_num2.grid(row=1, column=1, padx=10, pady=5)

    # Botón para Sumar
    boton_sumar = tk.Button(
        main_frame, 
        text="Sumar", 
        command=sumar,
        bg="#4CAF50", # Verde
        fg="white",
        font=("Arial", 10, "bold"),
        padx=10,
        pady=5
    )
    boton_sumar.grid(row=2, column=0, columnspan=2, pady=20)

    # Label para el Resultado
    resultado_label = tk.Label(
        main_frame, 
        text="Introduce los números y suma.", 
        font=("Arial", 12, "italic")
    )
    resultado_label.grid(row=3, column=0, columnspan=2)

    root.mainloop()

# 4. Ventana con Listbox para añadir elementos
def interfaz_listbox():
    """Interfaz con un Listbox y un botón para añadir elementos."""
    root = tk.Tk()
    root.title("Listbox Dinámico")
    root.geometry("400x300")
    
    # Contenedor principal
    main_frame = tk.Frame(root, padx=15, pady=15)
    main_frame.pack(expand=True, fill='both')

    def agregar_elemento():
        # Obtener el texto del Entry
        nuevo_elemento = entrada_elemento.get()
        if nuevo_elemento:
            # Añadir el elemento al Listbox
            listbox_elementos.insert(tk.END, nuevo_elemento)
            # Limpiar el Entry
            entrada_elemento.delete(0, tk.END)
        else:
            messagebox.showwarning("Advertencia", "Por favor, introduce un elemento.")

    # 1. Listbox
    tk.Label(main_frame, text="Lista de Elementos:", font=("Arial", 12, "bold")).pack(pady=5)
    
    listbox_elementos = tk.Listbox(main_frame, height=8, width=40, font=("Arial", 10))
    listbox_elementos.pack()

    # Insertar algunos elementos iniciales
    elementos_iniciales = ["Manzana", "Naranja", "Pera"]
    for item in elementos_iniciales:
        listbox_elementos.insert(tk.END, item)

    # 2. Área de Entrada y Botón
    tk.Label(main_frame, text="Nuevo Elemento:", font=("Arial", 10)).pack(pady=(15, 5))
    entrada_elemento = tk.Entry(main_frame, width=30, font=("Arial", 10))
    entrada_elemento.pack()
    
    boton_agregar = tk.Button(
        main_frame, 
        text="Añadir a la Lista", 
        command=agregar_elemento,
        bg="#007ACC", # Azul
        fg="white",
        font=("Arial", 10, "bold")
    )
    boton_agregar.pack(pady=10)

    root.mainloop()

# 5. Interfaz con Canvas para Dibujar
def interfaz_dibujo():
    """Diseña una interfaz con un Canvas donde el usuario pueda dibujar líneas."""
    root = tk.Tk()
    root.title("Canvas de Dibujo")
    root.geometry("600x450")
    
    # Variables para almacenar la última posición del ratón
    last_x, last_y = None, None

    def inicio_dibujo(event):
        """Prepara el canvas para empezar a dibujar."""
        nonlocal last_x, last_y
        # Guarda la posición inicial del clic del ratón
        last_x, last_y = event.x, event.y

    def dibujar(event):
        """Dibuja una línea siguiendo el movimiento del ratón."""
        nonlocal last_x, last_y
        if last_x and last_y:
            # Dibujar la línea desde la última posición a la posición actual
            canvas.create_line(
                last_x, last_y, event.x, event.y, 
                fill="black", # Color de la línea
                width=3, # Grosor de la línea
                capstyle=tk.ROUND, # Estilo de las terminaciones de la línea
                smooth=tk.TRUE # Suavizar la línea
            )
            # Actualizar la última posición a la posición actual para el siguiente segmento
            last_x, last_y = event.x, event.y

    def limpiar_canvas():
        """Borra todo el contenido del Canvas."""
        canvas.delete("all")

    # 1. Crear el Canvas
    canvas = tk.Canvas(
        root, 
        bg="white", 
        highlightthickness=1, # Grosor del borde
        highlightbackground="gray" # Color del borde
    )
    canvas.pack(padx=10, pady=10, expand=True, fill='both')

    # 2. Asignar los eventos del ratón al Canvas
    # <Button-1> se activa cuando se presiona el botón izquierdo del ratón
    canvas.bind("<Button-1>", inicio_dibujo)
    # <B1-Motion> se activa mientras el botón 1 está presionado y el ratón se mueve
    canvas.bind("<B1-Motion>", dibujar)
    # <ButtonRelease-1> se activa cuando se suelta el botón izquierdo
    canvas.bind("<ButtonRelease-1>", lambda event: inicio_dibujo(event))
    
    # 3. Botón para Limpiar el Canvas
    boton_limpiar = tk.Button(
        root,
        text="Limpiar Dibujo",
        command=limpiar_canvas,
        bg="#FF6347", # Rojo Tomate
        fg="white",
        font=("Arial", 10, "bold")
    )
    boton_limpiar.pack(pady=5)

    root.mainloop()


# --- EJECUCIÓN DEL PROGRAMA ---

if __name__ == "__main__":
    # DESCOMENTA la línea de la función que deseas ejecutar

    # 1. Ventana Básica
    # interfaz_basica() 

    # 2. Interfaz Mostrar Texto
    # interfaz_mostrar_texto()

    # 3. Calculadora Sencilla
    # interfaz_calculadora_suma() 

    # 4. Listbox Dinámico
    # interfaz_listbox() 

    # 5. Canvas de Dibujo
    interfaz_dibujo()