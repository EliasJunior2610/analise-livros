<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="style-comentario.css">
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
        <input type="text" name="termoPesquisa" class='pesquisar' placeholder="Pesquisar...">
        <button type="submit">Buscar</button>
    </form>

    <!-- Avaliações ... -->
    <h2 class="reviews-title">Comentários:</h2>
    <div class="reviews-container">
        
        <%
            String url = "jdbc:mysql://localhost:3306/palavrasencantadas";
            String usuarioBD = "root";
            String senhaBD = "root";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, usuarioBD, senhaBD);

                String sql = "SELECT * FROM comentario";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    String comentario = rs.getString("Descriçao");

                    out.println("<p>" + comentario + "</p>");
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>

    <!-- Comentários -->
    <div class="buttons">
        <a href="escrever-comentário.jsp"><button class="comentarios-button" type="button">escrever comentario</button></a>
    </div>

    <!-- Categorias -->
    <div class="categories-container">
        <h2 class="categories-title">Categorias</h2>
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