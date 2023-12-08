package br.com.facol.AnaliseDeLivro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComentarioServlet")
public class ComentarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String nomeUsuario = request.getParameter("campoNomeUsuario");
        String comentario = request.getParameter("campoComentario");

        // JDBC Connection
        String jdbcURL = "jdbc:mysql://localhost:3306/palavrasencantadas";
        String dbUser = "root";
        String dbPassword = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "INSERT INTO comentario (Titulo, NomeDeUsuario, Descriçao) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, nomeUsuario);
            statement.setString(3, comentario);

            int rows = statement.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("pagina-principal.jsp"); 
            } else {
                response.sendRedirect("escrever-comentário.jsp?id=" + id); 
            }

            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
