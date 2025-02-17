package service;

import com.sun.mail.smtp.SMTPSendFailedException;
import java.util.Properties;
import java.util.Random;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import model.User;

/**
 * Sends an email to the user.
 */
public class SendEmail {


    public SendEmail() {
    }

    public String getRanDom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    public boolean sendEmail(String email, String code) {
        return sendEmail(new User(email, code));
    }
    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "cinepa.org@gmail.com";  // your email
        String password = "yknrqglbmlqumpwt";  // your app password

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
          

            // SSL properties should not be used when using STARTTLS
            pr.remove("mail.smtp.ssl.enable");
            pr.remove("mail.smtp.socketFactory.port");
            pr.remove("mail.smtp.socketFactory.class");
            // Get session
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = new MimeMessage(session);
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setSubject("User Email Verification");
            mess.setText("Registered successfully. Please verify your account using this code " + user.getCode());

            Transport.send(mess);
            test = true;

        } catch (SMTPSendFailedException e) {
            e.printStackTrace();  // Specific SMTP error
        } catch (MessagingException e) {
            e.printStackTrace();  // General messaging error
        } catch (Exception e) {
            e.printStackTrace();  // Any other exception
        }
        return test;
    }
}
