package first.market.kurlyty.admin.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminBannerVO;

@Controller
public class AdminBannerController {

	@Autowired
	private AdminService adminService;
	
//	��� ��� ����Ʈ
//	@RequestMapping("admin_bannerList")
//	public String adminBannerList() {
//		return "admin_bannerList";
//	}
	
	
	//��� ��� ������
	@RequestMapping("admin_bannerWrite")
	public String adminBannerWrite() {
		return "admin_bannerWrite";
	}
	
	//��� ��� ó��
	@RequestMapping("admin_bannerInsert")
	public String adminBannerInsert(AdminBannerVO banner) throws IOException{
		MultipartFile uploadFile = banner.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/pmProject/" + fileName));
		}
		return "admin_bannerWrite.do";
	}
}
