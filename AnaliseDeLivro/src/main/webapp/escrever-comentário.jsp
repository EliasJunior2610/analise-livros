<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
</head>
<body>
    <header>
        <h1>Página de Comentários em Java</h1>
    </header>

    <form action="ComentarioServlet" method="post">
        <label for="campoTitulo">Título:</label>
        <input type="text" id="campoTitulo" name="campoTitulo" />

        <label for="campoNomeUsuario">Nome de Usuário:</label>
        <input type="text" id="campoNomeUsuario" name="campoNomeUsuario" />

        <label for="campoComentario">Comentário:</label>
        <input type="text" id="campoComentario" name="campoComentario" />

        <button type="submit">Enviar Comentário</button>
    </form>
</body>
</html>
