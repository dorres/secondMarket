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
import first.market.kurlyty.admin.vo.AdminCategoryGoodsVO;
import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.admin.vo.AdminCategorySubVO;
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
	public String categoryMain(Model model, AdminCategoryMainVO cetogory1) {
		model.addAttribute("category",adminService.getCategory1(cetogory1));
		return "category/admin_categoryMain";
	} 
	
	//���� ī�װ� ���������
	@RequestMapping("admin_categoryMainWrite.mdo")
	public String categoryMainWrite() {
		return "category/admin_categoryMainWrite";
	}
	
	//���� ī�װ�(update)
	@RequestMapping("admin_categoryMainUpdate.mdo") //���� ī�װ� ���λ��׿��� �����ϴ°� ������
	public String categoryMainUpdate(@RequestParam("iconImage") MultipartFile[] files,  AdminCategoryMainVO category1) {
		int success =0;
		int result1 = 0; 
		int result2 = 0;
		AdminCategoryMainVO mainVO;
		String key1;
		String key2;
		String deleteKey1;
		String deleteKey2;
		String awsPath ="https://kurlybuc.s3.ap-northeast-2.amazonaws.com/categoryMain/";

		//s3������
		mainVO = adminService.getCategory1(category1);
		deleteKey1 = mainVO.getCategory_main_icon_black().substring(49);
		deleteKey2 = mainVO.getCategory_main_icon_color().substring(49);
		
		
		// db�۾� �� s3���� �� ���ε�
		result1 = adminService.getIconBlack(files[0].getOriginalFilename());
		result2 = adminService.getIconColor(files[1].getOriginalFilename());

		//icon_black �����ϰ� �������
		if(files[0].getSize() != 0) {
			//�����ϰ���� �̹����� ������ ������
			if(result1 !=0) {
				category1.setCategory_main_icon_black(awsPath + files[0].getOriginalFilename()+ "(" +result1 + ")" );
			//�����ϰ���� �̹����� ������ ������
			}else { 
				category1.setCategory_main_icon_black(awsPath + files[0].getOriginalFilename());
				awsS3.delete(deleteKey1);
			}
			try {
				key1 = "categoryMain/" + files[0].getOriginalFilename();
				InputStream is =files[0].getInputStream();
				String contentType = files[0].getContentType(); 
				long contentLength = files[0].getSize();
				awsS3.upload(is, key1, contentType, contentLength);
			}catch (IOException e) { e.printStackTrace();}

		}
		//icon_color �����ϰ� �������
		if(files[1].getSize() !=0){
			//�����ϰ� ���� �̹��ڰ� ������ ������
			if(result2 !=0) {
				category1.setCategory_main_icon_color(awsPath + files[1].getOriginalFilename() + "(" +result2 + ")" );
			//�����ϰ� ���� �̹����� ������ ������
			}else {
				category1.setCategory_main_icon_color(awsPath + files[1].getOriginalFilename());
				awsS3.delete(deleteKey2);
			}
			try {
				key2 = "categoryMain/" + files[1].getOriginalFilename();
				InputStream is =files[1].getInputStream();
				String contentType = files[1].getContentType(); 
				long contentLength = files[1].getSize();
				awsS3.upload(is, key2, contentType, contentLength);
				
			} catch (IOException e) { e.printStackTrace();}
		}
		success = adminService.updateCategory1(category1);		

		return "redirect:admin_categoryMainList.mdo";
	}
	
	
	//���� ī�װ�(insert)
	@RequestMapping("admin_categoryMainInsert.mdo")
	public String categoryMainInsert(@RequestParam("iconImage") MultipartFile[] files,  AdminCategoryMainVO category1) {
		String key1 = "";
		String key2 = "";
		int result1 = 0; 
		int result2 = 0;
		int success =0;
		DecimalFormat df;
		
		df = new DecimalFormat("000");
		result1 = adminService.getIconBlack(files[0].getOriginalFilename());
		result2 = adminService.getIconColor(files[1].getOriginalFilename());
		
		if(result1 !=0) 
			key1 = "categoryMain/" + files[0].getOriginalFilename() + "(" + result1 + ")";
		else
			key1 = "categoryMain/" + files[0].getOriginalFilename();
		
		if(result2 !=0) 
			key2 = "categoryMain/" + files[1].getOriginalFilename() + "(" + result2 + ")";
		else
			key2 = "categoryMain/" + files[1].getOriginalFilename();		

		category1.setCategory_main_icon_black("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key1);
		category1.setCategory_main_icon_color("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key2);
		
		category1.setCategory_main_serial("M" + df.format(adminService.getCategory1Column()+1));	
		success = adminService.insertCategory1(category1);
//		//������迩������� db�۾�	
		
		if(success != 0) {//db�� ���������� ���� s3�۾� ����
			try {
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

			}catch (IOException e) {e.printStackTrace();}
			
		}//end if
		return "redirect:admin_categoryMainList.mdo";

	}

	//============================================================================
	//ī�װ� ���� ����(delete)
	@RequestMapping("admin_categoryMainDelete.mdo")
	public String categoryMainDelete(AdminCategoryMainVO category1) {
		int success =0;
		
		// 1. db���� �����ϰ���� Į���� �����͸� �����´�.
		AdminCategoryMainVO mainVO = adminService.getCategory1(category1);
		
		// 2. Į���� �����Ϳ��� ���� ��θ� deletePath�� ��´�.
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
		//���� �����ؾ��� success������ success�� Ȱ����� �����ϱ� �ʹ� �����̤�
		// ����������??
		//
		
	}
	
	//-----------------------------------------------------
	//���� ī�װ� ����Ʈ
	@RequestMapping("admin_categorySubList.mdo")
	public String categorySubList(Model model) {
		model.addAttribute("category2",adminService.getCategory2List());
		return "category/admin_categorySubList";
	}
	
	//���� ī�װ� ���λ���
	@RequestMapping("admin_categorySub.mdo")
	public String categorySub(Model model, AdminCategorySubVO category2) {
		model.addAttribute("mainList",adminService.getCategory1List());
		model.addAttribute("category2", adminService.getCategory2(category2));
		return "category/admin_categorySub";
	}
	
	//���� ī�װ� ���������
	@RequestMapping("admin_categorySubWrite.mdo")
	public String categorySubWrite(Model model) {
		model.addAttribute("mainList",adminService.getCategory1List());
		return "category/admin_categorySubWrite";
	}
	//���� ī�װ� ���(insert)
	@RequestMapping("admin_categorySubInsert.mdo")
	public String categorySubWrite(AdminCategorySubVO category2) {
		DecimalFormat df;
		int success =0;
		
		df = new DecimalFormat("000");
		category2.setCategory_sub_serial("M" + df.format(adminService.getCategory2Column()+1));	
		success = adminService.insertCategory2(category2);
		
		if(success !=0) {
			return "redirect:admin_categorySubList.mdo";
		}else {
			return "redirect:admin_categorySubList.mdo";
		}
	}
	//���� ī�װ� ����(update)
	@RequestMapping("admin_categorySubUpdate.mdo")
	public String categorySubUpdate(AdminCategorySubVO category2) {
		int success =0;
		success = adminService.updateCategory2(category2);
		
		if(success !=0) {
			return "redirect:admin_categorySubList.mdo";
		}else {
			return "category/admin_categorySub";
		}
	}
	//���� ī�װ� ����(Delete)
	@RequestMapping("admin_categorySubDelete.mdo")
	public String categorySubDelete(AdminCategorySubVO category2) {
		int success =0;

		success =adminService.deleteCategory2(category2);
		if(success != 0) 
			return "redirect:admin_categorySubList.mdo";
		else 
			return "redirect:admin_categorySubList.mdo";
	}
	
	//=============================================================
	//��ǰ ī�װ� ����Ʈ
	@RequestMapping("admin_categoryGoodsList.mdo")
	public String categoryGoodsList(Model model) {
		model.addAttribute("category3",adminService.getCategory3List());
		return "category/admin_categoryGoodsList";
	}
	//��ǰ ī�װ� ���λ���
	@RequestMapping("admin_categoryGoods.mdo")
	public String categoryGoods() {
		return "category/admin_categoryGoods";
	}
	//��ǰ ī�װ� ���
	@RequestMapping("admin_categoryGoodsWrite.mdo")
	public String categoryGoodsWrite(Model model) {
		model.addAttribute("category1",adminService.getCategory1List());
//		UUID uuid = UUID.randomUUID();
//		 String uploadImageName = uuid.toString()+"_"+image.getOriginalFilename();
		return "category/admin_categoryGoodsWrite";
	}
	@RequestMapping("admin_getCategoryType.mdo")
	@ResponseBody
	public Object getCategoryType(AdminCategoryGoodsVO category3) {
	List<AdminCategoryGoodsVO> goodsList = 	adminService.getCategoryType(category3);
		return goodsList;
	}
}
