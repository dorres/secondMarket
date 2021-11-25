package first.market.kurlyty.emailsend;

import lombok.Data;

@Data
public class EmailSendVO {
	private String email;
	private String password;
	private String iv;
	private String key;
	
	//발신용 정보 변수들
	private String sendEmail;
	private String subject;
	private String content;
}
