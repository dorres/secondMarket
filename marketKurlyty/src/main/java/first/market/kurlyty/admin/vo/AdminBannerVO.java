package first.market.kurlyty.admin.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminBannerVO {
	private int banner_serial;
	private String banner_title;
	private String banner_filepath;
	private String banner_contents;
	private MultipartFile uploadFile;
}
