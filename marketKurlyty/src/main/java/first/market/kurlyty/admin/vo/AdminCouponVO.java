package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminCouponVO {
	// 쿠폰 발행
	private int coupon_serial; // PK
	private String coupon_name; // 쿠폰 이름
	private String coupon_code; // 쿠폰 코드
	private int coupon_expiry; // 쿠폰 만료일
	private int coupon_discount_price; // 쿠폰 할인 금액
	private int coupon_min_use; // 쿠폰사용 제한금액
	private int coupon_max_bargain; // 쿠폰할인 제한금액 ( 최대 할인 금액 )
	private String coupon_note; // 쿠폰 설명(비고)
	
	// 쿠폰 발급
	private int coupon_iss_serial; // PK
	private String coupon_iss_userid; // ID
	private String coupon_iss_name; // 쿠폰 이름
	private String coupon_iss_code; // 쿠폰 코드
	private String coupon_iss_ob; // 획득일
	private String coupon_iss_ex; // 소멸일
	private int coupon_iss_use; // 사용 여부 ( 0 = 사용전 / 1 = 사용후 / 2 = 사용전 소멸)
}