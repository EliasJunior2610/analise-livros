<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="style-pagina-principal.css">
</head>

<body>
    <header>
        <h1>Bem-vindo às páginas encantadas</h1>
        <p>Explore a magia das páginas web com encanto.</p>
    </header>

    <form action="/seu-servlet-ou-outro-endpoint" method="get">
        <input type="text" name="q" placeholder="Pesquisar...">
        <button type="submit">Buscar</button>
        <a class="login-button" href="cadastro.jsp">Cadastro</a>
        <a class="login-button" href="login.jsp">Login</a>
        <!-- Use a tag <a> para criar um link para login.jsp -->
    </form>
	<div class='direita'>
	
	</div>
    <!-- Avaliações -->
    <h2 class="reviews-title">Avaliações</h2>
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
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Aventura">Aventura</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Comedia">Comédia</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Drama">Drama</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Fantasia">Fantasia</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Ficção Cientifica">Ficção Científica</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Historia">História</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Poesia">Poesia</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Romance">Romance</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Suspense">Suspense</a></li>
            <li><a href="/seu-servlet-ou-outro-endpoint?categoria=Terror">Terror</a></li>
        </ul>
    </div>
</body>

</html>