package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminRegistVO;

@Controller
public class AdminRegistController {
		
	@Autowired
	private AdminService adminService;
	
	//상품등록화면
	@RequestMapping("registration.mdo")
	public String registration() {
		return "registration/admin_registration";
	}
	
	//상품등록
	@RequestMapping("insertGoods.mdo")
	public String insertGoods(AdminRegistVO regist) {
		int success = 0;
		success = adminService.inserGoods(regist);
		if(success != 0) {
			return "redirect:goodsList.mdo";
		}else {
			return "redirect:registration.mdo";
		}
	}
	
	//상품조회
	@RequestMapping("getGoodsList.mdo")
	public String getGoods(AdminRegistVO regist, Model model) {
		model.addAttribute("goodsList", adminService.getGoods(regist));
		System.out.println(regist.getCategory_main_serial());
		return "registration/admin_goodsList";
	}
}
