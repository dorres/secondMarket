package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminFAQVO {
	private int rownum;
	private int faq_serial;
	private String faq_id;
	private String faq_title;
	private String faq_content;
	private String faq_date;
	private String faq_category;
}
