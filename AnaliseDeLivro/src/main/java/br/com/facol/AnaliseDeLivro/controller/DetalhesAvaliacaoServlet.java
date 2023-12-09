package br.com.facol.AnaliseDeLivro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DetalhesAvaliacaoServlet")
public class DetalhesAvaliacaoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");

        String url = "jdbc:mysql://localhost:3306/palavrasencantadas";
        String usuario = "root";
        String senha = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<html><head><title>Erro</title></head><body>");
            out.println("<p>Erro ao carregar o driver JDBC: " + e.getMessage() + "</p>");
            out.println("</body></html>");
            return;
        }

        try (Connection conn = DriverManager.getConnection(url, usuario, senha)) {
            String sql = "SELECT * FROM avaliaçao WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, id);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {                  
                        String titulo = rs.getString("Titulo");
                        String autor = rs.getString("NomeDeUsuario");
                        String conteudo = rs.getString("Descriçao");

                        out.println("<html><head><title>Detalhes da Avaliação</title></head><body>");
                        out.println("<h2>Detalhes da Avaliação</h2>");
                        out.println("<p><strong>Título:</strong> " + titulo + "</p>");
                        out.println("<p><strong>Autor:</strong> " + autor + "</p>");
                        out.println("<p><strong>Conteúdo:</strong> " + conteudo + "</p>");

                        
                        out.println("<form action='comentarios.jsp' method='get'>");
                        out.println("<input type='hidden' name='id' value='" + id + "'>");
                        out.println("<input type='submit' value='Ver Comentários'>");
                        out.println("</form>");

                        out.println("</body></html>");
                    } else {
                        out.println("<p>Avaliação não encontrada com o ID: " + id + "</p>");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<html><head><title>Erro</title></head><body>");
            out.println("<p>Erro ao executar a consulta: " + e.getMessage() + "</p>");
            out.println("</body></html>");
        }
    }
}
