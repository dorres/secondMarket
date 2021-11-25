package first.market.kurlyty.emailsend;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSend {
	public static void gmailSend(String email, String pass,EmailSendVO emailSend) throws AddressException, MessagingException {
        String user = email; // ���̹��� ��� ���̹� ����, gmail��� gmail ����
        String password = pass;   // �н�����

        // SMTP ���� ������ �����Ѵ�.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));

            //�����ڸ����ּ�
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailSend.getSendEmail())); 

           // Subject
        message.setSubject(emailSend.getSubject()); //���� ������ �Է�

            // Text
        message.setText(emailSend.getContent());    //���� ������ �Է�

         // send the message
        Transport.send(message); ////����
        System.out.println("message sent successfully...");
       
    }
}
