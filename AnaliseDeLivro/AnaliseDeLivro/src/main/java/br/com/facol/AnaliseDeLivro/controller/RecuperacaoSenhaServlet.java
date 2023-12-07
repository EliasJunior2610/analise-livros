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
        // Obter os parâmetros do formulário
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        // Lógica para gerar e enviar a nova senha por e-mail
        String novaSenha = gerarNovaSenha(); // Implemente sua lógica para gerar uma nova senha

        // Configurar propriedades para o envio de e-mail
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");

        // Autenticação do usuário no servidor de e-mail
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("", "");
            }
        };

        // Criar uma sessão com as propriedades configuradas
        Session session = Session.getInstance(props, auth);

        try {
            // Criar a mensagem de e-mail
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(""));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Recuperação de Senha");
            message.setText("Olá " + username + ",\n\nSua nova senha (ISSO É UM TESTE) é: " + novaSenha);

            // Enviar o e-mail
            Transport.send(message);

            // Redirecionar ou exibir mensagem de sucesso
            response.sendRedirect("login.jsp"); // Substitua "sucesso.jsp" pelo nome da sua página de sucesso
        } catch (MessagingException e) {
            // Tratar exceções, redirecionar ou exibir mensagem de erro
            e.printStackTrace();
            //response.sendRedirect("recuperar-senha.jsp"); // Substitua "erro.jsp" pelo nome da sua página de erro
        }
    }

    // Função para gerar uma nova senha (substitua com sua lógica)
    private String gerarNovaSenha() {
        // Implemente sua lógica para gerar uma nova senha
        return "novaSenha123";
    }
}
