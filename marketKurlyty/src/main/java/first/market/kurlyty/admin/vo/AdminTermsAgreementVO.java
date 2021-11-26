package first.market.kurlyty.admin.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class AdminTermsAgreementVO {
	private int terms_agreement_serial;
	private int terms_serial;
	private String terms_id;
	private boolean terms_agree_status;
	private Date terms_agree_date;
	private Date terms_agree_date_modified;
	private String terms_content;
}
