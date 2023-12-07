<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Usuário</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div id="container">
    <h1>Cadastro de Usuário</h1>
    <form id="form" action="RegisterServlet" method="post">
      <label for="email">E-mail:</label>
      <input type="email" id="email" name="email" required>

      <label for="username">Nome de Usuário:</label>
      <input type="text" id="username" name="username" required>

      <label for="password">Senha:</label>
      <input type="password" id="password" name="password" required>
      <br>
      <a>(mínimo de 8 caracteres, entre letras e números)</a>
      <button type="submit">Cadastrar</button>
    </form>
  </div>
</body>
</html>
