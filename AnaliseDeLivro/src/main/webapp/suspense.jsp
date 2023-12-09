<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="style-categoria-fantasia.css">
</head>

<body>
    <header>
        <div class="top-buttons">
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
    <h2 class="reviews-title">categoria:Suspense</h2>
    <div class="reviews-container">
        <!-- Primeira Linha -->
        <a class="review-button review-1" href="/pagina-avaliacao?avaliacao=1">O silêncio dos inocentes</a>
        <a class="review-button review-2" href="/pagina-avaliacao?avaliacao=2">Morte no internato</a>
        <a class="review-button review-3" href="/pagina-avaliacao?avaliacao=3">As espiãs do dia D</a>
    </div>
    <div class="reviews-container">
        <!-- Segunda Linha -->
        <a class="review-button review-4" href="/pagina-avaliacao?avaliacao=4">Ilha do medo</a>
        <a class="review-button review-5" href="/pagina-avaliacao?avaliacao=5">Rebecca</a>
        <a class="review-button review-6" href="/pagina-avaliacao?avaliacao=6">Garota exemplar</a>
    </div>
        <div class="reviews-container">
        <!-- terceira linha -->
        <a class="review-button review-7" href="/pagina-avaliacao?avaliacao=4">Anna Karenina </a>
        <a class="review-button review-8" href="/pagina-avaliacao?avaliacao=5">O código Da Vinci</a>
        <a class="review-button review-9" href="/pagina-avaliacao?avaliacao=6">Boneco de neve</a>
    </div>
    
    </body>

</html>