package first.market.kurlyty.user.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		Integer rcount = reviewservice.reviewCount(user_id) == null ? 0:reviewservice.reviewCount(user_id);
		
		model.addAttribute("reviewAA", reviewservice.reviewAfterList(user_id));		
		model.addAttribute("review", reviewservice.reviewList(user_id));
		model.addAttribute("count", count);
		model.addAttribute("rcount", rcount);
		return "mykurly/review";
	}
	
	@GetMapping("/reviewWrite.do")
	public String reviewW(User_order_listVO vo, ReviewVO ro,Model model) {
		model.addAttribute("goods", reviewservice.reviewWrite(vo.getOrder_details_serial()));
		model.addAttribute("update", reviewservice.updateDate(ro));
		return "mykurly/reviewWrite";
	}
	
	@RequestMapping("reviewProc.do")
	public String reviewInsert(@RequestParam("image") MultipartFile file1,@RequestParam(value="review_serial1",required=false,defaultValue="0") Integer review_serial,HttpServletRequest request,ReviewVO vo,@RequestParam("category_goods_serial1") int category_goods_serial,@RequestParam("order_details_serial1")int order_details_serial) {
		int success =0;		
		String key1 = null;
		UUID uuid;		
		String path = "https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";				
		if(file1.getSize() !=0 && review_serial == 0) {
			uuid=UUID.randomUUID();
			key1 = "reviewImage/" + uuid.toString() +file1.getOriginalFilename();
			vo.setReview_image_main(path + key1);
			success=reviewservice.insertReview(vo);			
		}
		if(review_serial != 0) {
			reviewservice.updateReview(vo);		
		}
		if(success!=0) {
		try {		
			InputStream is = file1.getInputStream();
			String contentType = file1.getContentType(); 
			long contentLength = file1.getSize();
			awsS3.upload(is, key1, contentType, contentLength);	
		}catch (IOException e) {e.printStackTrace();}
		}		
		return "redirect:review.do";
		}
	@RequestMapping("/reviewDelete.do")
	@ResponseBody
	public int reviewDelete(ReviewVO vo,@RequestParam("review_serial2") int review_serial2) {
		
		int success = reviewservice.deleteReview(review_serial2);
		return success;
		
	}
}
