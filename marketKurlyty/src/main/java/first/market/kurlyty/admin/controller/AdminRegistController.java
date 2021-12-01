package first.market.kurlyty.admin.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminRegistVO;
import first.market.kurlyty.admin.vo.AdminStockStockVO;
import first.market.kurlyty.admin.vo.AdminStockVO;

@Controller
public class AdminRegistController {
      
   @Autowired
   private AdminService adminService;
   
   //상품조회리스트
   @RequestMapping("getGoodsList.mdo")
   public String getGoodsList(AdminRegistVO regist, AdminStockVO stock, Model model) {
	  List<AdminRegistVO> list= adminService.goodsList();     
      for(AdminRegistVO vo : list) {
         if(vo.getGoods_detail_stock_quantity()<15) {
            model.addAttribute("notification",true);
            break;
         }
      }
      model.addAttribute("goodsList", list);
      return "registration/admin_goodsList";
   }
   
   //상품 수정
   @ResponseBody
   @RequestMapping("updateGoods.mdo")
   public String updateGoods(AdminStockStockVO stockstock) {
      int success = 0;
      adminService.updateGoods(stockstock);
      if(success != 0 ) {
         return "redirect:getGoodsList.mdo";
      }else {
         return "redirect:getGoodsList.mdo";
      }
   }
   
   //상품입고화면
   @RequestMapping("registration.mdo")
   public String registration(@RequestParam List<Integer> arrayParam, Model model) {

	  model.addAttribute("categoryList",adminService.getCategory3Names(arrayParam));

      return "registration/admin_registration";
   }
   //재고등록
   @RequestMapping("insertStock.mdo")
   public String insertStock(AdminStockVO stock, 
		   @RequestParam List<Integer> category_goods_serial,
		   @RequestParam List<Integer> goods_stock_receiving_quantity,
		   @RequestParam @DateTimeFormat(iso = ISO.DATE) List<Date> goods_stock_receiving_date,
		   @RequestParam @DateTimeFormat(iso = ISO.DATE) List<Date> goods_stock_exp_date) {
	   
	   int success = 0;
	   
	   for(int i=0; i<category_goods_serial.size(); i++) {
		   stock.setCategory_goods_serial(category_goods_serial.get(i));
		   stock.setGoods_stock_receiving_quantity(goods_stock_receiving_quantity.get(i));
		   stock.setGoods_stock_stock_quantity(goods_stock_receiving_quantity.get(i));
		   stock.setGoods_stock_receiving_date(goods_stock_receiving_date.get(i));
		   stock.setGoods_stock_exp_date(goods_stock_exp_date.get(i));
	       success = adminService.insertStock(stock);
	       adminService.updateStockQuantity(stock);

	   }
	  
      return "redirect:getGoodsList.mdo";
   }
   
	 //입고 조회
	 @RequestMapping("stockList.mdo")
	 public String goodsDetail(AdminStockVO stock, Model model) {
	    model.addAttribute("stock", adminService.getStockList(stock));
	    return "registration/admin_StockList";
	 }
   
   
   
   

//   
//   //상품등록 
//   @RequestMapping("insertGoods.mdo")
//   public String insertGoods(AdminRegistVO regist) {
//      int success = 0;
//      success = adminService.inserGoods(regist);
//      if(success != 0) {
//         return "redirect:goodsList.mdo";
//      }else {
//         return "redirect:registration.mdo";
//      }
//   }
   

   
//   //상품조회 재고 조회
//   @RequestMapping("getGoods.mdo")
//   public String getGoods(AdminRegistVO regist, Model model) {
//      model.addAttribute("goods", adminService.getGoods(regist));
//      return null;
//   }
  

 
//   //상품 삭제
//   @RequestMapping("deleteGoods.mdo")
//   public String deleteGoods(AdminRegistVO regist) {
//      int success = 0;
//      success = adminService.deleteGoods(regist);
//      if(success != 0) {
//         return "redirect:getGoodsList.mdo";
//      }else {
//         return "redirect:getGoodsList.mdo";
//      }
//   }
//   

//      
//   //입고 수정
//      @RequestMapping("updateStock.mdo")
//      public String updateStock(AdminStockVO stock) {
//         int success = 0;
//         success = adminService.updateStock(stock);
//         if(success != 0) {
//            return "redirect:getGoodsList.mdo";
//         }else {
//            return "redirect:stockList.mdo";
//         }
//      }
//      
////      //판매 등록
//       @RequestMapping("insertStock.mdo")
//       public String getStock(Model model, int serial){//@RequestParam(name="serial", required=false) String serial) {
////    		AdminStockVO stock = new AdminStockVO();
////          stock.setCategory_goods_serial(serial);
//    	   model.addAttribute("serial", serial);
//         return "registration/admin_registration";
//      }
//       

//       //리스트에 재고 출력
//       @RequestMapping("stockstock.mdo")
//       public String stockstock(AdminStockStockVO stockstock1, int stock, Model model) {
//          int success = 0;
//          success = adminService.stockstock(stockstock1);
//          model.addAttribute(stock);
//          if(success != 0) {
//             return "redirect:getGoodsList.mdo";
//          }else {
//             return "redirect:getGoodsList.mdo";
//          }
//       }
//       
//       
}
