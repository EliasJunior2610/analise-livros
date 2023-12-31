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

@WebServlet("/PesquisaServlet")
public class PesquisaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String termoPesquisa = request.getParameter("termoPesquisa");

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
            String sql = "SELECT * FROM avaliaçao WHERE Titulo LIKE ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, "%" + termoPesquisa + "%");

                try (ResultSet rs = stmt.executeQuery()) {
                    out.println("<html><head><title>Resultados da Pesquisa</title></head><body>");
                    out.println("<h2>Resultados da Pesquisa para '" + termoPesquisa + "':</h2>");

                    if (rs.next()) {
                        do {
                            String titulo = rs.getString("Titulo");
                            String id = rs.getString("id");

                            out.println("<p><a href='DetalhesAvaliacaoServlet?id=" + id + "'>" + titulo + "</a></p>");
                        } while (rs.next());
                    } else {
                        out.println("<p>Nenhum resultado encontrado para o termo de pesquisa: " + termoPesquisa + "</p>");
                    }

                    out.println("</body></html>");
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
