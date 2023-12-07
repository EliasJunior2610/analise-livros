<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Página de Login</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div id="container">
    <h1>Página de Login</h1>
    <form id="form" action="LoginServlet" method="post">
      <label for="username">Nome de Usuário:</label>
      <input type="text" id="username" name="username" required>

      <label for="password">Senha:</label>
      <input type="password" id="password" name="password" required>
      <br>
	  <a  href="recuperar-senha.jsp">Esqueci a senha</a>
      <button type="submit">Entrar</button>
    </form>
  </div>
</body>
</html>
