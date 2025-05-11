from flask import Flask, request, jsonify
import requests
import json
import os
import re

app = Flask(__name__)

# Cargar configuración (rutas de esclavos y preferencias por tipo)
with open('config.json') as f:
    config = json.load(f)

@app.route('/query')
def query():
    titulo = request.args.get('titulo')
    tipo_doc = request.args.get('tipo_doc')
    edad = int(request.args.get('edad', 0))

    resultados = []

    if titulo:
        # Consulta por título: se envía a todos los esclavos
        for esclavo in config['esclavos']:
            try:
                r = requests.get(f"http://{esclavo}/buscar_titulo", params={'titulo': titulo, 'edad': edad})
                if r.ok:
                    resultados.extend(r.json())
            except Exception as e:
                print(f"❌ Error consultando esclavo {esclavo}: {e}")
    elif tipo_doc:
        # Permitir separadores como +, coma o espacio
        tipos = re.split(r"[+, ]", tipo_doc)
        tipos = [t.strip().lower() for t in tipos if t.strip()]

        for tipo in tipos:
            esclavo = config['tipos_doc'].get(tipo)
            if esclavo:
                try:
                    r = requests.get(f"http://{esclavo}/buscar_tipo", params={'tipo': tipo, 'edad': edad})
                    if r.ok:
                        resultados.extend(r.json())
                except Exception as e:
                    print(f"❌ Error consultando esclavo {esclavo}: {e}")
            else:
                print(f"⚠️ Tipo de documento no reconocido: {tipo}")

    # Ordenar resultados por puntaje descendente
    resultados.sort(key=lambda x: x['score'], reverse=True)

    return jsonify(resultados)

if __name__ == '__main__':
    app.run(port=8000)
