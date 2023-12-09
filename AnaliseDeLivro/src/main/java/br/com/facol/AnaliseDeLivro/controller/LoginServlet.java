package br.com.facol.AnaliseDeLivro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.util.Base64;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/palavrasencantadas", "root", "root");

            PreparedStatement pst = con.prepareStatement("SELECT * FROM usuario WHERE NomeDeUsuario=?");
            pst.setString(1, username);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                
                String storedHashedPassword = rs.getString("Senha");

                
                if (checkPassword(password, storedHashedPassword)) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);

                    
                    response.sendRedirect("pagina-principal.jsp");
                } else {
                    out.println("Nome de usuário ou senha inválidos!");
                }
            } else {
                out.println("Nome de usuário ou senha inválidos!");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    private boolean checkPassword(String password, String storedHashedPassword) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = md.digest(password.getBytes());
        String hashedPassword = Base64.getEncoder().encodeToString(hashedBytes);
        return hashedPassword.equals(storedHashedPassword);
    }
}
