# utils.py
import unicodedata
import socket
import Pyro5.api

LOG_SERVER_URI = "PYRONAME:logserver"  # Asegúrate de que sea el correcto

PREFERENCIAS = {
    "10-15": "ciencia ficción",
    "16-25": "tecnología",
    "26+": "ciencia"
}
def normalizar(texto):
    return ''.join(
        c for c in unicodedata.normalize('NFD', texto)
        if unicodedata.category(c) != 'Mn'
    ).lower()

def enviar_log(timestamp_ini, timestamp_fin, tipo_busqueda,esclavo ,query, score, edad):
    log = {
        "timestamp_ini": timestamp_ini,
        "timestamp_fin": timestamp_fin,
        "maquina": socket.gethostname(),
        "tipo_maquina": esclavo,  # Puedes hacerlo variable si quieres
        "tipo_busqueda": tipo_busqueda,
        "query": query,
        "score_promedio": score,
        "edad": edad
    }
    try:
        with Pyro5.api.Proxy(LOG_SERVER_URI) as servidor:
            resultado = servidor.recibir_log(log)
            print(resultado)
    except Exception as e:
        print("Error enviando log al servidor RMI:", e)
def calcular_score(doc, query, edad):
    score = 0
    # Normalizamos y separamos las palabras del título
    palabras_titulo = [normalizar(p) for p in doc['titulo'].split()]
    
    # Comparamos cada palabra normalizada de la query
    for palabra in query.split():
        if normalizar(palabra) in palabras_titulo:
            score += 10
    
    # Preferencias por grupo de edad
    if 10 <= edad <= 15 and doc['genero'] == PREFERENCIAS["10-15"]:
        score += 5
    elif 16 <= edad <= 25 and doc['genero'] == PREFERENCIAS["16-25"]:
        score += 5
    elif edad >= 26 and doc['genero'] == PREFERENCIAS["26+"]:
        score += 5

    return score


 