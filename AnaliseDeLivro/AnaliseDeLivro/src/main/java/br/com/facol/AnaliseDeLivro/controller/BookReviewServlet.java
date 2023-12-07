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
    //private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Titulo = request.getParameter("titulo");
        String NomeDeUsuario = request.getParameter("author");
        String Descriçao = request.getParameter("review");
        int nota = Integer.parseInt(request.getParameter("rating"));
        String[] Genero = request.getParameterValues("genre");
        String generoString = String.join(", ", Genero);
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/palavrasencantadas", "root", "root");

            // Insert data into the database
            //String sql = "INSERT INTO avaliaçao (Titulo, NomeDeUsuario, Descriçao, genero) VALUES (?, ?, ?)";
            PreparedStatement pst = connection.prepareStatement("INSERT INTO avaliaçao (Titulo, NomeDeUsuario, Descriçao, nota, genero) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, Titulo);
            pst.setString(2, NomeDeUsuario);
            pst.setString(3, Descriçao);
            pst.setInt(4, nota);
            pst.setString(5, generoString);
            int i = pst.executeUpdate();
            if (i > 0) {
                System.out.println("Avaliação registrada!");

                //response.sendRedirect("login.jsp");
            } else {
                System.out.println("Avaliação não registrada!");
            }
            // Close the connection
            connection.close();

            // Redirect to a success page or do any other necessary processing
            response.sendRedirect("pagina-principal.jsp");
        } catch (Exception e) {
        	System.out.println("Erro: " + e.getMessage());
            // Handle exceptions and redirect to an error page
            //response.sendRedirect("error.jsp");
        }
    }
}