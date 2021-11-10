package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;

@Controller
public class AdminCategoryController {
	
	@Autowired
	private AdminService adminService;
	 
	//1차 카테고리 리스트
	@RequestMapping("admin_categoryFirstList.mdo")
	public String categoryFirstList() {
		return "category/admin_categoryFirstList";
	}
	//1차 카테고리 세부사항
	@RequestMapping("admin_categoryFirst.mdo")
	public String categoryFirst() {
		return "category/admin_categoryFirst";
	}
	//1차 카테고리 등록
	@RequestMapping("admin_categoryFirstWrite.mdo")
	public String categoryFirstWrite() {
		return "category/admin_categoryFirstWrite";
	}
	//-----------------------------------------------------
	//1차 카테고리 리스트
	@RequestMapping("admin_categorySecondList.mdo")
	public String categorySecondList() {
		return "category/admin_categorySecondList";
	}
	//1차 카테고리 세부사항
	@RequestMapping("admin_categorySecond.mdo")
	public String categorySecond() {
		return "category/admin_categorySecond";
	}
	//1차 카테고리 등록
	@RequestMapping("admin_categorySecondWrite.mdo")
	public String categorySecondWrite() {
		return "category/admin_categorySecondWrite";
	}
	//--------------------------------------------------------
	//1차 카테고리 리스트
	@RequestMapping("admin_categoryThirdList.mdo")
	public String categoryThirdList() {
		return "category/admin_categoryThirdList";
	}
	//1차 카테고리 세부사항
	@RequestMapping("admin_categoryThird.mdo")
	public String categoryThird() {
		return "category/admin_categoryThird";
	}
	//1차 카테고리 등록
	@RequestMapping("admin_categoryThirdWrite.mdo")
	public String categoryThirdWrite() {
		return "category/admin_categoryThirdWrite";
	}
}
