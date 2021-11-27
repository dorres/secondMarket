package first.market.kurlyty.admin.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdminCouponVO {
	
	private int rownum;
	//mk_coupon
	//쿠폰pk
	private int coupon_serial;
	
	//쿠폰 코드
	private String coupon_code;
	
	//쿠폰 이름
	private String coupon_name;
	
	//쿠폰 타입(0:퍼센트 , 1:금액)
	private int coupon_type;
	
	//쿠폰 최소 사용 금액
	private int coupon_min;
	
	//쿠폰 할인율/금액
	private int coupon_discount;
	
	
	//쿠폰 최대 할인금액(%\일경우)
	private int coupon_max;
	
	//쿠폰 유효기간
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_end;
	
	//mk_coupon_use
	//쿠폰 상태 시리얼
	private int counpon_use_serial;
	
	//쿠푼을 가지고 있는 아이디
	private String coupon_use_userid;
	
	//쿠폰 종류 키값
	private int coupon_use_coupon_serial;
	
	//유저가 쿠폰을 사용했는지 안했느지 (0:사용못함-이미 사용한 쿠폰 1:사용가능 2:사용함-만료일이 지난 쿠폰)
	private int coupon_use_status;
	
	
}
