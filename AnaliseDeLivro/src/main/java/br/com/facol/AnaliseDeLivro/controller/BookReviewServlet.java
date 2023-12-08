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

@WebServlet("/BookReviewServlet")
public class BookReviewServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Titulo = request.getParameter("titulo");
        String NomeDeUsuario = request.getParameter("author");
        String Descriçao = request.getParameter("review");
        int nota = Integer.parseInt(request.getParameter("rating"));
        
        String[] generos = request.getParameterValues("genre");
        String generoString = (generos != null) ? String.join(", ", generos) : "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/palavrasencantadas", "root", "root");

            PreparedStatement pst = connection.prepareStatement("INSERT INTO avaliaçao (Titulo, NomeDeUsuario, Descriçao, nota, genero) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, Titulo);
            pst.setString(2, NomeDeUsuario);
            pst.setString(3, Descriçao);
            pst.setInt(4, nota);
            pst.setString(5, generoString);

            int i = pst.executeUpdate();

            if (i > 0) {
                System.out.println("Avaliação registrada!");
            } else {
                System.out.println("Avaliação não registrada!");
            }

            connection.close();
            response.sendRedirect("pagina-principal.jsp");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

    }
}
