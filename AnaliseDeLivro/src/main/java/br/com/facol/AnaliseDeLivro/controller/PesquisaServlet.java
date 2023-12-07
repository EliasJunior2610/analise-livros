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

        try (Connection conn = DriverManager.getConnection(url, usuario, senha)) {
            String sql = "SELECT * FROM avaliaçao WHERE Titulo LIKE ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, "%" + termoPesquisa + "%");
                System.out.println(stmt);
                try (ResultSet rs = stmt.executeQuery()) {
                    
                    while (rs.next()) {
                    	String titulo = rs.getString("Titulo");
                        out.println("<p>" + titulo + "</p>");
                        System.out.println("Valor do termoPesquisa: " + termoPesquisa);

                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }

        
        out.println("<html><head><title>Resultados da Pesquisa</title></head><body>");
        out.println("<h2>Resultados da Pesquisa para '" + termoPesquisa + "':</h2>");
        out.println("</body></html>");
    }
}
