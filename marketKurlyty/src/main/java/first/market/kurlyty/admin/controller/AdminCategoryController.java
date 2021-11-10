package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;

@Controller
public class AdminCategoryController {
	
	@Autowired
	private AdminService adminService;
	 
	//1�� ī�װ� ����Ʈ
	@RequestMapping("admin_categoryFirstList.mdo")
	public String categoryFirstList() {
		return "category/admin_categoryFirstList";
	}
	//1�� ī�װ� ���λ���
	@RequestMapping("admin_categoryFirst.mdo")
	public String categoryFirst() {
		return "category/admin_categoryFirst";
	}
	//1�� ī�װ� ���
	@RequestMapping("admin_categoryFirstWrite.mdo")
	public String categoryFirstWrite() {
		return "category/admin_categoryFirstWrite";
	}
	//-----------------------------------------------------
	//1�� ī�װ� ����Ʈ
	@RequestMapping("admin_categorySecondList.mdo")
	public String categorySecondList() {
		return "category/admin_categorySecondList";
	}
	//1�� ī�װ� ���λ���
	@RequestMapping("admin_categorySecond.mdo")
	public String categorySecond() {
		return "category/admin_categorySecond";
	}
	//1�� ī�װ� ���
	@RequestMapping("admin_categorySecondWrite.mdo")
	public String categorySecondWrite() {
		return "category/admin_categorySecondWrite";
	}
	//--------------------------------------------------------
	//1�� ī�װ� ����Ʈ
	@RequestMapping("admin_categoryThirdList.mdo")
	public String categoryThirdList() {
		return "category/admin_categoryThirdList";
	}
	//1�� ī�װ� ���λ���
	@RequestMapping("admin_categoryThird.mdo")
	public String categoryThird() {
		return "category/admin_categoryThird";
	}
	//1�� ī�װ� ���
	@RequestMapping("admin_categoryThirdWrite.mdo")
	public String categoryThirdWrite() {
		return "category/admin_categoryThirdWrite";
	}
}
