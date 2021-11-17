package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminCouponVO {
	private String coupon_name; // ���� �̸�
	private String coupon_code; // ���� �ڵ�
	private int coupon_expiry; // ���� ������
	private int coupon_discount_price; // ���� ���� �ݾ�
	private int coupon_min_use; // ������� ���ѱݾ�
	private int coupon_max_bargain; // �������� ���ѱݾ� ( �ִ� ���� �ݾ� )
	private String coupon_note; // ���� ����(���)
}