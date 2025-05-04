from flask import Flask, request, jsonify
import requests
import json
import os

app = Flask(__name__)

# Cargar configuración (rutas de esclavos y preferencias por edad)
with open('config.json') as f:
    config = json.load(f)

@app.route('/query')
def query():
    titulo = request.args.get('titulo')
    tipo_doc = request.args.get('tipo_doc')
    edad = int(request.args.get('edad', 18))

    resultados = []

    if titulo:
        # Broadcast a todos los esclavos
        for esclavo in config['esclavos']:
            try:
                r = requests.get(f"http://{esclavo}/buscar_titulo", params={'titulo': titulo, 'edad': edad})
                if r.ok:
                    resultados.extend(r.json())
            except Exception as e:
                print(f"Error consultando esclavo {esclavo}: {e}")
    elif tipo_doc:
        tipos = tipo_doc.split('+')
        for tipo in tipos:
            esclavo = config['tipos_doc'].get(tipo)
            if esclavo:
                try:
                    r = requests.get(f"http://{esclavo}/buscar_tipo", params={'tipo': tipo, 'edad': edad})
                    if r.ok:
                        resultados.extend(r.json())
                except Exception as e:
                    print(f"Error consultando esclavo {esclavo}: {e}")

    # Ordenar por ranking descendente
    resultados.sort(key=lambda x: x['score'], reverse=True)

    return jsonify(resultados)

if __name__ == '__main__':
    app.run(port=8000)
