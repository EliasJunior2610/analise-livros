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
  </script>
</head>
<body>
  <div id="container">
    <h1>Avaliação de Livros</h1>
    <form id="form" action="BookReviewServlet" method="post">
      <label for="title">Título do Livro:</label>
      <select id="titulo" name="titulo" required>
        <option value="fiction">Escolha o seu livro abaixo:</option>
        <option value="fiction">Star Wars</option>
        <option value="non-fiction">Senhor dos Anéis</option>
        <option value="mystery">Nárnia</option>
        <option value="sci-fi">Crespúsculo</option>
      </select>

      <label for="author">usuario:</label>
      <input type="text" id="author" name="author" required>

      <label for="genre">Gênero:</label>
      <button type="button" onclick="toggleGenres()">Gênero</button>
      <div class="checkbox-group" id="genre-options" style="display: none;">
        <input type="checkbox" id="fiction" name="genre" value="fiction">
        <label for="fiction">Ficção</label>

        <input type="checkbox" id="non-fiction" name="genre" value="Nao Ficcao">
        <label for="non-fiction">Não Ficção</label>

        <input type="checkbox" id="mystery" name="genre" value="Misterio">
        <label for="mystery">Mistério</label>

        <input type="checkbox" id="sci-fi" name="genre" value="Ficcao Cientifica">
        <label for="sci-fi">Ficção Científica</label>
        
        <input type="checkbox" id="historia" name="genre" value="Historia">
        <label for="historia">História</label>
        
        <input type="checkbox" id="drama" name="genre" value="Drama">
        <label for="drama">Drama</label>
        
        <input type="checkbox" id="romance" name="genre" value="Romance">
        <label for="romance">Romance</label>
        
        <input type="checkbox" id="suspense" name="genre" value="Suspense">
        <label for="suspense">Suspense</label>
        
        <input type="checkbox" id="terror" name="genre" value="Terror">
        <label for="terror">terror</label>
        
        <input type="checkbox" id="comedia" name="genre" value="Comedia">
        <label for="comedia">Comédia</label>
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