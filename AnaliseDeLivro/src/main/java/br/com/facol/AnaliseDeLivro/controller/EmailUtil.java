package br.com.facol.AnaliseDeLivro.controller;

import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
    private static final String HOST = "sandbox.smtp.mailtrap.io";
    private static final String EMAIL_FROM = "eliasjuniorradical@gmail.com";
    private static final String USERNAME = "7275fc7e84cc96";
    private static final String PASSWORD = "1c0beea9d6bafa";

    private static final Logger logger = Logger.getLogger(EmailUtil.class.getName());

    public static void enviarEmailRecuperacaoSenha(String emailUsuario, String codigoRecuperacao) {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        try {
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(EMAIL_FROM));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailUsuario));
            message.setSubject("Recuperação de Senha - Palavras Encantadas");
            message.setText("Olá!\n\nRecebemos uma solicitação para recuperar sua senha no site Palavras Encantadas.\n\n"
                    + "Seu código de recuperação é: " + codigoRecuperacao + "\n\n"     
                    + "Atenciosamente,\nSuporte do Palavras Encantadas");

            Transport.send(message);
            logger.info("Email enviado com sucesso");
        } catch (MessagingException e) {
            logger.log(Level.SEVERE, "Erro ao enviar email de recuperação de senha", e);
        }
    }

    public static String gerarNovaSenha() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        return salt.toString();
    }
}
