<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="style-comentario.css">
</head>

<body>
    <header>
        <div class="top-buttons">
            <a href="/pagina-cadastro"><button class="signup-button" type="button">nome de usuario</button></a>
            <br><br><br><br>
            <a href="/pagina-avaliaçao"><button class="analize-button" type="button">criar análise</button></a>
            
        </div>
        
        <h1>Bem-vindo às páginas encantadas</h1>
        <p>Explore a magia das páginas web com encanto.</p>
    </header>
    
    <form action="/seu-servlet-ou-outro-endpoint" method="get">
        <input type="text" name="q" placeholder="Pesquisar...">
        <button type="submit">Buscar</button> 
    </form>
   
        <!-- Avaliações -->
    <h2 class="reviews-title">comentarios</h2>
    <div class="reviews-container">
        <!-- Primeira Linha -->
        <a class="review-button review-1" href="/pagina-avaliacao?avaliacao=1">1</a>
        <a class="review-button review-2" href="/pagina-avaliacao?avaliacao=2">2</a>
        <a class="review-button review-3" href="/pagina-avaliacao?avaliacao=3">3</a>
    </div>
    <div class="reviews-container">
        <!-- Segunda Linha -->
        <a class="review-button review-4" href="/pagina-avaliacao?avaliacao=4">4</a>
        <a class="review-button review-5" href="/pagina-avaliacao?avaliacao=5">5</a>
        <a class="review-button review-6" href="/pagina-avaliacao?avaliacao=6">6</a>
    </div>

    <!-- Categorias -->
    <div class="categories-container">
        <h2 class="categories-title">Categoria</h2>
        <ul>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Fantasia">Fantasia</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Romance">Romance</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Drama">Drama</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Terror">Terror</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Ficção Cientifica">Ficção Científica</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Comedia">Comédia</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Suspense">Suspense</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Historia">historia</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Misterio">Misterio</a></li>
        </ul>
    </div>
    
    <!-- Comentários -->
    <br><br><br><br><br><br><br>
     <div class="buttons">
        <a href="/pagina-comentarios"><button class="comentarios-button" type="button">escrever comentario</button></a>
    </div>
</body>

</html>