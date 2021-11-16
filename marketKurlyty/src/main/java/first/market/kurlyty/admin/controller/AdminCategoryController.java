package first.market.kurlyty.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String categoryGoods(Model model,AdminCategoryGoodsVO category3) {
		model.addAttribute("goods", adminService.getCategory3(category3));
		return "category/admin_categoryGoods";
	}
	//��ǰ ī�װ� ���
	@RequestMapping("admin_categoryGoodsWrite.mdo")
	public String categoryGoodsWrite(Model model) {
		model.addAttribute("category1",adminService.getCategory1List());
		model.addAttribute("category2",adminService.getCategory2Name());
		return "category/admin_categoryGoodsWrite";
	}
	@RequestMapping(value = "admin_getCategoryType.mdo", method= {RequestMethod.GET, RequestMethod.POST},headers = {"Accept=text/xml, application/json"})
	@ResponseBody
	public List<AdminCategorySubVO> getCategoryType(AdminCategoryGoodsVO category3) {
		List<AdminCategorySubVO> goodsList = adminService.getCategoryType(category3);
		return goodsList;		
	}
	
	//��ǰ ī�װ� ���(Insert)
	@RequestMapping("admin_categoryGoodsInsert.mdo")
	public String categoryGoodsInsert(@RequestParam("goodsImage") MultipartFile[] files, AdminCategoryGoodsVO category3) {
		int success;
		String key1;
		String key2;
		String key3;
		UUID uuid;
		String path = "https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		
		uuid=UUID.randomUUID();
		key1 = "categoryGoods/" + uuid.toString() +files[0].getOriginalFilename();
		uuid=UUID.randomUUID();
		key2 = "categoryGoods/" + uuid.toString() +files[1].getOriginalFilename();
		uuid=UUID.randomUUID();
		key3 = "categoryGoods/" + uuid.toString() +files[2].getOriginalFilename();
			
		category3.setCategory_goods_image_thumb(path + key1);
		category3.setCategory_goods_image_detail_header(path + key2);
		category3.setCategory_goods_image_detail_main(path + key3);
		
		success = adminService.insertCategory3(category3);
		//������迩������� db�۾�	
		
		if(success != 0) {//db�� ���������� ���� s3�۾� ����
			try {
				//����� ���ε�
				InputStream is = files[0].getInputStream();
				String contentType = files[0].getContentType(); 
				long contentLength = files[0].getSize();
				awsS3.upload(is, key1, contentType, contentLength);
				
				//��ǰ ���� ���
				is = files[1].getInputStream();
				contentType = files[1].getContentType(); 
				contentLength = files[1].getSize();
				awsS3.upload(is, key2, contentType, contentLength);
				
				//��ǰ ���� ����
				is = files[2].getInputStream();
				contentType = files[2].getContentType(); 
				contentLength = files[2].getSize();
				awsS3.upload(is, key3, contentType, contentLength);


			}catch (IOException e) {e.printStackTrace();}
			
		}//end if
		return "redirect:admin_categoryGoodsList.mdo";
	}
	
	//��ǰ ��� ����(Delete)
	@RequestMapping("admin_categoryGoodsDelete.mdo")
	public String categoryGoodsDelete(AdminCategoryGoodsVO category3) {
		int success =0;

		// 1. db���� �����ϰ���� Į���� �����͸� �����´�.
		AdminCategoryGoodsVO goodsVO = adminService.getCategory3(category3);

		if(goodsVO.getCategory_goods_image_thumb() !="" ||goodsVO.getCategory_goods_image_thumb() != null) {
			awsS3.delete(goodsVO.getCategory_goods_image_thumb());
			
		}else if( goodsVO.getCategory_goods_image_detail_header() !="" || goodsVO.getCategory_goods_image_detail_header() != null) {
			awsS3.delete(goodsVO.getCategory_goods_image_detail_header());
			
		}else if(goodsVO.getCategory_goods_image_detail_main() != "" || goodsVO.getCategory_goods_image_detail_main() != null) {
			awsS3.delete(goodsVO.getCategory_goods_image_detail_main());
		}
		
		success =adminService.deleteCategory3(category3);
		if(success != 0) 
			return "redirect:admin_categoryGoodsList.mdo";
		else 
			return "redirect:admin_categoryGoodsList.mdo";
		//
		//
		//���� �����ؾ��� success������ success�� Ȱ����� �����ϱ� �ʹ� �����̤�
		// ����������??
		//	
	}
	
	//��ǰ ����(update)
	@RequestMapping("admin_categoryGoodsUpdate.mdo") //���� ī�װ� ���λ��׿��� �����ϴ°� ������
	public String categoryGoodsUpdate(@RequestParam("thumbImage") MultipartFile file1, @RequestParam("headerImage") MultipartFile file2,
			@RequestParam("mainImage") MultipartFile file3, AdminCategoryGoodsVO category3) {
		/*
		 * db�� ���� �۾��ϰ� s3 �۾��� �� ���ְ� �ڵ带 �� �����ؾ߰ڴ�.
		 * 
		 * */
		int success = 0;
		String key1 = null, key2 = null, key3 = null;
		String deleteKey1, deleteKey2, deleteKey3;
		UUID uuid;
		String awsPath ="https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		
		
		//S3�۾�
		//����� �̹��� �����ϰ� �������
		if(file1.getSize() != 0) {
			//���� ��ϵǾ��ִ� �̹����� ��θ� �ҷ��ͼ� S3�� �̹����� �����Ѵ�.
			deleteKey1 = adminService.getCategory3(category3).getCategory_goods_image_thumb().substring(49);
			awsS3.delete(deleteKey1);
			try {
				uuid = UUID.randomUUID();
				key1 = "categoryGoods/" +uuid + file1.getOriginalFilename();
				InputStream is = file1.getInputStream();
				String contentType = file1.getContentType(); 
				long contentLength = file1.getSize();
				awsS3.upload(is, key1, contentType, contentLength);
			}catch (IOException e) { e.printStackTrace();}
			//db�۾��� ���� �� 
			category3.setCategory_goods_image_thumb(awsPath+key1);
		}
		
		//��ǰ ���� ��� �̹��� �����ϰ� �������
		if(file2.getSize() !=0){
			deleteKey2 = adminService.getCategory3(category3).getCategory_goods_image_detail_header().substring(49);
			awsS3.delete(deleteKey2);
			try {
				uuid = UUID.randomUUID();
				key2 =  "categoryGoods/" +uuid + file2.getOriginalFilename();
				InputStream is = file2.getInputStream();
				String contentType = file2.getContentType(); 
				long contentLength = file2.getSize();
				awsS3.upload(is, key2, contentType, contentLength);
			} catch (IOException e) { e.printStackTrace();}
			//db�۾��� ���� �� 
			category3.setCategory_goods_image_detail_header(awsPath+key2);
		}
		
		//��ǰ ���� ���� �̹��� �����ϰ� �������
		if(file3.getSize() !=0){
			deleteKey3 = adminService.getCategory3(category3).getCategory_goods_image_detail_main().substring(49);
			awsS3.delete(deleteKey3);
			try {
				uuid = UUID.randomUUID();
				key3 = "categoryGoods/" +uuid + file3.getOriginalFilename();
				InputStream is = file3.getInputStream();
				String contentType = file3.getContentType(); 
				long contentLength = file3.getSize();
				awsS3.upload(is, key3, contentType, contentLength);
			} catch (IOException e) { e.printStackTrace();}
			//db�۾��� ���� �� 
			category3.setCategory_goods_image_detail_main(awsPath+key3);	
		}
		success = adminService.updateCategory3(category3);	

		if(success !=0) {
			return "redirect:admin_categoryGoodsList.mdo";
		}else {
			return "redirect:admin_categoryGoods.mdo";
		}
		
	}

	
	
	
}
