package first.market.kurlyty.user.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class faqVO {
	int faq_serial;
	String faq_id;
	String faq_title;
	String faq_content;
	Date faq_date;
	String faq_category;
}
