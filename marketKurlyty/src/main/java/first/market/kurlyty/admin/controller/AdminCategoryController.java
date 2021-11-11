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
	 
	//���� ī�װ� ����Ʈ
	@RequestMapping("admin_categoryMainList.mdo")
	public String categoryMainList(Model model) {
		model.addAttribute("mainList",adminService.getCategory1List());
		return "category/admin_categoryMainList";
	}
	//���� ī�װ� ���λ���
	@RequestMapping("admin_categoryMain.mdo")
	public String categoryMain() {
		return "category/admin_categoryMain";
	}
	//���� ī�װ� ���������
	@RequestMapping("admin_categoryMainWrite.mdo")
	public String categoryMainWrite() {
		return "category/admin_categoryMainWrite";
	}
	//���� ī�װ� ���ó��
	@RequestMapping(value ="admin_categoryMainInsert.mdo" ,produces="html/text; charset=utf-8")
	@ResponseBody
	public String categoryMainInsert(@RequestParam("iconImage") MultipartFile[] files,  AdminCategoryMainVO category1) {
		int success =0;
		boolean result = false;
		DecimalFormat df = new DecimalFormat("000");
		
		String key1 = "categoryMain/" + files[0].getOriginalFilename();
		String key2 = "categoryMain/" + files[1].getOriginalFilename();
		
		category1.setCategory_main_icon_black("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key1);
		category1.setCategory_main_icon_color("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key2);
		category1.setCategory_main_serial("M" + df.format(adminService.getCategory1Column()+1));				
		
		List<AdminCategoryMainVO> MainList = adminService.getCategory1List();
		for(AdminCategoryMainVO main : MainList) {
			if(main.getCategory_main_icon_black().equals(category1.getCategory_main_icon_black()) ||
					main.getCategory_main_icon_color().equals(category1.getCategory_main_icon_color()) ) {
				result = false;
				break;
			}else
				result = true;
		}//end for
		
		if(result) {
			try {
				success = adminService.insertCategory1(category1);
		
				if(success !=0) {
					//Icon_black s3���ε�
					InputStream is = files[0].getInputStream();
					String contentType = files[0].getContentType(); 
					long contentLength = files[0].getSize();
					awsS3.upload(is, key1, contentType, contentLength);
					
					//Icon_color s3���ε�
					is = files[1].getInputStream();
					contentType = files[1].getContentType(); 
					contentLength = files[1].getSize();
					awsS3.upload(is, key2, contentType, contentLength);
				}
			}catch (IOException e) {e.printStackTrace();}
			if(success !=0) 
				return "redirect:admin_categoryMainList.mdo";
			else
				return "redirect:admin_categoryMainWrite.mdo";
			
		}else {
			 return "{\"message\":\"�ߺ��� �̹����� �ֽ��ϴ�.\",\"usedId\":\"�Ұ���\"}";
		}
	}
	
	@RequestMapping("admin_categoryMainDelete.mdo")
	public String categoryMainDelete(AdminCategoryMainVO category1) {
		int success =0;

		
		
		
		
		
		if(success !=0) 
			return "redirect:admin_categoryMainList.mdo";
		else
			return "redirect:admin_categoryMainWrite.mdo";
	}
	
	
	
	//-----------------------------------------------------
	//���� ī�װ� ����Ʈ
	@RequestMapping("admin_categorySubList.mdo")
	public String categorySubList() {
		return "category/admin_categorySubList";
	}
	//���� ī�װ� ���λ���
	@RequestMapping("admin_categorySub.mdo")
	public String categorySub() {
		return "category/admin_categorySub";
	}
	//���� ī�װ� ���
	@RequestMapping("admin_categorySubWrite.mdo")
	public String categorySubWrite() {
		return "category/admin_categorySubWrite";
	}
	//--------------------------------------------------------
	//��ǰ ī�װ� ����Ʈ
	@RequestMapping("admin_categoryGoodsList.mdo")
	public String categoryGoodsList() {
		return "category/admin_categoryGoodsList";
	}
	//��ǰ ī�װ� ���λ���
	@RequestMapping("admin_categoryGoods.mdo")
	public String categoryGoods() {
		return "category/admin_categoryGoods";
	}
	//��ǰ ī�װ� ���
	@RequestMapping("admin_categoryGoodsWrite.mdo")
	public String categoryGoodsWrite() {
		return "category/admin_categoryGoodsWrite";
	}
}
