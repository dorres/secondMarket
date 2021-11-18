package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminGoodsStockVO;
import first.market.kurlyty.admin.vo.AdminRegistVO;
import first.market.kurlyty.admin.vo.AdminStockVO;

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
	
	//상품조회리스트
	@RequestMapping("getGoodsList.mdo")
	public String getGoodsList(AdminRegistVO regist, AdminStockVO stock, Model model) {
		model.addAttribute("goodsList", adminService.goodsList(regist));
		return "registration/admin_goodsList";
	}
	
	//상품조회
	@RequestMapping("getGoods.mdo")
	public String getGoods(AdminRegistVO regist, Model model) {
		model.addAttribute("goods", adminService.getGoods(regist));
		return null;
	}
	
	//상품 수정
	@RequestMapping(value="updateGoods.mdo", method = {RequestMethod.POST})
	public String updateGoods(int[] goods_detail_stock_notification,
			int[] goods_detail_promotion_serial,
			int[] goods_detail_status,
			int[] goods_detail_dicountrate,int index,int serial) {
		int success = 0;
		System.out.println(goods_detail_stock_notification[index]);
		System.out.println(goods_detail_promotion_serial[index]);
		System.out.println(goods_detail_status[index]);
		System.out.println(goods_detail_dicountrate[index]);
		AdminRegistVO regist = new AdminRegistVO();
		regist.setGoods_detail_serial(serial);
		regist.setGoods_detail_stock_notification(goods_detail_stock_notification[index]);
		regist.setGoods_detail_promotion_serial(goods_detail_promotion_serial[index]);
		regist.setGoods_detail_status(goods_detail_status[index]);
		regist.setGoods_detail_dicountrate(goods_detail_dicountrate[index]);
		success = adminService.updateGoods(regist);
		if(success != 0) {
			return "redirect:getGoodsList.mdo";
		}else {
			return "redirect:getGoodsList.mdo";
		}
	}
	
	//상품 삭제
	@RequestMapping("deleteGoods.mdo")
	public String deleteGoods(AdminRegistVO regist) {
		int success = 0;
		success = adminService.deleteGoods(regist);
		if(success != 0) {
			return "redirect:getGoodsList.mdo";
		}else {
			return "redirect:getGoodsList.mdo";
		}
	}
	
	//재고 조회
		@RequestMapping("goodsDetail.mdo")
		public String goodsDetail(AdminStockVO stock, Model model) {
			model.addAttribute("stock", adminService.getStock(stock));
			return "registration/admin_goodsDetails";
		}
		
	//입고 수정
		@RequestMapping("updateStock.mdo")
		public String updateStock(AdminStockVO stock) {
			int success = 0;
			success = adminService.updateStock(stock);
			if(success != 0) {
				return "redirect:getGoodsList.mdo";
			}else {
				return "redirect:goodsDetail.mdo";
			}
		}
		
		//판매 등록
		 @RequestMapping("insertGoods12.mdo")
		public String insertGoods12(AdminRegistVO regist, AdminStockVO stock) {
			int success12 = 0;
			success12 = adminService.insertGoods1(regist);
			success12 = adminService.insertGoods2(stock);
			if(success12 !=0) {
				return "redirect:getGoodsList.mdo";
			}else {
				return "redirect:registration.mdo";
			}
		}
		 
		 //재고 뷰
		 @RequestMapping("goodsStock.mdo")
		 public String goodsStock(AdminGoodsStockVO goodsstock, Model model) {
			 model.addAttribute("goodsstock", adminService.goodsStock(goodsstock));
			 return "registration/admin_registration";
		 }
}

