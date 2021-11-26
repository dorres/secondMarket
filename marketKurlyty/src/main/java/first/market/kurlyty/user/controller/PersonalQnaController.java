package first.market.kurlyty.user.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.s3.AwsS3;
import first.market.kurlyty.user.service.PersonalQnaService;
import first.market.kurlyty.user.vo.PersonalQnaVO;
import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.User_order_listVO;


@Controller
public class PersonalQnaController {
	@Autowired
	private PersonalQnaService personalqnaService;
	
	@Autowired
	private AwsS3 awsS3;
	
	//1:1���� �Խ���������
	@RequestMapping("/personalQnaBoard.do")
	public String getList(HttpServletRequest request, PersonalQnaVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setUser_id((String) session.getAttribute("userId"));
		List<PersonalQnaVO> boardList = personalqnaService.getPersonalQnaList(vo);
		if(boardList.size() > 0) {
			model.addAttribute("personalqnaboard", boardList);
		}
		return "customerCenter/personalQnaBoard";
	}
	
	//1:1���� ���� ������
	@GetMapping("/personalQnaWrite.do")
	public String getUser(HttpServletRequest request, UserVO vo, Model model,User_order_listVO lo) {
		HttpSession session = request.getSession();
		vo.setUser_id((String)session.getAttribute("userId"));
		model.addAttribute("UserData", personalqnaService.getUser(vo));
		model.addAttribute("order_merchant_serial",personalqnaService.getMerchantSerial(lo));
		
		return "customerCenter/personalQnaWrite";
	}
	@RequestMapping("/orderSearch.do")
	public String getOrderSearch(UserVO vo, Model model) {
		model.addAttribute("orderList", personalqnaService.getOrderSearch(vo));
		
		return "customerCenter/personalQna";
	}
	
	//1:1���� ���� �ۼ�(insert)
	@RequestMapping("/insertPersonalQna.do")
	public String insertPersonalQna(@RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2, PersonalQnaVO vo) {
		int success =0;
		UUID uuid;
		String key1 = null, key2 =null;
		String path = "https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		
		//�̹���1 ����Ұ��
		if(file1.getSize() !=0) {
			uuid=UUID.randomUUID();
			key1 = "personalQna/" + uuid.toString() +file1.getOriginalFilename();
			vo.setQna_personal_image1(path + key1);
		}
		//�̹���2 ��ϰ��
		if(file2.getSize() !=0) {
			uuid=UUID.randomUUID();
			key2 = "personalQna/" + uuid.toString() +file2.getOriginalFilename();
			vo.setQna_personal_image2(path+key2);
		}
		
		success = personalqnaService.insertPersonalQna(vo);
		
		if(success !=0) {
			try {
				//�̹���1 ����Ұ��
				InputStream is = file1.getInputStream();
				String contentType = file1.getContentType(); 
				long contentLength = file1.getSize();
				awsS3.upload(is, key1, contentType, contentLength);
				
				//�̹���2 ����Ұ��
				is = file2.getInputStream();
				contentType = file2.getContentType(); 
				contentLength = file2.getSize();
				awsS3.upload(is, key2, contentType, contentLength);
			}catch (IOException e) {e.printStackTrace();}
			return "redirect:personalQnaBoard.do";
		}else {
			return "customerCenter/personalQnaWrite";
		}
    
	}
	//1:1���� ���� ������
	 @GetMapping("/updatePersonalQna.do") 
	 public String updatePersonalQna(PersonalQnaVO vo, Model model) {
		 PersonalQnaVO getPersonalQna = personalqnaService.getPersonalQna(vo);
		 model.addAttribute("getPersonalQna", getPersonalQna);
		 
		 return "customerCenter/personalQnaWrite";
	 }
	 //1:1���� ����(update)
	 @PostMapping("/updatePersonalQna.do")
	 public String updatePostPersonalQna(@RequestParam("file1") MultipartFile file1,
				@RequestParam("file2") MultipartFile file2, PersonalQnaVO vo) {
		int success =0;
		String key1 = null, key2 =null;
		UUID uuid;
		String awsPath ="https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";
		 
		//S3�۾�
		//ù��° �̹��� �����������
		if(file1.getSize() != 0) {
			//���� ��ϵǾ��ִ� �̹����� ��θ� �ҷ��ͼ� S3�� �̹����� �����Ѵ�.
			if(personalqnaService.getPersonalQna(vo).getQna_personal_image1() !=null) {
				String deleteKey1 = personalqnaService.getPersonalQna(vo).getQna_personal_image1().substring(49);
				awsS3.delete(deleteKey1);
			}
			try {
				uuid = UUID.randomUUID();
				key1 = "personalQna/" +uuid + file1.getOriginalFilename();
				InputStream is = file1.getInputStream();
				String contentType = file1.getContentType(); 
				long contentLength = file1.getSize();
				awsS3.upload(is, key1, contentType, contentLength);
			}catch (IOException e) { e.printStackTrace();}
			//db�۾��� ���� �� 
			vo.setQna_personal_image1(awsPath+key1);
		}
		//�÷� �̹��� �����ϰ� �������
		if(file2.getSize() !=0){
			if(personalqnaService.getPersonalQna(vo).getQna_personal_image2() != null) {
				String deleteKey2 =  personalqnaService.getPersonalQna(vo).getQna_personal_image2().substring(49);
				awsS3.delete(deleteKey2);
			}
			try {
				uuid = UUID.randomUUID();
				key2 =  "personalQna/" +uuid + file2.getOriginalFilename();
				InputStream is = file2.getInputStream();
				String contentType = file2.getContentType(); 
				long contentLength = file2.getSize();
				awsS3.upload(is, key2, contentType, contentLength);
			} catch (IOException e) { e.printStackTrace();}
			//db�۾��� ���� �� 
			vo.setQna_personal_image2(awsPath+key2);
		}		 

		 success = personalqnaService.updatePersonalQna(vo);
		 if(success != 0) {
			 return "redirect:personalQnaBoard.do";
		 }else {
			 return "customerCenter/personalQnaWrite";
		 }
	 }
	
	//1:1���� ����(delete)
	@RequestMapping("/deletePersonalQna.do")
	public String deletePersonalQna(PersonalQnaVO vo) {
		
		// 1. db���� �����ϰ���� Į���� �����͸� �����´�.
		PersonalQnaVO personal = personalqnaService.getPersonalQna(vo);
		
		// 2. Į���� �����Ϳ��� ���� ��θ� deletePath�� ��´�.
		if(personal.getQna_personal_image1() != null) {
			String deletePath = personal.getQna_personal_image1().substring(49);
			awsS3.delete(deletePath);
		}
		if(personal.getQna_personal_image2() !=null) {
			String deletePath1 = personal.getQna_personal_image2().substring(49);
			awsS3.delete(deletePath1);
		}
		
		int success = 0;
		success = personalqnaService.deletePersonalQna(vo);
		if(success != 0) {
			return "redirect:personalQnaBoard.do";
		}else {
			return "customerCenter/personalQnaBoard";
		}
	}
}

