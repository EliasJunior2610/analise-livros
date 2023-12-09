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
    <h2 class="reviews-title">categoria:Drama</h2>
    <div class="reviews-container">
        <!-- Primeira Linha -->
        <a class="review-button review-1" href="/pagina-avaliacao?avaliacao=1">Os Melhores Livros de Drama Policial 
E não sobrou nenhum</a>
        <a class="review-button review-2" href="/pagina-avaliacao?avaliacao=2">Um de Nós Está Mentindo</a>
        <a class="review-button review-3" href="/pagina-avaliacao?avaliacao=3">Os Melhores Livros de Drama e Romance 
Um Lugar Bem Longe Daqui</a>
    </div>
    <div class="reviews-container">
        <!-- Segunda Linha -->
        <a class="review-button review-4" href="/pagina-avaliacao?avaliacao=4">O duque e eu: O livro de Daphne </a>
        <a class="review-button review-5" href="/pagina-avaliacao?avaliacao=5">Os Melhores Livros de Drama e Suspense 
Assassinato no Expresso Oriente</a>
        <a class="review-button review-6" href="/pagina-avaliacao?avaliacao=6">Um Conto de Duas Cidades</a>
    </div>
        <div class="reviews-container">
        <!-- terceira linha -->
        <a class="review-button review-7" href="/pagina-avaliacao?avaliacao=4">A Garota do Lago</a>
        <a class="review-button review-8" href="/pagina-avaliacao?avaliacao=5">Jane Eyre</a>
        <a class="review-button review-9" href="/pagina-avaliacao?avaliacao=6">Romeu e Julieta</a>
    </div>
    
    
    </body>

</html>