package first.market.kurlyty.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminSales2VO;
import first.market.kurlyty.admin.vo.AdminSalesVO;
import net.sf.json.JSONArray;

@Controller
public class AdminSalesController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("sales.mdo")
		public String sales(AdminSalesVO sales,AdminSales2VO sales2, Model model) {
			//일별
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
		    day.add(Calendar.DATE , -7);
		    String startDate= date.format(day.getTime());
			sales.setStartdate(startDate);
			sales.setEnddate(date.format(new Date()));
			model.addAttribute("chartList",JSONArray.fromObject(adminService.getDate(sales)));
			//월별
			SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM");
			Calendar month = Calendar.getInstance();
		    month.add(Calendar.DATE, -3);
		    String startDate2= date2.format(month.getTime());
			sales2.setStartdate2(startDate2);
			sales2.setEnddate2(date2.format(new Date()));
			model.addAttribute("chartMonth",JSONArray.fromObject(adminService.getMonth(sales2)));
			return "sales-chart/sales";
	}
	
	
	
}
