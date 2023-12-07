package br.com.facol.AnaliseDeLivro.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.IOException;
import java.util.Properties;

@WebServlet("/RecuperacaoSenhaServlet")
public class RecuperacaoSenhaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        
        String novaSenha = gerarNovaSenha();

        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(System.getenv("SEU_EMAIL"), System.getenv("SUA_SENHA_EMAIL"));
            }
        };

        
        Session session = Session.getInstance(props, auth);

        try {
            
            Message message = new MimeMessage(session);

            String seuEmail = System.getenv("SEU_EMAIL");

            try {
                if (seuEmail != null && !seuEmail.isEmpty()) {
                    InternetAddress fromAddress = new InternetAddress(seuEmail);
                    message.setFrom(fromAddress);
                } else {
                    
                    System.out.println("Erro: SEU_EMAIL não está definido ou é vazio.");
                }
            } catch (AddressException e) {
                
                e.printStackTrace();
                System.out.println("Erro ao criar o endereço de e-mail do remetente.");
            }

            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Recuperação de Senha");

            
            String texto = "Olá " + username + ",\n\nSua nova senha (ISSO É UM TESTE) é: " + novaSenha;

            
            MimeMultipart multipart = new MimeMultipart("alternative");
            BodyPart textoPart = new MimeBodyPart();
            textoPart.setText(texto);
            multipart.addBodyPart(textoPart);

            message.setContent(multipart);

            
            Transport.send(message);

            
            response.sendRedirect("login.jsp"); 
        } catch (MessagingException e) {
            e.printStackTrace();
            response.sendRedirect("recuperar-senha.jsp"); 
        } catch (Exception e) {
            
            e.printStackTrace();
            System.out.println("Erro inesperado.");
        }
    }

    
    private String gerarNovaSenha() {
        
        return "novaSenha123";
    }
}
