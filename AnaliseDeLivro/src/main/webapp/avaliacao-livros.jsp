<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   
    String username = (String) session.getAttribute("username");
%>

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
      var romanceCheckbox = document.getElementById("romance");
      var terrorCheckbox = document.getElementById("terror");
      var comediaCheckbox = document.getElementById("comedia");
      var suspenseCheckbox = document.getElementById("suspense");
      var historiaCheckbox = document.getElementById("historia");
      var misterioCheckbox = document.getElementById("misterio");
      var fantasiaCheckbox = document.getElementById("fantasia");
      var ficcaoCientificaCheckbox = document.getElementById("ficcao-cientifica");
      var dramaCheckbox = document.getElementById("drama");

      // Habilita todos os checkboxes
      romanceCheckbox.disabled = false;
      terrorCheckbox.disabled = false;
      comediaCheckbox.disabled = false;
      suspenseCheckbox.disabled = false;
      historiaCheckbox.disabled = false;
      misterioCheckbox.disabled = false;
      fantasiaCheckbox.disabled = false;
      ficcaoCientificaCheckbox.disabled = false;
      dramaCheckbox.disabled = false;

      // Verifica o título selecionado
      switch (bookTitle.value) {
        case "persy-jackson":
        case "narnia":
        case "harry-potter":
          // Se o título for um dos livros de fantasia mencionados, escolhe automaticamente "Fantasia"
          fantasiaCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasiaCheckbox.disabled = true;
          romanceCheckbox.disabled = true;
          terrorCheckbox.disabled = true;
          comediaCheckbox.disabled = true;
          suspenseCheckbox.disabled = true;
          historiaCheckbox.disabled = true;
          misterioCheckbox.disabled = true;
          ficcaoCientificaCheckbox.disabled = true;
          dramaCheckbox.disabled = true;

          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        case "neuromancer":
        case "duna":
        case "1984":
          // Se o título for um dos livros de ficção científica mencionados, escolhe automaticamente "Ficção Científica"
          ficcaoCientificaCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasiaCheckbox.disabled = true;
          romanceCheckbox.disabled = true;
          terrorCheckbox.disabled = true;
          comediaCheckbox.disabled = true;
          suspenseCheckbox.disabled = true;
          historiaCheckbox.disabled = true;
          misterioCheckbox.disabled = true;
          ficcaoCientificaCheckbox.disabled = true;
          dramaCheckbox.disabled = true;


          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        case "cade-voce-bernadette":
        case "o-diabo-veste-prata":
        case "vermelho-branco-e-sangue-azul":
          // Se o título for um dos livros de comédia mencionados, escolhe automaticamente "Comédia"
          comediaCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasiaCheckbox.disabled = true;
          romanceCheckbox.disabled = true;
          terrorCheckbox.disabled = true;
          comediaCheckbox.disabled = true;
          suspenseCheckbox.disabled = true;
          historiaCheckbox.disabled = true;
          misterioCheckbox.disabled = true;
          ficcaoCientificaCheckbox.disabled = true;
          dramaCheckbox.disabled = true;

          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        case "a-garota-do-lago":
        case "um-de-nos-esta-mentindo":
        case "jane-eyre":
          // Se o título for um dos livros de drama mencionados, escolhe automaticamente "Drama"
          dramaCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasiaCheckbox.disabled = true;
          romanceCheckbox.disabled = true;
          terrorCheckbox.disabled = true;
          comediaCheckbox.disabled = true;
          suspenseCheckbox.disabled = true;
          historiaCheckbox.disabled = true;
          misterioCheckbox.disabled = true;
          ficcaoCientificaCheckbox.disabled = true;
          dramaCheckbox.disabled = true;


          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        case "a-danca-da-morte":
        case "o-cemiterio":
        case "lembre-se":
          // Se o título for um dos livros de terror mencionados, escolhe automaticamente "Terror"
          terrorCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasiaCheckbox.disabled = true;
          romanceCheckbox.disabled = true;
          terrorCheckbox.disabled = true;
          comediaCheckbox.disabled = true;
          suspenseCheckbox.disabled = true;
          historiaCheckbox.disabled = true;
          misterioCheckbox.disabled = true;
          ficcaoCientificaCheckbox.disabled = true;
          dramaCheckbox.disabled = true;


          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        case "rebecca":
        case "morte-no-internato":
        case "garota-exemplar":
          // Se o título for um dos livros de suspense mencionados, escolhe automaticamente "Suspense"
          suspenseCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasiaCheckbox.disabled = true;
          romanceCheckbox.disabled = true;
          terrorCheckbox.disabled = true;
          comediaCheckbox.disabled = true;
          suspenseCheckbox.disabled = true;
          historiaCheckbox.disabled = true;
          misterioCheckbox.disabled = true;
          ficcaoCientificaCheckbox.disabled = true;
          dramaCheckbox.disabled = true;


          // Esconde as opções de gênero para o usuário
          genreOptions.style.display = "none";
          break;

        case "o-simbolo-perdido":
        case "a-mortalha-dourada":
        case "o-homem-de-giz":
          // Se o título for um dos livros de mistério mencionados, escolhe automaticamente "Mistério"
          misterioCheckbox.checked = true;

          // Desabilita os checkboxes para impedir que o usuário desmarque
          fantasiaCheckbox.disabled = true;
          romanceCheckbox.disabled = true;
          terrorCheckbox.disabled = true;
          comediaCheckbox.disabled = true;
          suspenseCheckbox.disabled = true;
          historiaCheckbox.disabled = true;
          misterioCheckbox.disabled = true;
          ficcaoCientificaCheckbox.disabled = true;
          dramaCheckbox.disabled = true;


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
        <!-- Livros de Fantasia -->
        <option value="persy-jackson">Percy Jackson</option>
        <option value="narnia">Nárnia</option>
        <option value="harry-potter">Harry Potter</option>
        <!-- Livros de Ficção Científica -->
        <option value="neuromancer">Neuromancer</option>
        <option value="duna">Duna</option>
        <option value="1984">1984</option>
        <!-- Livros de Comédia -->
        <option value="cade-voce-bernadette">Cadê Você, Bernadette?</option>
        <option value="o-diabo-veste-prata">O Diabo Veste Prata</option>
        <option value="vermelho-branco-e-sangue-azul">Vermelho, Branco e Sangue Azul</option>
        <!-- Livros de Drama -->
        <option value="a-garota-do-lago">A Garota do Lago</option>
        <option value="um-de-nos-esta-mentindo">Um de Nós Está Mentindo</option>
        <option value="jane-eyre">Jane Eyre</option>
        <!-- Livros de Terror -->
        <option value="a-danca-da-morte">A Dança da Morte</option>
        <option value="o-cemiterio">O Cemitério</option>
        <option value="lembre-se">Lembre-se</option>
        <!-- Livros de Suspense -->
        <option value="rebecca">Rebecca</option>
        <option value="morte-no-internato">Morte no Internato</option>
        <option value="garota-exemplar">Garota Exemplar</option>
        <!-- Livros de Mistério -->
        <option value="o-simbolo-perdido">O Símbolo Perdido</option>
        <option value="a-mortalha-dourada">A Mortalha Dourada</option>
        <option value="o-homem-de-giz">O Homem de Giz</option>
        <!-- Adicione mais opções de livros aqui -->
      </select>

      <label for="author">Avaliador:</label>
      <input type="text" id="author" name="author" required value="<%= username %>" readonly>

      <label for="genre">Gênero:</label>
      <button type="button" onclick="toggleGenres()">Gênero</button>
      <div class="checkbox-group" id="genre-options" style="display: none;">
        <input type="checkbox" id="romance" name="genre" value="Romance" disabled>
        <label for="romance">Romance</label>

        <input type="checkbox" id="terror" name="genre" value="Terror" disabled>
        <label for="terror">Terror</label>

        <input type="checkbox" id="comedia" name="genre" value="Comedia" disabled>
        <label for="comedia">Comédia</label>

        <input type="checkbox" id="suspense" name="genre" value="Suspense" disabled>
        <label for="suspense">Suspense</label>

        <input type="checkbox" id="historia" name="genre" value="Historia" disabled>
        <label for="historia">História</label>

        <input type="checkbox" id="misterio" name="genre" value="Misterio" disabled>
        <label for="misterio">Mistério</label>

        <input type="checkbox" id="fantasia" name="genre" value="Fantasia" disabled>
        <label for="fantasia">Fantasia</label>

        <input type="checkbox" id="ficcao-cientifica" name="genre" value="Ficcao Cientifica" disabled>
        <label for="ficcao-cientifica">Ficção Científica</label>

        <input type="checkbox" id="drama" name="genre" value="Drama" disabled>
        <label for="drama">Drama</label>

        
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