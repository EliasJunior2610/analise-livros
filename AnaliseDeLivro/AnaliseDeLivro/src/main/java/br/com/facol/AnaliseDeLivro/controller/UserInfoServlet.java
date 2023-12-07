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
            // Carrega dinamicamente o driver JDBC para o MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Tenta estabelecer uma conexão com o banco de dados MySQL e executa as operações subsequentes
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/palavrasencantadas", "root", "root");

            // Simula a busca do NomeDeUsuario no banco de dados
            String nomeDeUsuario = buscarNomeDeUsuarioNoBancoDeDados(con, "blabla");

            // Define o valor no atributo da requisição
            request.setAttribute("NomeDeUsuario", nomeDeUsuario);

            // Encaminhe para o seu JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/seu-arquivo.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            // Trata adequadamente as exceções em um ambiente de produção
            e.printStackTrace(); // Adicione esta linha para verificar erros no console
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Adicione esta linha para verificar erros no console
            }
        }
    }

    // Método para buscar o nome de usuário no banco de dados
    private String buscarNomeDeUsuarioNoBancoDeDados(Connection con, String nomeUsuario) throws SQLException {
        String nomeDeUsuario = null;

        // Substitua o código abaixo pela sua lógica de consulta real ao banco de dados
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
