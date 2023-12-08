<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<%
    String username = (String) session.getAttribute("username");
%>
<head>
    <link rel="stylesheet" type="text/css" href="style-pagina-principal.css">
</head>

<body>
    <header>
        <div class="top-buttons">
            <c:choose>
                <c:when test="${not empty username}">
                    <a href="#" class="user-profile" onclick="togglePerfilBox()">Bem-vindo, ${username}!</a>
                    <a href="LogoutServlet" class="logout">Logout</a>
                    <a href="avaliacao-livros.jsp"><button class="analize-button" type="button">Criar Análise</button></a>
                </c:when>
                <c:otherwise>
                    <a href="cadastro.jsp"><button class="signup-button" type="button">Cadastro</button></a>
                    <a href="login.jsp" class="login-button">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="logo-container">
            <img src="logo.png" alt="Logo" class="logo">
        </div>
        <h1>Bem-vindo às páginas encantadas</h1>
        <p>Explore a magia das páginas web com encanto.</p>
    </header>

    <form action="PesquisaServlet" method="get">
        <input type="text" name="termoPesquisa" placeholder="Pesquisar...">
        <button type="submit">Buscar</button>
    </form>

    <!-- Avaliações -->
    <h2 class="reviews-title">Avaliações</h2>
    <div class="reviews-container">

        <%-- Adicione um trecho de código Java para buscar as avaliações do banco de dados --%>
        <%
            // Substitua essas informações pelas suas credenciais de banco de dados
            String url = "jdbc:mysql://localhost:3306/palavrasencantadas";
            String usuarioBD = "root";
            String senhaBD = "root";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, usuarioBD, senhaBD);

                // Consulta SQL para buscar avaliações (substitua 'avaliacao' pelo nome real da tabela)
                String sql = "SELECT * FROM avaliaçao";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                // Loop para exibir as avaliações
                while (rs.next()) {
                    String titulo = rs.getString("Titulo");
                    int id = rs.getInt("id");

                    // Adicione um link dinâmico para a página de detalhes da avaliação
                    out.println("<a class='review-button' href='DetalhesAvaliacaoServlet?id=" + id + "'>" + titulo + "</a>");
                }

                // Fechar as conexões
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

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

    <!-- sobre o site -->
    <br><br><br><br><br><br>

    <p>Palavras Encantadas é um site que tem como finalidade possibilitar aos usuários a capacidade de avaliar livros e conversar sobre eles.</p>

    <script>
        function togglePerfilBox() {
            var perfilBox = document.getElementById('perfilBox');
            perfilBox.style.display = (perfilBox.style.display === 'block') ? 'none' : 'block';
        }

        function toggleOptions(optionsId) {
            var options = document.getElementById(optionsId);
            options.classList.toggle('hidden');
        }
    </script>
</body>

</html>
