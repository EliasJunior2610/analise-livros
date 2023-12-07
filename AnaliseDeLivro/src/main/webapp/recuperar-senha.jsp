<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recuperação de Senha</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div id="container">
    <h1>Recuperação de Senha</h1>
    <form id="form" action="RecuperacaoSenhaServlet" method="post">
      <label for="email">E-mail:</label>
      <input type="email" id="email" name="email" required>

      <label for="username">Nome de Usuário:</label>
      <input type="text" id="username" name="username" required>


      <button type="submit">Enviar nova senha para e-mail </button>
    </form>
  </div>
</body>
</html>
