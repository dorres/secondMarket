package first.market.kurlyty.user.vo;

import lombok.Data;

@Data
public class CartVO {
	private int goods_cart_serial;
	private int category_goods_serial;
	private int goods_cart_count;
	private boolean goods_cart_status;
	private String user_id;
}
