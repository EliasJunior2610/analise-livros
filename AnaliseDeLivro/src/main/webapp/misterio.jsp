<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="style-categoria-fantasia.css">
</head>

<body>
    <header>
        <div class="top-buttons">
            <a href="cadastro.jsp"><button class="signup-button" type="button">nome de usuario</button></a>
            <br><br><br><br>
            <a href="avaliacao-livros.jsp"><button class="analize-button" type="button">criar análise</button></a>
            
        </div>
        
        <h1>Bem-vindo às páginas encantadas</h1>
        <p>Explore a magia das páginas web com encanto.</p>
    </header>
    
    <form action="PesquisaServlet" method="get">
        <input type="text" name="termoPesquisa" placeholder="Pesquisar...">
        <button type="submit">Buscar</button> 
    </form>
   
        <!-- Avaliações -->
    <h2 class="reviews-title">categoria:mistério</h2>
    <div class="reviews-container">
        <!-- Primeira Linha -->
        <a class="review-button review-1" href="/pagina-avaliacao?avaliacao=1">A Mortalha Dourada</a>
        <a class="review-button review-2" href="/pagina-avaliacao?avaliacao=2">Um mistério no Caribe</a>
        <a class="review-button review-3" href="/pagina-avaliacao?avaliacao=3">Arsène Lupin e a mansão misteriosa</a>
    </div>
    <div class="reviews-container">
        <!-- Segunda Linha -->
        <a class="review-button review-4" href="/pagina-avaliacao?avaliacao=4">As Aventuras de Sherlock Holmes </a>
        <a class="review-button review-5" href="/pagina-avaliacao?avaliacao=5">O Assassinato de Roger Ackroyd</a>
        <a class="review-button review-6" href="/pagina-avaliacao?avaliacao=6">Garota Exemplar</a>
    </div>
        <div class="reviews-container">
        <!-- terceira linha -->
        <a class="review-button review-7" href="/pagina-avaliacao?avaliacao=4">O Símbolo Perdido </a>
        <a class="review-button review-8" href="/pagina-avaliacao?avaliacao=5">O homem de giz</a>
        <a class="review-button review-9" href="/pagina-avaliacao?avaliacao=6">Morte no internato</a>
    </div>
    <!-- Categorias -->
    <div class="categories-container">
        <h2 class="categories-title">Categoria</h2>
        <ul>
            <li><a href="fantasia.jsp">Fantasia</a></li>
            <li><a href="romance.jsp">Romance</a></li>
            <li><a href="drama.jsp">Drama</a></li>
            <li><a href="terror.jsp">Terror</a></li>
            <li><a href="ficcao-cientifica.jsp">Ficção Científica</a></li>
            <li><a href="comedia.jsp">Comédia</a></li>
            <li><a href="suspense.jsp">Suspense</a></li>
            <li><a href="historia.jsp">História</a></li>
            <li><a href="misterio.jsp">Mistério</a></li>
        </ul>
    </div>
    
    </body>

</html>