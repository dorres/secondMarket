package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CouponVO {
	//mk_coupon_use
	private int coupon_use_serial;
	private String coupon_use_userid;
	private int coupon_use_coupon_serial;
	private int coupon_use_status;
	
	//mk_coupon
	private int coupon_serial;
	private String coupon_code;
	private String coupon_name;
	private int coupon_type;
	private int coupon_min;
	private int coupon_discount;
	private int coupon_max;
	private Date coupon_start;
	private Date coupon_end;
}
