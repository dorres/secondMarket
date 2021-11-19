package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data

public class WithdrawInfoVO {
	
	// mk_user_withdraw_info (for select, update)
		private int user_withdraw_serial;
		private String user_withdraw_reason;
		private String user_withdraw_reason_detail;
		private Date user_withdraw_date;
	
		//insert는 정적 처리

}
		

