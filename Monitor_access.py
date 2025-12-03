import datetime as dt
import tkinter as tk
from tkinter import ttk, scrolledtext, messagebox

# ====================================================================
# CLASE DE LÓGICA: MonitoreoAccesos
# ====================================================================

class MonitoreoAccesos:
    """
    Simula un sistema que registra intentos de acceso y detecta amenazas simples.
    """
    def __init__(self):
        # Vectores (Listas simples)
        self.usuarios = ["admin", "developer", "guest", "soporte"]
        self.servidores = ["DB_PRODUCCION", "WEB_FRONTEND", "BACKUP_SERVER"]
        self.tipos_acceso = ["Éxito", "Fallo"]

        # Matriz (Lista de listas): [usuario, servidor, IP, tipo, hora]
        self.intentos = [] 
        
        # Almacenamiento temporal para detección de amenazas (diccionario)
        # Formato: {usuario: [fallos_consecutivos, ultima_ip]}
        self.alertas_db = {u: [0, ""] for u in self.usuarios}

    def RegistrarIntento(self, usuario, servidor, ip, tipo):
        """
        Función 1: Registra un intento de acceso en la matriz principal.
        """
        # Formato de tiempo y fecha (yyyymmddTHHMM)
        timestamp = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        # Agregar el registro a la matriz
        self.intentos.append([usuario, servidor, ip, tipo, timestamp])
        
        # Llamar a la función de alerta
        alerta_msg = self.GenerarAlertas(usuario, ip, tipo)
        
        log_msg = f"[{timestamp}] Intento: {usuario} -> {servidor} ({tipo}) desde IP: {ip}"
        
        return log_msg, alerta_msg

    def GenerarAlertas(self, usuario, ip_actual, tipo_acceso):
        """
        Función 3: Detecta posibles amenazas.
        Regla de Alerta: 3 intentos de fallo consecutivos desde la misma IP.
        """
        alerta_msg = ""
        fallos_consecutivos, ultima_ip = self.alertas_db[usuario]

        if tipo_acceso == "Fallo":
            # Condicional y Bucle: Incrementar el contador de fallos
            if ultima_ip == ip_actual:
                self.alertas_db[usuario][0] += 1
            else:
                # Si cambia la IP, reiniciar y contar este fallo
                self.alertas_db[usuario] = [1, ip_actual]
            
            # Condicional: Verificar la regla de amenaza
            if self.alertas_db[usuario][0] >= 3:
                alerta_msg = (f"*** ALERTA DE AMENAZA ***\n"
                              f"Usuario: {usuario} ha tenido {self.alertas_db[usuario][0]} fallos CONSECUTIVOS "
                              f"desde la IP: {ip_actual}")
        else:
            # Si el acceso es Exitoso, reiniciamos el contador de fallos
            self.alertas_db[usuario] = [0, ""]

        # Devolver el mensaje de alerta (vacío si no hay alerta)
        return alerta_msg

    def MostrarReporte(self):
        """
        Función 2: Genera un reporte resumido de la matriz de intentos.
        """
        # Bucle: Recorrer todos los registros
        reporte = "--- Reporte de Intentos de Acceso ---\n"
        fallos = 0
        exitos = 0

        for intento in self.intentos:
            reporte += f"[{intento[4]}] U: {intento[0]}, S: {intento[1]}, IP: {intento[2]}, T: {intento[3]}\n"
            if intento[3] == "Fallo":
                fallos += 1
            else:
                exitos += 1
        
        reporte += "\n--- Resumen ---\n"
        reporte += f"Total de Intentos: {len(self.intentos)}\n"
        reporte += f"Intentos Exitosos: {exitos}\n"
        reporte += f"Intentos Fallidos: {fallos}\n"
        
        return reporte

# ====================================================================
# CLASE DE INTERFAZ GRÁFICA (GUI): AppMonitoreo
# ====================================================================

class AppMonitoreo:
    def __init__(self, master):
        self.master = master
        master.title("Sistema de Monitoreo de Accesos")
        master.geometry("800x600")

        self.sistema = MonitoreoAccesos()

        # Configuración de estilos
        style = ttk.Style()
        style.configure("TLabel", font=("Arial", 10))
        style.configure("TButton", font=("Arial", 10, "bold"))
        style.configure("Header.TLabel", font=("Arial", 12, "bold"))

        # Crear Pestañas (Notebook)
        notebook = ttk.Notebook(master)
        notebook.pack(pady=10, padx=10, expand=True, fill="both")

        # Pestaña 1: Registro de Intento
        frame_registro = ttk.Frame(notebook, padding="10")
        notebook.add(frame_registro, text=" Registrar Intento ")
        self._setup_registro_tab(frame_registro)

        # Pestaña 2: Reporte
        frame_reporte = ttk.Frame(notebook, padding="10")
        notebook.add(frame_reporte, text=" Mostrar Reporte ")
        self._setup_reporte_tab(frame_reporte)

        # Pestaña 3: Alertas
        frame_alertas = ttk.Frame(notebook, padding="10")
        notebook.add(frame_alertas, text=" Alertas ")
        self._setup_alertas_tab(frame_alertas)
        
        # Área de Logs Global
        self.log_area = scrolledtext.ScrolledText(master, height=10, state='disabled', wrap=tk.WORD, font=("Consolas", 9))
        self.log_area.pack(pady=(0, 10), padx=10, fill="x")
        self._update_log("Sistema iniciado. Listo para registrar intentos.")


    def _setup_registro_tab(self, frame):
        """Configura la interfaz para registrar un nuevo intento."""
        
        # Título
        ttk.Label(frame, text="REGISTRAR NUEVO ACCESO", style="Header.TLabel").grid(row=0, column=0, columnspan=2, pady=10)
        
        # 1. Usuario
        ttk.Label(frame, text="Usuario:").grid(row=1, column=0, sticky="w", pady=5)
        self.usuario_var = tk.StringVar(frame)
        self.usuario_var.set(self.sistema.usuarios[0]) # Valor por defecto
        self.usuario_menu = ttk.Combobox(frame, textvariable=self.usuario_var, values=self.sistema.usuarios, state="readonly")
        self.usuario_menu.grid(row=1, column=1, sticky="ew", padx=10)

        # 2. Servidor
        ttk.Label(frame, text="Servidor:").grid(row=2, column=0, sticky="w", pady=5)
        self.servidor_var = tk.StringVar(frame)
        self.servidor_var.set(self.sistema.servidores[0])
        self.servidor_menu = ttk.Combobox(frame, textvariable=self.servidor_var, values=self.sistema.servidores, state="readonly")
        self.servidor_menu.grid(row=2, column=1, sticky="ew", padx=10)

        # 3. IP
        ttk.Label(frame, text="IP Origen:").grid(row=3, column=0, sticky="w", pady=5)
        self.ip_entry = ttk.Entry(frame)
        self.ip_entry.insert(0, "192.168.1.1") # Valor inicial
        self.ip_entry.grid(row=3, column=1, sticky="ew", padx=10)

        # 4. Tipo de Acceso
        ttk.Label(frame, text="Tipo:").grid(row=4, column=0, sticky="w", pady=5)
        self.tipo_var = tk.StringVar(frame)
        self.tipo_var.set(self.sistema.tipos_acceso[0])
        self.tipo_menu = ttk.Combobox(frame, textvariable=self.tipo_var, values=self.sistema.tipos_acceso, state="readonly")
        self.tipo_menu.grid(row=4, column=1, sticky="ew", padx=10)

        # Botón de Registro
        ttk.Button(frame, text="Registrar Intento", command=self._registrar_intento_gui).grid(
            row=5, column=0, columnspan=2, pady=20, ipadx=10
        )
        
        # Asegurar que los widgets se expandan
        frame.columnconfigure(1, weight=1)
        frame.rowconfigure(5, weight=1)


    def _setup_reporte_tab(self, frame):
        """Configura la interfaz para mostrar el reporte."""
        ttk.Label(frame, text="REPORTE DE ACCESOS", style="Header.TLabel").pack(pady=10)
        
        self.reporte_area = scrolledtext.ScrolledText(frame, state='disabled', wrap=tk.WORD, font=("Consolas", 10))
        self.reporte_area.pack(pady=10, expand=True, fill="both")

        ttk.Button(frame, text="Generar y Mostrar Reporte", command=self._mostrar_reporte_gui).pack(pady=5)

    
    def _setup_alertas_tab(self, frame):
        """Configura la interfaz para mostrar las alertas generadas."""
        ttk.Label(frame, text="ALERTAS DEL SISTEMA", style="Header.TLabel").pack(pady=10)
        
        self.alertas_area = scrolledtext.ScrolledText(frame, state='disabled', wrap=tk.WORD, bg="lightyellow", font=("Consolas", 10, "bold"))
        self.alertas_area.pack(pady=10, expand=True, fill="both")
        
        self.alertas_generadas = [] # Lista para almacenar las alertas.


    def _registrar_intento_gui(self):
        """Recupera los datos de la GUI y llama a la función principal."""
        usuario = self.usuario_var.get()
        servidor = self.servidor_var.get()
        ip = self.ip_entry.get()
        tipo = self.tipo_var.get()

        if not ip:
            messagebox.showerror("Error de Entrada", "Debe ingresar una IP Origen.")
            return

        # Llama a la lógica del sistema
        log_msg, alerta_msg = self.sistema.RegistrarIntento(usuario, servidor, ip, tipo)
        
        # Actualizar el log general
        self._update_log(log_msg)

        # Mostrar Alerta si se generó
        if alerta_msg:
            messagebox.showwarning("¡AMENAZA DETECTADA!", alerta_msg)
            self.alertas_generadas.append(alerta_msg)
            self._update_alertas() # Actualizar la pestaña de alertas

    
    def _mostrar_reporte_gui(self):
        """Llama a la función de reporte y lo muestra en el área de texto."""
        reporte_texto = self.sistema.MostrarReporte()
        
        self.reporte_area.config(state='normal')
        self.reporte_area.delete(1.0, tk.END)
        self.reporte_area.insert(tk.END, reporte_texto)
        self.reporte_area.config(state='disabled')
        self._update_log("Reporte generado y visualizado.")

    
    def _update_log(self, message):
        """Inserta un mensaje en el área de logs global."""
        self.log_area.config(state='normal')
        self.log_area.insert(tk.END, f"\n{dt.datetime.now().strftime('%H:%M:%S')} - {message}")
        self.log_area.see(tk.END) # Scroll hasta el final
        self.log_area.config(state='disabled')

    def _update_alertas(self):
        """Muestra la lista de alertas generadas en la pestaña de Alertas."""
        self.alertas_area.config(state='normal')
        self.alertas_area.delete(1.0, tk.END)
        
        if not self.alertas_generadas:
            self.alertas_area.insert(tk.END, "No se han generado alertas de amenaza.")
        else:
            for i, alerta in enumerate(self.alertas_generadas):
                self.alertas_area.insert(tk.END, f"================ ALERTA #{i+1} ================\n")
                self.alertas_area.insert(tk.END, alerta + "\n")
            
        self.alertas_area.config(state='disabled')


if __name__ == "__main__":
    root = tk.Tk()
    app = AppMonitoreo(root)
    root.mainloop()