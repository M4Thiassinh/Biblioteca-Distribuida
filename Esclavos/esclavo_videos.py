from flask import Flask, request, jsonify
import mysql.connector
from dotenv import load_dotenv
import os
import Pyro5.api
import socket
import time
import re
from utils import calcular_score, enviar_log

LOG_SERVER_URI = "PYRONAME:logserver" 
ESCLAVO= 'esclavo_videos'
load_dotenv()

app = Flask(__name__)


def obtener_documentos():
    conexion = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB3")
    )
    cursor = conexion.cursor(dictionary=True)
    query = "SELECT * FROM documentos WHERE tipo = 'video'"
    cursor.execute(query)
    resultados = cursor.fetchall()
    cursor.close()
    conexion.close()
    return resultados

@app.route('/buscar_titulo')
def buscar_titulo():
    timestamp_ini = time.time()
    query = request.args.get('titulo', '')
    edad = int(request.args.get('edad', 0))
    resultados = []
    score_promedio = 0
    documentos = obtener_documentos()

    for doc in documentos:
        score = calcular_score(doc, query, edad)
        if score > 0:
            doc_result = doc.copy()
            doc_result['score'] = score
            resultados.append(doc_result)
            score_promedio += score

    score_promedio = score_promedio / len(resultados) if resultados else 0
    timestamp_fin = time.time()   
    enviar_log(timestamp_ini, timestamp_fin, "buscar_titulo", ESCLAVO,query, score_promedio, edad)
    return jsonify(resultados)

@app.route('/buscar_tipo')
def buscar_tipo():
    timestamp_ini = time.time()
    tipo_param = request.args.get('tipo', '')
    tipos = re.split(r'[+, ]+', tipo_param.strip().lower())  # Divide por +, , o espacios

    edad = int(request.args.get('edad', 0))
    resultados = []
    score_promedio = 0
    documentos = obtener_documentos()
    for doc in documentos:
        if doc['tipo'].lower() in tipos:
            score = calcular_score(doc,'', edad)
            doc_result = doc.copy()
            doc_result['score'] = score
            resultados.append(doc_result)
            score_promedio += score

    score_promedio = score_promedio / len(resultados) if resultados else 0
    timestamp_fin = time.time()
    enviar_log(timestamp_ini, timestamp_fin, "buscar_tipo",ESCLAVO, tipo_param, score_promedio, edad)
    return jsonify(resultados)

if __name__ == '__main__':
    app.run(port=8003)