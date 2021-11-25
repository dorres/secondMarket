package first.market.kurlyty.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminSalesVO;
import net.sf.json.JSONArray;

@Controller
public class AdminSalesController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("sales.mdo")
		public String sales(AdminSalesVO sales, Model model) {
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Calendar week = Calendar.getInstance();
		    week.add(Calendar.DATE , -7);
		    String startDate= date.format(week.getTime());
			sales.setStartdate(startDate);
			sales.setEnddate(date.format(new Date()));
			model.addAttribute("chartList",JSONArray.fromObject(adminService.getDate(sales)));
			return "sales-chart/sales";
		}

}
