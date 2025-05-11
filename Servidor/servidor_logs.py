# servidor_logs.py

import Pyro5.api
import threading
from datetime import datetime

@Pyro5.api.expose
class LogServer:
    def __init__(self):
        self.logs = []
        self.lock = threading.Lock()

    def recibir_log(self, log):
        """Recibe un log desde un cliente (esclavo o maestro)"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_con_fecha = f"[{timestamp}] {log}"

        with self.lock:
            self.logs.append(log_con_fecha)
            print(f"\n📥 Log recibido:\n{log_con_fecha}\n")
            # Guardar el log con timestamp en el archivo
            with open("logs.txt", "a", encoding="utf-8") as f:
                f.write(log_con_fecha + "\n")
        return "✅ Log recibido exitosamente."

    def obtener_logs(self):
        """Permite consultar todos los logs acumulados"""
        return self.logs

def main():
    # Conectarse al NameServer
    ns = Pyro5.api.locate_ns()
    # Crear el daemon de Pyro
    daemon = Pyro5.api.Daemon()
    # Crear la instancia del servidor de logs
    log_server = LogServer()
    # Registrar el objeto LogServer en el daemon (obtener su URI)
    uri = daemon.register(log_server)
    # Registrar el URI en el NameServer con el nombre 'logserver'
    ns.register("logserver", uri)

    print("🚀 Servidor de Logs RMI corriendo.")
    print(f"🛰️ URI del logserver: {uri}")
    print("📡 Esperando logs desde los clientes...")

    # Loop de espera de peticiones
    daemon.requestLoop()

if __name__ == "__main__":
    main()
