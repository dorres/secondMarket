package first.market.kurlyty.vo;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CategorySubVO {
	private String category_sub_serial;
	private String category_sub_name;
	private String category_sub_first_no;
}
