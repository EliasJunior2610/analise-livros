package br.com.facol.AnaliseDeLivro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.util.Base64;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Verificar se a senha atende aos requisitos
            if (isValidPassword(password)) {
                // Aplicar hash à senha
                String hashedPassword = hashPassword(password);

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/palavrasencantadas", "root", "root");

                PreparedStatement pst = con.prepareStatement("INSERT INTO usuario (Email, NomeDeUsuario, Senha) VALUES (?, ?, ?)");
                pst.setString(1, email);
                pst.setString(2, username);
                pst.setString(3, hashedPassword);

                int i = pst.executeUpdate();

                if (i > 0) {
                    out.println("Conta registrada!");
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Conta não registrada!");
                }
            } else {
                out.println("A senha deve ter pelo menos 8 caracteres e conter uma combinação de letras e números.");
            }
        } catch (Exception e) {
            out.println("Erro: " + e.getMessage());
        }
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hashedBytes);
    }
    

    // Método para verificar se a senha atende aos requisitos
    private boolean isValidPassword(String password) {
        // Verifica se a senha tem pelo menos 8 caracteres
        if (password.length() < 8) {
            return false;
        }

        // Verifica se a senha contém pelo menos uma letra e um número
        boolean hasLetter = false;
        boolean hasDigit = false;

        for (char c : password.toCharArray()) {
            if (Character.isLetter(c)) {
                hasLetter = true;
            } else if (Character.isDigit(c)) {
                hasDigit = true;
            }

            // Se já encontrou ambos, pode sair do loop
            if (hasLetter && hasDigit) {
                break;
            }
        }

        return hasLetter && hasDigit;
    }

    private SecretKey generateSecretKey(String password) throws Exception {
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        byte[] keyBytes = sha.digest(password.getBytes());
        return new SecretKeySpec(keyBytes, "AES");
    }
}
