package first.market.kurlyty.admin.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminRecipeVO {
	private int recipe_serial;
	private String recipe_title;
	private String recipe_content;
	private Date recipe_date;
	private String recipe_image_main;
	private int recipe_hit;
	private String recipe_key_ingredients;

}
