<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Avaliação de Livros</title>
  <link rel="stylesheet" href="style.css">
  <script>
    function toggleGenres() {
      var genreOptions = document.getElementById("genre-options");
      genreOptions.style.display = genreOptions.style.display === "none" ? "block" : "none";
    }

    function selectGenres() {
      var bookTitle = document.getElementById("titulo");
      var genreOptions = document.getElementById("genre-options");
      var fantasyCheckbox = document.getElementById("fantasy");
      var sciFiCheckbox = document.getElementById("sci-fi");

      // Habilita todos os checkboxes
      fantasyCheckbox.disabled = false;
      sciFiCheckbox.disabled = false;

      // Verifica o título selecionado
      switch (bookTitle.value) {
        case "star-wars":
          // Se o título for "Star Wars", escolhe automaticamente "Ficção Científica"
          sciFiCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasyCheckbox.disabled = true;
          sciFiCheckbox.disabled = true;

          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        case "lord-of-the-rings":
          // Se o título for "Senhor dos Anéis", escolhe automaticamente "Fantasia"
          fantasyCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasyCheckbox.disabled = true;
          sciFiCheckbox.disabled = true;

          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        default:
          // Para outros livros, redefina as opções
          break;
      }
    }
  </script>
</head>
<body>
  <div id="container">
    <h1>Avaliação de Livros</h1>
    <form id="form" action="BookReviewServlet" method="post">
      <label for="title">Título do Livro:</label>
      <select id="titulo" name="titulo" onchange="selectGenres()" required>
        <option value="choose" disabled selected>Escolha o seu livro abaixo:</option>
        <option value="star-wars">Star Wars</option>
        <option value="lord-of-the-rings">Senhor dos Anéis</option>
        <!-- Adicione mais opções de livros aqui -->
      </select>

      <label for="author">Autor:</label>
      <input type="text" id="author" name="author" required>

      <label for="genre">Gênero:</label>
      <button type="button" onclick="toggleGenres()">Gênero</button>
      <div class="checkbox-group" id="genre-options" style="display: none;">
        <input type="checkbox" id="fantasy" name="genre" value="Fantasia" disabled>
        <label for="fantasy">Fantasia</label>

        <input type="checkbox" id="sci-fi" name="genre" value="Ficcao Cientifica" disabled>
        <label for="sci-fi">Ficção Científica</label>

        <!-- Adicione mais opções de gênero aqui -->
      </div>

      <label for="rating">Avaliação (1 a 5):</label>
      <div class="rating" id='rating'>
        <input type="radio" id="rating1" name="rating" value="1">
        <label for="rating1">1</label>
        <input type="radio" id="rating2" name="rating" value="2">
        <label for="rating2">2</label>
        <input type="radio" id="rating3" name="rating" value="3">
        <label for="rating3">3</label>
        <input type="radio" id="rating4" name="rating" value="4">
        <label for="rating4">4</label>
        <input type="radio" id="rating5" name="rating" value="5">
        <label for="rating5">5</label>
      </div>

      <label for="review">Avaliação:</label>
      <textarea id="review" name="review" rows="4" required></textarea>

      <button type="submit">Enviar Avaliação</button>
    </form>
  </div>
</body>
</html>
