package first.market.kurlyty.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String categoryMain(Model model, AdminCategoryMainVO cetogory1) {
		model.addAttribute("category",adminService.getCategory1(cetogory1));
		return "category/admin_categoryMain";
	} 
	
	//메인 카테고리 등록페이지
	@RequestMapping("admin_categoryMainWrite.mdo")
	public String categoryMainWrite() {
		return "category/admin_categoryMainWrite";
	}
	
	//메인 카테고리(update)
	@RequestMapping("admin_categoryMainUpdate.mdo")
	public String categoryMainUpdate(@RequestParam("iconImage") MultipartFile[] files,  AdminCategoryMainVO category1) {
		String awsPath ="https://kurlybuc.s3.ap-northeast-2.amazonaws.com/categoryMain/";
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		int success =0;
//		int result1 =0;
//		int result2 = 0;
//		category1.setCategory_main_icon_black(files[0].getOriginalFilename());
//		category1.setCategory_main_icon_color(files[1].getOriginalFilename());
//		result1 = adminService.getIconBlack(category1);
//		result2= adminService.getIconColor(category1);
//		
//		if(files[0].getOriginalFilename() !=null) {
//			if(result1 !=0) 
//				category1.setCategory_main_icon_black(awsPath + files[0].getOriginalFilename()+ "(" +result1 + ")" );
//			else
//				category1.setCategory_main_icon_color(awsPath + files[0].getOriginalFilename());
//		}else if(files[1].getOriginalFilename() !=null){
//			if(result2 !=0) 
//				category1.setCategory_main_icon_color(awsPath + files[1].getOriginalFilename() + "(" +result2 + ")" );
//			else
//				category1.setCategory_main_icon_color(awsPath + files[1].getOriginalFilename());
//		}
//		success = adminService.insertCategory1(category1);
//		//↑↑↑↑↑↑여기까지가 db작업
		
		
		
		
		return "category/admin_categoryMainList";
	}
	
	
	
	//메인 카테고리(insert)
	@RequestMapping("admin_categoryMainInsert.mdo")
	public String categoryMainInsert(@RequestParam("iconImage") MultipartFile[] files,  AdminCategoryMainVO category1) {
		int success =0;
		String key1 = "";
		String key2 = "";
		int key1Result = 0;
		int key2Result =0;
		boolean result = false;
		DecimalFormat df = new DecimalFormat("000");
		category1.setCategory_main_icon_black(files[0].getOriginalFilename());
		category1.setCategory_main_icon_color(files[1].getOriginalFilename());
		
		key1Result = adminService.getIconBlack(category1);
		if(key1Result !=0) 
			key1 = "categoryMain/" + files[0].getOriginalFilename() + "(" + key1Result + ")";
		else
			key1 = "categoryMain/" + files[0].getOriginalFilename();
		
		key2Result = adminService.getIconColor(category1);
		if(key2Result !=0) 
			key2 = "categoryMain/" + files[1].getOriginalFilename() + "(" + key2Result + ")";
		else
			key2 = "categoryMain/" + files[1].getOriginalFilename();
		
		category1.setCategory_main_icon_black("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key1);
		category1.setCategory_main_icon_color("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key2);
		category1.setCategory_main_serial("M" + df.format(adminService.getCategory1Column()+1));				
		success = adminService.insertCategory1(category1);
		//↑↑↑↑↑↑여기까지가 db작업
	
		if(success != 0) {//db가 성공적으로 들어가면 s3작업 실행
			try {
				//Icon_black s3업로드
				InputStream is = files[0].getInputStream();
				String contentType = files[0].getContentType(); 
				long contentLength = files[0].getSize();
				awsS3.upload(is, key1, contentType, contentLength);
				
				//Icon_color s3업로드
				is = files[1].getInputStream();
				contentType = files[1].getContentType(); 
				contentLength = files[1].getSize();
				awsS3.upload(is, key2, contentType, contentLength);

			}catch (IOException e) {e.printStackTrace();}
			
		}//end if
		return "redirect:admin_categoryMainList.mdo";
		
	}
	
	@RequestMapping("admin_categoryMainDelete.mdo")
	public String categoryMainDelete(AdminCategoryMainVO category1) {
		int success =0;
		
		// 1. db에서 삭제하고싶은 칼럼의 데이터를 가져온다.
		AdminCategoryMainVO mainVO = adminService.getCategory1(category1);
		
		// 2. 칼럼의 데이터에서 파일 경로를 deletePath에 담는다.
		String deletePath = mainVO.getCategory_main_icon_black().substring(49);
		awsS3.delete(deletePath);
		String deletePath1 = mainVO.getCategory_main_icon_color().substring(49);
		awsS3.delete(deletePath1);
		
		success =adminService.deleteCategory1(category1);
		if(success != 0) 
			return "redirect:admin_categoryMainList.mdo";
		else 
			return "redirect:admin_categoryMainList.mdo";
		//
		//
		//여기 수정해야함 success값으로 success을 활용안함 지금하기 너무 졸려ㅜㅜ
		// 에러페이지??
		//
		
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
