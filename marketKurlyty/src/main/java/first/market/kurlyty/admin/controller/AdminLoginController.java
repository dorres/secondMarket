package first.market.kurlyty.admin.controller;

import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminBestGoodsVO;
import first.market.kurlyty.admin.vo.AdminOrderVO;
import first.market.kurlyty.admin.vo.AdminSales2VO;
import first.market.kurlyty.admin.vo.AdminSalesVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.admin.vo.GoodsQnaVO;
import first.market.kurlyty.user.controller.SecurityUtil;
import net.sf.json.JSONArray;

@Controller
@SessionAttributes("adminId")
public class AdminLoginController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 로그인페이지
	@RequestMapping("admin_login.mdo")
	public String adminlogin() {
		return "admin_login";
	}
	
	//관리자메인페이지
	@RequestMapping("admin_index.mdo")
		public String sales(AdminSalesVO sales, AdminSales2VO sales2, Model model, AdminBestGoodsVO best, 
				GoodsQnaVO gqna, AdminOrderVO order) {
			// 일별
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			day.add(Calendar.DATE, -30);
			String startDate = date.format(day.getTime());
			sales.setStartdate(startDate);
			sales.setEnddate(date.format(new Date()));
			model.addAttribute("chartList", JSONArray.fromObject(adminService.getDate(sales)));
			// 월별
			SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM");
			Calendar month = Calendar.getInstance();
			month.add(Calendar.DATE, -100);
			String startDate2 = date2.format(month.getTime());
			sales2.setStartdate2(startDate2);
			sales2.setEnddate2(date2.format(new Date()));
			model.addAttribute("chartMonth", JSONArray.fromObject(adminService.getMonth(sales2)));
			model.addAttribute("bestList", adminService.bestList(best));
			model.addAttribute("gqnaCount", adminService.gqnaCount(gqna));
			model.addAttribute("orderCount", adminService.orderCount(order));
		return "admin_index";
	}
	
	//관리자 로그인처리
	@RequestMapping("loginProc.mdo")
	public String adminJoin(AdminVO admin, Model model) {
		String securityPw = null;
		AdminVO adminInfo = adminService.loginGetUser(admin);
		String dbPw = adminInfo.getAdmin_pw();
		
		try {
			securityPw = SecurityUtil.sha256(admin.getAdmin_pw());
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		if(dbPw.equals(securityPw)) {
			model.addAttribute("adminId", admin.getAdmin_id());
			return "redirect:admin_index.mdo";
		}else {
			return "redirect:admin_login.mdo";
		}
	}
	
	//관리자 로그아웃처리
	@RequestMapping("logoutProc.mdo")
	public String logout(SessionStatus sessionStatus) {
		adminService.logout(sessionStatus);
		return "redirect:admin_login.mdo";
	}
	
	//1:1 문의사항 건수
	
}