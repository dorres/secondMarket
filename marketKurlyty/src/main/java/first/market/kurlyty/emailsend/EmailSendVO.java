package first.market.kurlyty.emailsend;

import lombok.Data;

@Data
public class EmailSendVO {
	private String email;
	private String password;
	private String iv;
	private String key;
	
	//�߽ſ� ���� ������
	private String sendEmail;
	private String subject;
	private String content;
}
