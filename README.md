# 📚 Biblioteca Distribuida — Sistemas Distribuidos

Este proyecto implementa un sistema maestro-esclavo de búsqueda distribuida de documentos digitales, con logs centralizados mediante RMI. Los nodos esclavos almacenan datos locales (por tipo de documento) y reportan operaciones al servidor de logs. El sistema está desarrollado en Python y utiliza Flask, Pyro5 y MySQL.

---

## 📦 Requisitos

- Python 3.8+
- MySQL Server escuchando en el puerto 3306
- MySQL Workbench (opcional)
- Usuario MySQL configurado 
- Paquetes Python:
  - flask
  - Pyro5
  - mysql-connector-python
  - python-dotenv

### Instalación de dependencias

```bash
pip install flask Pyro5 mysql-connector-python python-dotenv
```

---

## 📁 Estructura del proyecto

```
Biblioteca-Distribuida/
│
├── Maestro/
│   └── maestro.py
│
├── Esclavos/
│   ├── esclavo_articulos.py
│   ├── esclavo_tesis.py
│   ├── esclavo_libros.py
│   └── esclavo_videos.py
│
├── Servidor/
│   └── servidor_logs.py
│
├── .env 
└── README.md
```

---

## 🧾 Información del archivo .env

```env
DB_HOST=localhost
DB_USER=su_usuario
DB_PASSWORD=su_contraseña
DB1=bd_tesis
DB2=bd_libros
DB3=bd_videos
DB4=bd_articulos
```

---

## 🚀 Ejecución

Asegúrate de tener el servidor MySQL corriendo en el puerto 3308.

### Terminal 1 — Iniciar NameServer de Pyro5

```bash
pyro5-ns
```
(Ejecutar desde cualquier directorio)

### Terminal 2 — Iniciar el servidor de logs

```bash
cd Servidor
python3 servidor_logs.py
```

### Terminal 3 — Iniciar el Maestro

```bash
cd Maestro
python3 maestro.py
```

### Terminales 4 a 7 — Iniciar los esclavos

```bash
cd Esclavos
python3 esclavo_tesis.py     # Terminal 4

cd Esclavos
python3 esclavo_libros.py    # Terminal 5

cd Esclavos
python3 esclavo_videos.py    # Terminal 6

cd Esclavos
python3 esclavo_articulos.py # Terminal 7
```

---

## 🔎 Ejemplos de consultas disponibles

Buscar por título (broadcast a todos los esclavos):

```
http://localhost:8000/query?titulo=redes+neuronales&edad=20
```

Buscar por tipo de documento (dirigido solo a los esclavos correspondientes):

```
http://localhost:8000/query?tipo_doc=articulo+libro&edad=25
```
