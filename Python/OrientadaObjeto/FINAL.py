import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector # Usas el conector de MySQL

# ====================================================================
# PARTE 1: Clase DAO (Data Access Object) para MySQL
# ====================================================================

class ArticuloDAO:
    """Clase para manejar las operaciones CRUD con la base de datos MySQL."""
    
    def __init__(self):
        # Configuración de la conexión a la base de datos
        self.config = {
            'user': 'root',       # Cambia esto por tu usuario de MySQL
            'password': '', # CONTRASEÑA VACÍA XQ MI MYSQL NO TIENE
            'host': '127.0.0.1',  # Cambia si tu base de datos está en otro servidor
            'database': 'pfinal_poo'
        }
        self.conn = None
        self.cursor = None
        self._conectar()

    def _conectar(self):
        """Establece la conexión a la base de datos."""
        try:
            self.conn = mysql.connector.connect(**self.config)
            self.cursor = self.conn.cursor()
        except mysql.connector.Error as err:
            messagebox.showerror("Error de Conexión", f"No se pudo conectar a MySQL: {err}")
            # Si la conexión falla, las operaciones CRUD no funcionarán.
            self.conn = None

    def _ejecutar_consulta(self, query, params=None):
        """Ejecuta una consulta y maneja los errores de conexión/ejecución."""
        if not self.conn:
            self._conectar() # Intenta reconectar
            if not self.conn:
                return None, False # Fallo de conexión
        
        try:
            self.cursor.execute(query, params or ())
            return True, None
        except mysql.connector.Error as err:
            self.conn.rollback()
            return False, err

    def crear_articulo(self, descripcion, precio):
        """Carga de artículos."""
        query = "INSERT INTO articulos (descripcion, precio) VALUES (%s, %s)"
        success, error = self._ejecutar_consulta(query, (descripcion, precio))
        if success:
            self.conn.commit()
            return True, "Artículo cargado exitosamente."
        return False, f"Error al cargar el artículo: {error}"

    def consultar_por_codigo(self, codigo):
        """Consulta por código."""
        query = "SELECT descripcion, precio FROM articulos WHERE codigo = %s"
        success, error = self._ejecutar_consulta(query, (codigo,))
        if success is True:
            # Aquí, self.cursor contiene el resultado de la consulta
            articulo = self.cursor.fetchone() 
            return articulo
        return None

    def listar_completo(self):
        """Listado completo."""
        query = "SELECT codigo, descripcion, precio FROM articulos"
        success, error = self._ejecutar_consulta(query)
        if success is True:
            # Aquí, self.cursor contiene todos los resultados
            return self.cursor.fetchall() 
        return []

    def __del__(self):
        """Cierra la conexión al destruir el objeto."""
        if self.conn and self.conn.is_connected():
            self.cursor.close()
            self.conn.close()

# ====================================================================
# PARTE 2: Clase de Interfaz Gráfica (Tkinter)
# ====================================================================

class MantenimientoApp:
    def __init__(self, master):
        self.master = master
        master.title("Mantenimiento de Artículos (POO Final)")
        
        # Inicializar el DAO
        self.dao = ArticuloDAO()

        # Crear el contenedor de pestañas (Notebook)
        self.notebook = ttk.Notebook(master)
        self.notebook.pack(pady=10, padx=10, expand=True, fill="both")

        # Configurar y añadir las pestañas
        self._setup_carga_tab()
        self._setup_consulta_tab()
        self._setup_listado_tab()

    def _setup_carga_tab(self):
        """Crea la pestaña de Carga de Artículos."""
        frame = ttk.Frame(self.notebook, padding="10")
        self.notebook.add(frame, text=" Carga de artículos ")
        
        # Widgets para Carga
        ttk.Label(frame, text="Descripción:").grid(row=1, column=0, sticky="w", pady=5)
        self.desc_entry = ttk.Entry(frame, width=30)
        self.desc_entry.grid(row=1, column=1, sticky="ew", padx=10)

        ttk.Label(frame, text="Precio:").grid(row=2, column=0, sticky="w", pady=5)
        self.precio_entry = ttk.Entry(frame, width=30)
        self.precio_entry.grid(row=2, column=1, sticky="ew", padx=10)

        ttk.Button(frame, text="Confirmar", command=self._confirmar_carga).grid(
            row=3, column=0, columnspan=2, pady=20, ipadx=10
        )
        frame.columnconfigure(1, weight=1)

    def _setup_consulta_tab(self):
        """Crea la pestaña de Consulta por Código."""
        frame = ttk.Frame(self.notebook, padding="10")
        self.notebook.add(frame, text=" Consulta por código ")

        # Widgets para Consulta
        ttk.Label(frame, text="Código:").grid(row=1, column=0, sticky="w", pady=5)
        self.codigo_consulta_entry = ttk.Entry(frame, width=20)
        self.codigo_consulta_entry.grid(row=1, column=1, sticky="ew", padx=10)

        ttk.Button(frame, text="Consultar", command=self._consultar_articulo).grid(
            row=2, column=0, columnspan=2, pady=10, ipadx=10
        )

        ttk.Label(frame, text="Descripción:").grid(row=3, column=0, sticky="w", pady=5)
        self.consulta_desc_label = ttk.Label(frame, text="")
        self.consulta_desc_label.grid(row=3, column=1, sticky="w", padx=10)

        ttk.Label(frame, text="Precio:").grid(row=4, column=0, sticky="w", pady=5)
        self.consulta_precio_label = ttk.Label(frame, text="")
        self.consulta_precio_label.grid(row=4, column=1, sticky="w", padx=10)
        
        frame.columnconfigure(1, weight=1)


    def _setup_listado_tab(self):
        """Crea la pestaña de Listado Completo."""
        frame = ttk.Frame(self.notebook, padding="10")
        self.notebook.add(frame, text=" Listado completo ")
        
        # Botón para cargar el listado
        ttk.Button(frame, text="Listado completo", command=self._cargar_listado).pack(pady=10)
        
        # Treeview (Matriz/Tabla) para mostrar los datos
        self.tree = ttk.Treeview(frame, columns=("Codigo", "Descripcion", "Precio"), show="headings")
        self.tree.heading("Codigo", text="Código")
        self.tree.heading("Descripcion", text="Descripción")
        self.tree.heading("Precio", text="Precio")
        
        # Ajuste de columnas
        self.tree.column("Codigo", width=70, anchor=tk.CENTER)
        self.tree.column("Descripcion", width=250)
        self.tree.column("Precio", width=100, anchor=tk.E)

        # Añadir Scrollbar
        vsb = ttk.Scrollbar(frame, orient="vertical", command=self.tree.yview)
        self.tree.configure(yscrollcommand=vsb.set)

        vsb.pack(side="right", fill="y")
        self.tree.pack(pady=5, expand=True, fill="both")

    # ====================================================================
    # PARTE 3: Métodos de la Interfaz que llaman al DAO
    # ====================================================================

    def _confirmar_carga(self):
        """Maneja la lógica del botón 'Confirmar' en la carga de artículos."""
        descripcion = self.desc_entry.get().strip()
        precio_str = self.precio_entry.get().strip()

        if not descripcion or not precio_str:
            messagebox.showerror("Error", "Todos los campos deben ser completados.")
            return

        try:
            precio = float(precio_str)
        except ValueError:
            messagebox.showerror("Error", "El precio debe ser un número válido.")
            return

        # Llamada al DAO
        success, message = self.dao.crear_articulo(descripcion, precio)
        
        if success:
            messagebox.showinfo("Éxito", message)
            self.desc_entry.delete(0, tk.END)
            self.precio_entry.delete(0, tk.END)
        else:
            messagebox.showerror("Error de DB", message)


    def _consultar_articulo(self):
        """Maneja la lógica del botón 'Consultar'."""
        codigo_str = self.codigo_consulta_entry.get().strip()

        try:
            codigo = int(codigo_str)
        except ValueError:
            messagebox.showerror("Error", "El código debe ser un número entero.")
            return

        # Llamada al DAO
        articulo = self.dao.consultar_por_codigo(codigo)
        
        if articulo:
            # articulo es un tuple: (descripcion, precio)
            descripcion, precio = articulo
            self.consulta_desc_label.config(text=descripcion)
            self.consulta_precio_label.config(text=f"${precio:.2f}")
            messagebox.showinfo("Consulta Exitosa", f"Artículo {codigo} encontrado.")
        else:
            self.consulta_desc_label.config(text="---")
            self.consulta_precio_label.config(text="---")
            messagebox.showwarning("No Encontrado", f"No existe un artículo con código {codigo}.")


    def _cargar_listado(self):
        """Maneja la lógica del botón 'Listado completo'."""
        
        # Limpiar Treeview
        for i in self.tree.get_children():
            self.tree.delete(i)
        
        # Llamada al DAO
        articulos = self.dao.listar_completo()
        
        if articulos:
            # Bucle para insertar los datos
            for art in articulos:
                # art es un tuple: (codigo, descripcion, precio)
                self.tree.insert("", tk.END, values=art)
            messagebox.showinfo("Listado Completo", f"Se cargaron {len(articulos)} artículos.")
        else:
            messagebox.showwarning("Listado Vacío", "No hay artículos registrados en la base de datos.")


# ====================================================================
# EJECUCIÓN PRINCIPAL
# ====================================================================

if __name__ == "__main__":
    root = tk.Tk()
    app = MantenimientoApp(root)
    root.mainloop()