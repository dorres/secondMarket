package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RecipeVO {
	private int recipe_serial;
	private String recipe_title;
	private String recipe_content;
	private Date recipe_date;
	private String recipe_image_main;
	private int recipe_hit;
	private String recipe_key_ingredients;
	
	//제품별 추천 제품
	private int category_goods_serial;
	private int sellCount;
}
