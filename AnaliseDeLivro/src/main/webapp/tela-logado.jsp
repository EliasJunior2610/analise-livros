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

    <form action="UserInfoServlet" method="get">
        <input type="text" name="q" placeholder="Pesquisar...">
        <button type="submit">Buscar</button>
        <a class="login-button" href="cadastro.jsp">Cadastro</a>
        
        
        <span>
            <% if (request.getAttribute("NomeDeUsuario") != null) { %>
                Bem-vindo, <%= request.getAttribute("NomeDeUsuario") %>!
            <% } else { %>
                <a class="login-button" href="login.jsp">Login</a>
            <% } %>
        </span>
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