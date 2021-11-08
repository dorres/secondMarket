package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PersonalQnaVO {

		private int qna_personal_serial;
		private String user_id;
		private String user_name;
		private String order_detail_order_serial;
		private String qna_personal_title;
		private String qna_personal_content;
		private Date qna_personal_date;
		private int qna_personal_hit;
		private String qna_personal_answer;
		private String qna_personal_category;
		private String qna_personal_phone;
		private String qna_personal_email;
		
}
