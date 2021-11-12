package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board_noticeVO {
	private int notice_serial;
	private String notice_id;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_hit;
	
	@Override
	public String toString() {
		return "Board_noticeVO [notice_serial=" + notice_serial + ", notice_id=" + notice_id + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content + ", notice_date=" + notice_date + ", notice_hit="
				+ notice_hit + ", getNotice_serial()=" + getNotice_serial() + ", getNotice_id()=" + getNotice_id()
				+ ", getNotice_title()=" + getNotice_title() + ", getNotice_content()=" + getNotice_content()
				+ ", getNotice_date()=" + getNotice_date() + ", getNotice_hit()=" + getNotice_hit() + ", toString()="
				+ super.toString() + "]";
	}





	
	
	
	
}
