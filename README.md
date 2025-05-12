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
├── BasesDeDatos/
│   ├── bd_tesis.sql
│   ├── bd_libros.sql
│   ├── bd_videos.sql
│   └── bd_articulos.sql
│
├── Maestro/
│   └── maestro.py
│
├── Esclavos/
│   ├── esclavo_articulos.py
│   ├── esclavo_tesis.py
│   ├── esclavo_libros.py
│   ├── esclavo_videos.py
│   └── utils.py
│
├── Servidor/
│   └── servidor_logs.py
│
├── .env 
├── docker-compose.yml
└── README.md

```

---

## 🧾 Información del archivo .env

```env
DB_HOST=127.0.0.1

DB_USER=root
DB_PASSWORD=31032003 

DB1=bd_tesis
DB2=bd_libros
DB3=bd_videos
DB4=bd_articulos

```

---

## 🚀 Ejecución

Primero ejecutar 
```bash
docker compose up -d  
``` 
para levantar los contenedores de las bases de datos.

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

## 🔎 Ejemplo de Log

**Fecha y Hora de Recepción del Log**:  
`[2025-05-11 21:57:27]`

### Detalles del Log:
- **timestamp_ini**: 1747015042.7488444
- **timestamp_fin**: 1747015042.8749065
- **maquina**: LAPTOP-M4TY
- **tipo_maquina**: esclavo_tesis
- **tipo_busqueda**: buscar_titulo
- **query**: desarrollo
- **score_promedio**: 6.67
- **edad**: 25

### Explicación de los Campos:
- **timestamp_ini**: Tiempo de inicio del proceso.
- **timestamp_fin**: Tiempo de finalización del proceso.
- **maquina**: Nombre del host donde se ejecuta el proceso.
- **tipo_maquina**: Tipo de nodo (esclavo) que ejecutó el proceso (en este caso, `esclavo_tesis`).
- **tipo_busqueda**: Tipo de búsqueda realizada, que puede ser `buscar_titulo` o `buscar_tipo`.
- **query**: La consulta que se realizó (en este caso, "desarrollo").
- **score_promedio**: Promedio de las puntuaciones obtenidas durante la búsqueda.
- **edad**: Edad proporcionada en la consulta (si no se proporciona, se asume 0).

 

