package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminNoticeVO {
	private int notice_serial;
	private int rownum;
	private String notice_id;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_hit;
}
