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
	public String categoryMainUpdate(@RequestParam("iconImage1") MultipartFile file1,
			@RequestParam("iconImage2") MultipartFile file2,  AdminCategoryMainVO category1) {
		int success =0;
		String key1 = null, key2 =null;
		UUID uuid;
		String awsPath ="https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		
		//S3�۾�
		//���� �̹��� �����ϰ� �������
		if(file1.getSize() != 0) {
			//���� ��ϵǾ��ִ� �̹����� ��θ� �ҷ��ͼ� S3�� �̹����� �����Ѵ�.
			String deleteKey1 =  adminService.getCategory1(category1).getCategory_main_icon_black().substring(49);
			awsS3.delete(deleteKey1);
			try {
				uuid = UUID.randomUUID();
				key1 = "categoryMain/" +uuid + file1.getOriginalFilename();
				InputStream is = file1.getInputStream();
				String contentType = file1.getContentType(); 
				long contentLength = file1.getSize();
				awsS3.upload(is, key1, contentType, contentLength);
			}catch (IOException e) { e.printStackTrace();}
			//db�۾��� ���� �� 
			category1.setCategory_main_icon_black(awsPath+key1);
		}
		//�÷� �̹��� �����ϰ� �������
		if(file2.getSize() !=0){
			String deleteKey2 =  adminService.getCategory1(category1).getCategory_main_icon_color().substring(49);
			awsS3.delete(deleteKey2);
			try {
				uuid = UUID.randomUUID();
				key2 =  "categoryMain/" +uuid + file2.getOriginalFilename();
				InputStream is = file2.getInputStream();
				String contentType = file2.getContentType(); 
				long contentLength = file2.getSize();
				awsS3.upload(is, key2, contentType, contentLength);
			} catch (IOException e) { e.printStackTrace();}
			//db�۾��� ���� �� 
			category1.setCategory_main_icon_color(awsPath+key2);
		}
		success = adminService.updateCategory1(category1);		
		if(success !=0) {
			return "redirect:admin_categoryMainList.mdo";
		}else {
			return "redirect:admin_categoryMain.mdo";
		}
	}
	
	
	//���� ī�װ�(insert)
	@RequestMapping("admin_categoryMainInsert.mdo")
	public String categoryMainInsert(@RequestParam("iconImage1") MultipartFile file1,
			@RequestParam("iconImage2") MultipartFile file2, AdminCategoryMainVO category1) {	
		int success =0;
		int result =0;
		UUID uuid;
		String key1 = null, key2 =null;
		String path = "https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		DecimalFormat df;
		
		//�� �̹��� ����ϴ°��
		if(file1.getSize() !=0) {
			uuid=UUID.randomUUID();
			key1 = "categoryMain/" + uuid.toString() +file1.getOriginalFilename();
			category1.setCategory_main_icon_black(path + key1);
		}
		//�÷� �̹��� ����ϴ°��
		if(file2.getSize() !=0) {
			uuid=UUID.randomUUID();
			key2 = "categoryMain/" + uuid.toString() +file2.getOriginalFilename();
			category1.setCategory_main_icon_color(path+key2);
		}
		
		df = new DecimalFormat("000");
		result = Integer.parseInt(adminService.getCategory1Column().substring(1));
		category1.setCategory_main_serial("M" + df.format(result+1) );	
		success = adminService.insertCategory1(category1);

		//db�� ���������� ���� s3�۾� ����
		if(success != 0) {
			try {
				//Icon_black s3���ε�
				InputStream is = file1.getInputStream();
				String contentType = file1.getContentType(); 
				long contentLength = file1.getSize();
				awsS3.upload(is, key1, contentType, contentLength);
				
				//Icon_color s3���ε�
				is = file2.getInputStream();
				contentType = file2.getContentType(); 
				contentLength = file2.getSize();
				awsS3.upload(is, key2, contentType, contentLength);
			}catch (IOException e) {e.printStackTrace();}
			
		}//end if
		return "redirect:admin_categoryMainList.mdo";

	}

	//============================================================================
	//ī�װ� ���� ����(delete)
	@RequestMapping("admin_categoryMainDelete.mdo")
	public String categoryMainDelete(AdminCategoryMainVO category1) {
		
		// 1. db���� �����ϰ���� Į���� �����͸� �����´�.
		AdminCategoryMainVO mainVO = adminService.getCategory1(category1);
		
		// 2. Į���� �����Ϳ��� ���� ��θ� deletePath�� ��´�.
		String deletePath = mainVO.getCategory_main_icon_black().substring(49);
		awsS3.delete(deletePath);
		String deletePath1 = mainVO.getCategory_main_icon_color().substring(49);
		awsS3.delete(deletePath1);
		
		adminService.deleteCategory1(category1);
		return "redirect:admin_categoryMainList.mdo";
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
		int result;
		DecimalFormat df;
		
		df = new DecimalFormat("000");
		result = Integer.parseInt(adminService.getCategory2Column().substring(1));
		category2.setCategory_sub_serial("S" + df.format(result+1));	
		adminService.insertCategory2(category2);

		return "redirect:admin_categorySubList.mdo";
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
	public String categoryGoodsInsert(@RequestParam("goodsImage1") MultipartFile file1, @RequestParam("goodsImage2") MultipartFile file2,
			@RequestParam("goodsImage3") MultipartFile file3, AdminCategoryGoodsVO category3) {
		int result1, result2;
		String key1 = null, key2 = null, key3 = null;
		UUID uuid;
		String path = "https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		
		//����� �̹��� ����ϴ°��
		if(file1.getSize() !=0) {
			uuid=UUID.randomUUID();
			key1 = "categoryGoods/" + uuid.toString() +file1.getOriginalFilename();
			category3.setCategory_goods_image_thumb(path + key1);
		}
		//��� �̹��� ����ϴ°��
		if(file2.getSize() !=0) {
			uuid=UUID.randomUUID();
			key2 = "categoryGoods/" + uuid.toString() +file2.getOriginalFilename();
			category3.setCategory_goods_image_detail_header(path + key2);
		}
		//���� �̹��� ����ϴ°��
		if(file3.getSize() != 0) {
			uuid=UUID.randomUUID();
			key3 = "categoryGoods/" + uuid.toString() +file3.getOriginalFilename();
			category3.setCategory_goods_image_detail_main(path + key3);
		}
		
		//3�� ī�װ� ��ǰ ���(db�۾�)
		result1 = adminService.insertCategory3(category3);
		//3�� ī�װ� ��ǰ ������ ���(db�۾�)
		result2 = adminService.insertCategory3Detail(category3);
		
		//db�� ���������� ���� s3�۾� ����
		if(result1 != 0 && result2 != 0) {
			try {
				//����� ���ε�
				InputStream is = file1.getInputStream();
				String contentType = file1.getContentType(); 
				long contentLength = file1.getSize();
				awsS3.upload(is, key1, contentType, contentLength);
				
				//��ǰ ���� ���
				is = file2.getInputStream();
				contentType = file2.getContentType(); 
				contentLength = file2.getSize();
				awsS3.upload(is, key2, contentType, contentLength);
				
				//��ǰ ���� ����
				is = file3.getInputStream();
				contentType = file3.getContentType(); 
				contentLength = file3.getSize();
				awsS3.upload(is, key3, contentType, contentLength);
			}catch (IOException e) {e.printStackTrace();}
			
		}//end if
		return "redirect:admin_categoryGoodsList.mdo";
	}
	
	//��ǰ ����(Delete)
	@RequestMapping("admin_categoryGoodsDelete.mdo")
	public String categoryGoodsDelete(AdminCategoryGoodsVO category3) {
		// 1. db���� �����ϰ���� Į���� �����͸� �����´�.
		AdminCategoryGoodsVO goodsVO = adminService.getCategory3(category3);

		if(goodsVO.getCategory_goods_image_thumb() !="" ||goodsVO.getCategory_goods_image_thumb() != null) {
			awsS3.delete(goodsVO.getCategory_goods_image_thumb());
			
		}else if( goodsVO.getCategory_goods_image_detail_header() !="" || goodsVO.getCategory_goods_image_detail_header() != null) {
			awsS3.delete(goodsVO.getCategory_goods_image_detail_header());
			
		}else if(goodsVO.getCategory_goods_image_detail_main() != "" || goodsVO.getCategory_goods_image_detail_main() != null) {
			awsS3.delete(goodsVO.getCategory_goods_image_detail_main());
		}
		
		adminService.deleteCategory3(category3);
		return "redirect:admin_categoryGoodsList.mdo";

	}
	
	//��ǰ ����(update)
	@RequestMapping("admin_categoryGoodsUpdate.mdo") //���� ī�װ� ���λ��׿��� �����ϴ°� ������
	public String categoryGoodsUpdate(@RequestParam("thumbImage") MultipartFile file1, @RequestParam("headerImage") MultipartFile file2,
			@RequestParam("mainImage") MultipartFile file3, AdminCategoryGoodsVO category3) {

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
