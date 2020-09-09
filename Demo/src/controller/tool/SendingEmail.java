package controller.tool;


import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.util.Properties;

public class SendingEmail extends Thread {
    private String userEmail;
    private String myHash;
    private String servletName;

    public SendingEmail(String servletName, String userEmail, String myHash) {
        this.userEmail = userEmail;
        this.myHash = myHash;
        this.servletName = servletName;
    }

    public SendingEmail() {

    }

    public void sendMailKey(String userEmail, String pathFilePri, String pathFilePub) {
        final String email = "myduyenn218@gmail.com";
        final String password = "myduyenn2188";

        File filePri = new File(pathFilePri);

        File filePub = new File(pathFilePub);
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        // below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Email Key Store");

            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();

            // Now set the actual message
            messageBodyPart.setText("KeyStore please save file!");

            // Create a multipar message
            Multipart multipart = new MimeMultipart();

            // Set text message part
            multipart.addBodyPart(messageBodyPart);

            // Part two is attachment
            messageBodyPart = new MimeBodyPart();

            DataSource source = (DataSource) new FileDataSource(filePri);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName("KeyStore Private Key");
            multipart.addBodyPart(messageBodyPart);
// Part three is attachment
            messageBodyPart = new MimeBodyPart();
            source = (DataSource) new FileDataSource(filePub);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName("KeyStore Public Key");
            multipart.addBodyPart(messageBodyPart);

            // Send the complete message parts
            message.setContent(multipart);

            // Send message
            Transport.send(message);

            filePri.delete();
            filePub.delete();
        } catch (Exception var6) {
            System.out.println("Error at SendingEmail.java: " + var6);
        }

    }

    @Override
    public void run() {
        sendMail();
    }

    private void sendMail() {
        final String email = "myduyenn218@gmail.com";
        final String password = "ucnwpbwrnuubmziw";

        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        // below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.userEmail));
            message.setSubject("Email Verification Link");
            message.setText("Click this link to confirm your email address and complete setup for your account.\n\nVerification Link: http://localhost:8080/" + servletName + "?key1=" + this.userEmail + "&key2=" + this.myHash);
            Transport.send(message);
            System.out.println("SEND OK");
        } catch (Exception var6) {
            System.out.println("Error at SendingEmail.java: " + var6);
        }
    }

    public static void main(String[] args) {
        SendingEmail sen = new SendingEmail();
        sen.sendMail();

    }
}
