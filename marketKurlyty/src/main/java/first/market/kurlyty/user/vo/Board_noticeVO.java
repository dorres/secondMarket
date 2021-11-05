package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;


public class Board_noticeVO {
	private int notice_serial;
	private String notice_id;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_hit;
	
	
	public int getNotice_serial() {
		return notice_serial;
	}


	public void setNotice_serial(int notice_serial) {
		this.notice_serial = notice_serial;
	}


	public String getNotice_id() {
		return notice_id;
	}


	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}


	public Date getNotice_date() {
		return notice_date;
	}


	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}


	public int getNotice_hit() {
		return notice_hit;
	}


	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}


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
