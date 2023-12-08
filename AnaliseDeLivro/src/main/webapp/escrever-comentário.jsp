<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Escrever Comentário</title>
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

        label {
            display: block;
            margin-top: 1em;
        }

        input, textarea {
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
    </style>
</head>
<body>
    <header>
        <h1>Palavras Encantadas</h1>
    </header>

    <form action="ComentarioServlet" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        
        <label for="campoTitulo">Título:</label>
        <input type="text" id="campoTitulo" name="campoTitulo" />

        <label for="campoNomeUsuario">Nome de Usuário:</label>
        <input type="text" id="campoNomeUsuario" name="campoNomeUsuario" />

        <label for="campoComentario">Comentário:</label>
        <textarea id="campoComentario" name="campoComentario" rows="4"></textarea>
        
        <br>
        <button type="submit">Enviar Comentário</button>
    </form>

</body>
</html>
