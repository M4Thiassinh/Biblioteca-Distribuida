from flask import Flask, request, jsonify

app = Flask(__name__)

DOCUMENTOS = [
    {"titulo": "Programación en Python", "tipo": "libro", "genero": "tecnología", "contenido": "contenido..."},
    {"titulo": "La Guerra de los Mundos", "tipo": "libro", "genero": "ciencia ficción", "contenido": "contenido..."},
    {"titulo": "Física para Principiantes", "tipo": "libro", "genero": "ciencia", "contenido": "contenido..."}
]

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

@app.route('/buscar_titulo')
def buscar_titulo():
    query = request.args.get('titulo', '')
    edad = int(request.args.get('edad', 18))
    resultados = []
    for doc in DOCUMENTOS:
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
    for doc in DOCUMENTOS:
        if doc['tipo'] == tipo:
            score = calcular_score(doc, doc['titulo'], edad)
            doc_result = doc.copy()
            doc_result['score'] = score
            resultados.append(doc_result)
    return jsonify(resultados)

if __name__ == '__main__':
    app.run(port=8002)
