package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminCouponVO {
	// ���� ����
	private int coupon_serial; // PK
	private String coupon_name; // ���� �̸�
	private String coupon_code; // ���� �ڵ�
	private int coupon_expiry; // ���� ������
	private int coupon_discount_price; // ���� ���� �ݾ�
	private int coupon_min_use; // ������� ���ѱݾ�
	private int coupon_max_bargain; // �������� ���ѱݾ� ( �ִ� ���� �ݾ� )
	private String coupon_note; // ���� ����(���)
	
	// ���� �߱�
	private int coupon_iss_serial; // PK
	private String coupon_iss_userid; // ID
	private String coupon_iss_name; // ���� �̸�
	private String coupon_iss_code; // ���� �ڵ�
	private String coupon_iss_ob; // ȹ����
	private String coupon_iss_ex; // �Ҹ���
	private int coupon_iss_use; // ��� ���� ( 0 = ����� / 1 = ����� / 2 = ����� �Ҹ�)
}