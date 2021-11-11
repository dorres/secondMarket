package first.market.kurlyty.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.s3.AwsS3;

@Controller
public class AdminCategoryController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AwsS3 awsS3;
	 
	//메인 카테고리 리스트
	@RequestMapping("admin_categoryMainList.mdo")
	public String categoryMainList(Model model) {
		model.addAttribute("mainList",adminService.getCategory1List());
		return "category/admin_categoryMainList";
	}
	//메인 카테고리 세부사항
	@RequestMapping("admin_categoryMain.mdo")
	public String categoryMain() {
		return "category/admin_categoryMain";
	}
	//메인 카테고리 등록페이지
	@RequestMapping("admin_categoryMainWrite.mdo")
	public String categoryMainWrite() {
		return "category/admin_categoryMainWrite";
	}
	
	@RequestMapping("admin_categoryMainInsert.mdo")
	public String categoryMainInsert(@RequestParam("iconImage") MultipartFile[] files,  AdminCategoryMainVO category1) {
		int success =0;
		for(MultipartFile file: files) {
			try {
				String key = "categoryMain/"+file.getOriginalFilename();
				category1.setCategory_main_icon_black("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key);
				success = adminService.insertCategory1(category1);
				//여기 수정해야함(이렇게 하면 db에 업로드 2번중 1번만 성공해도 에러가 아님ㅜㅜ
				
				InputStream is = file.getInputStream();
				String contentType = file.getContentType(); 
				long contentLength = file.getSize();
				awsS3.upload(is, key, contentType, contentLength);
				
				
				}catch (IOException e) {e.printStackTrace();}
		}
		
		if(success !=0) 
			return "redirect:admin_categoryMainList.mdo";
		else
			return "redirect:admin_categoryMainWrite.mdo";
	}
	//-----------------------------------------------------
	//서브 카테고리 리스트
	@RequestMapping("admin_categorySubList.mdo")
	public String categorySubList() {
		return "category/admin_categorySubList";
	}
	//서브 카테고리 세부사항
	@RequestMapping("admin_categorySub.mdo")
	public String categorySub() {
		return "category/admin_categorySub";
	}
	//서브 카테고리 등록
	@RequestMapping("admin_categorySubWrite.mdo")
	public String categorySubWrite() {
		return "category/admin_categorySubWrite";
	}
	//--------------------------------------------------------
	//상품 카테고리 리스트
	@RequestMapping("admin_categoryGoodsList.mdo")
	public String categoryGoodsList() {
		return "category/admin_categoryGoodsList";
	}
	//상품 카테고리 세부사항
	@RequestMapping("admin_categoryGoods.mdo")
	public String categoryGoods() {
		return "category/admin_categoryGoods";
	}
	//상품 카테고리 등록
	@RequestMapping("admin_categoryGoodsWrite.mdo")
	public String categoryGoodsWrite() {
		return "category/admin_categoryGoodsWrite";
	}
}
