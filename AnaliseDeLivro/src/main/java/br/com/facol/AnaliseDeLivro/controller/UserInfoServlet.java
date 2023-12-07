package br.com.facol.AnaliseDeLivro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/palavrasencantadas", "root", "root");

            
            String nomeDeUsuario = buscarNomeDeUsuarioNoBancoDeDados(con, "opa");

            
            request.setAttribute("NomeDeUsuario", nomeDeUsuario);

            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/seu-arquivo.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            
            e.printStackTrace(); 
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); 
            }
        }
    }

    
    private String buscarNomeDeUsuarioNoBancoDeDados(Connection con, String nomeUsuario) throws SQLException {
        String nomeDeUsuario = null;
        String query = "SELECT NomeDeUsuario FROM usuario WHERE NomeDeUsuario = ?";
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, nomeUsuario);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    nomeDeUsuario = rs.getString("NomeDeUsuario");
                }
            }
        }

        return nomeDeUsuario;
    }
}
