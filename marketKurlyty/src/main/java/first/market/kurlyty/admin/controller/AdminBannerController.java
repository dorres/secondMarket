package first.market.kurlyty.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.s3.AwsS3;

@Controller
public class AdminBannerController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AwsS3 awsS3;
	
	//배너 리스트
	@RequestMapping("admin_bannerList.mdo")
	public String adminBannerList(Model model) {
		model.addAttribute("bannerList", adminService.getBannerList());
		return "banner/admin_bannerList";
	}
	
	//배너 세부사항
	@RequestMapping("admin_banner.mdo")
	public String adminBanner( Model model, AdminBannerVO banner) {
		model.addAttribute("banner", adminService.getBanner(banner));
		return "banner/admin_banner";
	}
	
	//배너 세부사항 수정
	@RequestMapping("admin_bannerUpdate.mdo")
	public String adminBannerUpdate(MultipartFile uploadFile, AdminBannerVO banner) {
		
		if(uploadFile.getSize()!=0) {
			//교체하고싶은 이미지가 있을경우 0이 아니므로 s3에있는 이미지를 삭제한다.
			AdminBannerVO bannerVO = adminService.getBanner(banner);
			String deleteKey =bannerVO.getBanner_filepath().substring(49);
			awsS3.delete(deleteKey);
			
			//새로운 이미지를 s3에 등록
			try {
				String key = "banner/"+uploadFile.getOriginalFilename();
				InputStream is =uploadFile.getInputStream();
				String contentType = uploadFile.getContentType(); 
				long contentLength = uploadFile.getSize();
				awsS3.upload(is, key, contentType, contentLength);
				
				System.out.println("성공");
		
				banner.setBanner_filepath("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key);
			} catch (IOException e) { e.printStackTrace();}
			
			//교체하고 싶은 이미지가 있을경우 S3에 이미지를 먼저 지우고 새로운 이미즈를 등록한후에
			//새로운 이미지 경로를 포함해서 db에 저장한다.
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
	//관리자 -배너(delete)
	@RequestMapping("admin_bannerDelete.mdo")
	public String adminBannerDelete(AdminBannerVO banner) {
		boolean result = false;
		int success =0;
		
		// 1. db에서 삭제하고싶은 칼럼의 데이터를 가져온다.
		AdminBannerVO bannerVO = adminService.getBanner(banner);
		
		// 2. 칼럼의 데이터에서 파일 경로를 deletePath에 담는다.
		String deletePath = bannerVO.getBanner_filepath();
		
		// 3. deletePath에 있는 데이터와 db에있는 모든 Banner_filepath와 비교해서 일치하는게 있다면 해당 칼럼만 삭제
		List<AdminBannerVO> bannerList =  adminService.getBannerList();
		for(AdminBannerVO bann : bannerList) {
			System.out.println("bann : " + bann.getBanner_filepath());
			System.out.println("deletepath : " + deletePath);
			
			if (bann.getBanner_filepath().equals(deletePath)) {
				success = adminService.deleteBanner(banner);
				result = true;
				break;
			}
		}
		if(!result) {
			String deleteKey =bannerVO.getBanner_filepath().substring(49);
			awsS3.delete(deleteKey);
			
			
			success = adminService.deleteBanner(banner);
			if(success != 0) 
				return "redirect:admin_bannerList.mdo";
			else 
				return "redirect:admin_banner.mdo";
		}else{
			if(success != 0) 
				return "redirect:admin_bannerList.mdo";
			else 
				return "redirect:admin_banner.mdo";
		}//end if
	}//end adminBannerDelete
	
	
	
	
	//배너 등록 페이지
	@RequestMapping("admin_bannerWrite.mdo")
	public String adminBannerWrite() {
		return "banner/admin_bannerWrite";
	}
	
	//배너 등록 처리
	@RequestMapping("admin_bannerInsert.mdo")
	public String adminBannerInsert(MultipartFile uploadFile,  AdminBannerVO banner) {
		
		try {
			String key = "banner/"+uploadFile.getOriginalFilename();
			InputStream is = uploadFile.getInputStream();
			String contentType = uploadFile.getContentType(); 
			long contentLength = uploadFile.getSize();
			awsS3.upload(is, key, contentType, contentLength);
			
			banner.setBanner_filepath("https://kurlybuc.s3.ap-northeast-2.amazonaws.com/"+key);
			adminService.insertBanner(banner);
			
		} catch (IOException e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:admin_bannerList.mdo";
	}
}
