package first.market.kurlyty.user.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import first.market.kurlyty.s3.AwsS3;
import first.market.kurlyty.user.service.ReviewService;
import first.market.kurlyty.user.vo.ReviewVO;
import first.market.kurlyty.user.vo.User_order_listVO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewservice;
	@Autowired
	private AwsS3 awsS3;
		
	@RequestMapping("/review.do")
	public String review(HttpSession session, ReviewVO ro,User_order_listVO vo, Model model) {
		String user_id = (String)session.getAttribute("userId");
		Integer count = reviewservice.count(user_id) == null ? 0:reviewservice.count(user_id);
		
		model.addAttribute("reviewA", reviewservice.reviewAfter(ro));
		model.addAttribute("review", reviewservice.reviewList(user_id));
		model.addAttribute("count", count);
		return "mykurly/review";
	}
	
	@GetMapping("/reviewWrite.do")
	public String reviewW(User_order_listVO vo, ReviewVO ro,Model model) {
		model.addAttribute("goods", reviewservice.reviewWrite(vo.getOrder_details_serial()));
		model.addAttribute("update", reviewservice.updateDate(ro));
		return "mykurly/reviewWrite";
	}
	
	@RequestMapping("reviewProc.do")
	public String reviewInsert(@RequestParam("image") MultipartFile file1,@RequestParam("review_title") String review_title,ReviewVO vo) {
		
		int success =0;
		String key1 = null;
		UUID uuid;
		String path = "https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		System.out.println(file1);
		//썸네일 이미지 등록하는경우
		if(file1.getSize() !=0 && review_title!=null) {
			uuid=UUID.randomUUID();
			key1 = "reviewImage/" + uuid.toString() +file1.getOriginalFilename();
			System.out.println(key1);
			vo.setReview_image_main(path + key1);
			System.out.println(vo.getReview_image_main());
			success=reviewservice.insertReview(vo);
			System.out.println(success);
		}
		if(success!=0) {
		try {
			//썸네일 업로드
			InputStream is = file1.getInputStream();
			String contentType = file1.getContentType(); 
			long contentLength = file1.getSize();
			awsS3.upload(is, key1, contentType, contentLength);
			
			
		}catch (IOException e) {e.printStackTrace();}
		}
		
		return "mykurly/review";
	}

}
