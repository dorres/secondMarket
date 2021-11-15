package first.market.kurlyty.vo;



import java.util.List;

import lombok.Data;

@Data
public class CategoryMainVO {
	private String category_main_serial;
	private String category_main_name;
	private String category_main_icon_black;
	private String category_main_icon_color;
	private List<CategorySubVO> data;
}
