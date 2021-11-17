package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminCouponVO {
	private String coupon_name; // 쿠폰 이름
	private String coupon_code; // 쿠폰 코드
	private int coupon_expiry; // 쿠폰 만료일
	private int coupon_discount_price; // 쿠폰 할인 금액
	private int coupon_min_use; // 쿠폰사용 제한금액
	private int coupon_max_bargain; // 쿠폰할인 제한금액 ( 최대 할인 금액 )
	private String coupon_note; // 쿠폰 설명(비고)
}