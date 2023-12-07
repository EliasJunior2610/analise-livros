<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comentários em Java</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 1em;
        }

        h1 {
            margin-bottom: 0.5em;
        }

        label {
            display: block;
            margin-top: 1em;
        }

        input {
            width: 100%;
            padding: 0.5em;
            margin-top: 0.5em;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 0.5em 1em;
            margin-top: 1em;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .comment {
            border: 1px solid #ccc;
            margin-top: 1em;
            padding: 1em;
            text-align: left;
        }

        .comment p {
            margin: 0;
        }
    </style>
    <script type="text/javascript">
        function escreverComentario() {
            var titulo = document.getElementById("campoTitulo").value;
            var nomeUsuario = document.getElementById("campoNomeUsuario").value;
            var comentario = document.getElementById("campoComentario").value;

            var comentarioDiv = document.createElement("div");
            comentarioDiv.classList.add("comment");

            var comentarioHTML = "<p><strong>" + nomeUsuario + " - " + titulo + "</strong></p>";
            comentarioHTML += "<p>" + comentario + "</p>";

            comentarioDiv.innerHTML = comentarioHTML;

            // Adiciona o comentário à página
            document.body.appendChild(comentarioDiv);

            // Limpa os campos
            document.getElementById("campoTitulo").value = "";
            document.getElementById("campoNomeUsuario").value = "";
            document.getElementById("campoComentario").value = "";
        }
    </script>
</head>
<body>
    <header>
        <h1>Página de Comentários em Java</h1>
    </header>

    <label for="campoTitulo">Título:</label>
    <input type="text" id="campoTitulo" />

    <label for="campoNomeUsuario">Nome de Usuário:</label>
    <input type="text" id="campoNomeUsuario" />

    <label for="campoComentario">Comentário:</label>
    <input type="text" id="campoComentario" />

    <button onclick="escreverComentario()">Enviar Comentário</button>
</body>
</html>