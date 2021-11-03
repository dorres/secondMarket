package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

public class PersonalQnaVO {

	@Data
	public class PersonalQna {
		private int qna_personal_serial;
		private String user_id;
		private String admin_name;
		private String order_detail_order_serial;
		private String qna_personal_title;
		private String qna_personal_content;
		private Date qna_personal_date;
		private int qna_personal_hit;
		private boolean qna_personal_lock;
		private String qna_personal_answer;

		@Override
		public String toString() {
			return "PersonalQna [qna_personal_serial=" + qna_personal_serial + ", user_id=" + user_id + ", admin_name="
					+ admin_name + ", order_detail_order_serial=" + order_detail_order_serial + ", qna_personal_title="
					+ qna_personal_title + ", qna_personal_content=" + qna_personal_content + ", qna_personal_date="
					+ qna_personal_date + ", qna_personal_hit=" + qna_personal_hit + ", qna_personal_lock="
					+ qna_personal_lock + ", qna_personal_answer=" + qna_personal_answer + "]";
		}

	}
}
