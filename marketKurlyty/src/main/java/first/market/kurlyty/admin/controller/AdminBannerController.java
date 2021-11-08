package first.market.kurlyty.admin.controller;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.s3.AwsS3;

@Controller
public class AdminBannerController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AwsS3 awsS3;
	
	//��� ����Ʈ
	@RequestMapping("admin_bannerList.mdo")
	public String adminBannerList(Model model) {
		model.addAttribute("bannerList", adminService.getBannerList());
		return "admin_bannerList";
	}
	
	//��� ���λ���
	@RequestMapping("admin_banner.mdo")
	public String adminBanner( Model model, AdminBannerVO banner) {
		model.addAttribute("banner", adminService.getBanner(banner));
		return "admin_banner";
	}
	
	//��� ���λ��� ����
	@RequestMapping("admin_bannerUpdate.mdo")
	public String adminBannerUpdate(MultipartFile uploadFile, AdminBannerVO banner) {
		
		if(uploadFile.getSize()!=0) {
			//��ü�ϰ���� �̹����� ������� 0�� �ƴϹǷ� s3���ִ� �̹����� �����Ѵ�.
			AdminBannerVO bannerVO = adminService.getBanner(banner);
			String deleteKey =bannerVO.getBanner_filepath().substring(49);
			awsS3.delete(deleteKey);
			
			//���ο� �̹����� s3�� ���
			try {
				String key = "banner/"+uploadFile.getOriginalFilename();
				InputStream is =uploadFile.getInputStream();
				String contentType = uploadFile.getContentType(); 
				long contentLength = uploadFile.getSize();
				awsS3.upload(is, key, contentType, contentLength);
				
				System.out.println("����");
		
				banner.setBanner_filepath("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key);
			} catch (IOException e) { e.printStackTrace();}
			
			//��ü�ϰ� ���� �̹����� ������� S3�� �̹����� ���� ����� ���ο� �̹�� ������Ŀ�
			//���ο� �̹��� ��θ� �����ؼ� db�� �����Ѵ�.
			int success = 0;
			success = adminService.updateBanner1(banner);
			if(success != 0) 
				return "redirect:admin_bannerList.mdo";
			else 
				return "redirect:admin_banner.mdo";

		}else {
			int success = 0;
			success = adminService.updateBanner2(banner);
			if(success != 0) 
				return "redirect:admin_bannerList.mdo";
			else 
				return "redirect:admin_banner.mdo";
		}//end if

	}
	//������ -���(delete)
	@RequestMapping("admin_bannerDelete.mdo")
	public String adminBannerDelete(AdminBannerVO banner) {
		//��ü�ϰ���� �̹����� ������� 0�� �ƴϹǷ� s3���ִ� �̹����� �����Ѵ�.
		AdminBannerVO bannerVO = adminService.getBanner(banner);
		String deleteKey =bannerVO.getBanner_filepath().substring(49);
		awsS3.delete(deleteKey);
		
		int success =0;
		success = adminService.deleteBanner(banner);
		if(success != 0) 
			return "redirect:admin_bannerList.mdo";
		else 
			return "redirect:admin_banner.mdo";
	}
	
	
	
	
	//��� ��� ������
	@RequestMapping("admin_bannerWrite.mdo")
	public String adminBannerWrite() {
		return "admin_bannerWrite";
	}
	
	//��� ��� ó��
	@RequestMapping("admin_bannerInsert.mdo")
	public String adminBannerInsert(MultipartFile uploadFile,  AdminBannerVO banner) {
		
		try {
			String key = "banner/"+uploadFile.getOriginalFilename();
			InputStream is = uploadFile.getInputStream();
			String contentType = uploadFile.getContentType(); 
			long contentLength = uploadFile.getSize();
			awsS3.upload(is, key, contentType, contentLength);
			
			System.out.println("����");
			
			banner.setBanner_filepath("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key);
			adminService.insertBanner(banner);
			
		} catch (IOException e) {
			System.out.println("����");
			e.printStackTrace();
		}
		return "redirect:admin_bannerList.mdo";
	}
}
