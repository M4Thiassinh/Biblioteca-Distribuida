from flask import Flask, request, jsonify
import mysql.connector
from dotenv import load_dotenv
import os
load_dotenv()

app = Flask(__name__)

PREFERENCIAS = {
    "10-15": "ciencia ficción",
    "16-25": "tecnología",
    "26+": "ciencia"
}

def calcular_score(doc, query, edad):
    score = 0
    for palabra in query.lower().split():
        if palabra in doc['titulo'].lower():
            score += 10
    if 10 <= edad <= 15 and doc['genero'] == PREFERENCIAS["10-15"]:
        score += 5
    elif 16 <= edad <= 25 and doc['genero'] == PREFERENCIAS["16-25"]:
        score += 5
    elif edad >= 26 and doc['genero'] == PREFERENCIAS["26+"]:
        score += 5
        
    return score

def obtener_documentos():
    conexion = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB1")
    )
    cursor = conexion.cursor(dictionary=True)
    query = "SELECT * FROM documentos WHERE tipo = 'tesis'"
    cursor.execute(query)
    resultados = cursor.fetchall()
    cursor.close()
    conexion.close()
    return resultados

@app.route('/buscar_titulo')
def buscar_titulo():
    query = request.args.get('titulo', '')
    edad = int(request.args.get('edad', 18))
    resultados = []
    documentos = obtener_documentos()
    for doc in documentos:
        score = calcular_score(doc, query, edad)
        if score > 0:
            doc_result = doc.copy()
            doc_result['score'] = score
            resultados.append(doc_result)
    return jsonify(resultados)

@app.route('/buscar_tipo')
def buscar_tipo():
    tipo = request.args.get('tipo')
    edad = int(request.args.get('edad', 18))
    resultados = []
    documentos = obtener_documentos()
    for doc in documentos:
        if doc['tipo'] == tipo:
            score = calcular_score(doc, doc['titulo'], edad)
            doc_result = doc.copy()
            doc_result['score'] = score
            resultados.append(doc_result)
    return jsonify(resultados)

if __name__ == '__main__':
    app.run(port=8001)
