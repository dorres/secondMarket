package first.market.kurlyty.admin.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminOrderVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminShippingInfoVO;

@Controller
public class AdminOrderController {

		@Autowired
		private AdminService adminService;
		
		//林巩包府 搬力肯丰 府胶飘
		@RequestMapping("admin_orderWaitList.mdo")
		public String orderWaitList(Model model) {
			model.addAttribute("orderWaitList",adminService.getOrderWaitList());
			return "order/admin_orderWaitList";
		}
		//林巩包府 搬力肯丰 技何荤亲
		@RequestMapping("admin_orderWait.mdo")
		public String orderWait(Model model, AdminOrderVO order) {
			model.addAttribute("orderWait",adminService.getOrderWait(order));
			model.addAttribute("orderWaitDetail", adminService.getOrderWaitDetail(order));
			model.addAttribute("shippingInfo",adminService.getShippingInfo(order));

			return "order/admin_orderWait";
		}
		//林巩包府 搬力肯丰(罐绰荤恩) 荐沥
		@ResponseBody
		@RequestMapping("admin_shippingInfoUpdate.mdo")
		public int shippingInfoUpdate(AdminShippingInfoVO shipping) {
			int success = 0;
			success =adminService.updateShippingInfo(shipping);
			return success;	
		}
		
		//林巩包府 搬力肯丰(硅价霖厚吝,硅价吝, 硅价肯丰 惑怕 函版)Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate.mdo")
		public int orderWaitUpdate(AdminOrderVO order) {
			int success = 0;
			success =adminService.updateOrderWait(order);
			return success;
		}
		
		//林巩包府 搬力肯丰 ->硅价吝 急琶茄芭 Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate1.mdo")
		public int orderWaitUpdate1(@RequestParam(value = "merchant[]") List<String> merchantList){
			int success = 0;
			success =adminService.updateOrderWait1(merchantList);
			return success;
		}
		//林巩包府 搬力肯丰 ->硅价霖厚吝 急琶茄芭 Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate2.mdo")
		public int orderWaitUpdate2(@RequestParam(value = "merchant[]") List<String> merchantList){
			int success = 0;
			success = adminService.updateStatus(merchantList);
			return success;
		}
		
		//价厘 免仿
		@RequestMapping("admin_excelDown.mdo")
		public void excelDown(@RequestParam List<String> merchant,HttpServletResponse response) throws IOException{
			FileOutputStream fileOut= null;

//			眉农茄 林巩锅龋甫 烹秦辑 罐绰荤恩 沥焊甫 list 甸绊咳
			List<AdminShippingInfoVO> shippingList = adminService.getShippingInfoList(merchant);
			
			// 况农合 积己
			Workbook wb = new HSSFWorkbook();
			Sheet sheet = wb.createSheet("霸矫魄");
			Row row = null;
			Cell cell = null;
			int rowNo = 0;
			// 抛捞喉 庆歹侩 胶鸥老
			CellStyle headStyle = wb.createCellStyle();
			// 啊绰 版拌急阑 啊笼聪促.
			headStyle.setBorderTop(BorderStyle.THIN);
			headStyle.setBorderBottom(BorderStyle.THIN);
			headStyle.setBorderLeft(BorderStyle.THIN);
			headStyle.setBorderRight(BorderStyle.THIN);
			
			// 硅版祸篮 畴鄂祸涝聪促.
			headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
			headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			
			// 单捞磐绰 啊款单 沥纺钦聪促.
			headStyle.setAlignment(HorizontalAlignment.CENTER);
	
			// 单捞磐侩 版拌 胶鸥老 抛滴府父 瘤沥
			CellStyle bodyStyle = wb.createCellStyle();
			bodyStyle.setBorderTop(BorderStyle.THIN);
			bodyStyle.setBorderBottom(BorderStyle.THIN);
			bodyStyle.setBorderLeft(BorderStyle.THIN);
			bodyStyle.setBorderRight(BorderStyle.THIN);
			
			// 庆歹 积己
			row = sheet.createRow(rowNo++);
			
			cell = row.createCell(0);
			cell.setCellStyle(headStyle);
			cell.setCellValue("捞抚");
			
			cell = row.createCell(1);
			cell.setCellStyle(headStyle);
			cell.setCellValue("锅龋");
				
			cell = row.createCell(2);
			cell.setCellStyle(headStyle);
			cell.setCellValue("林家");
			
			for(AdminShippingInfoVO shipping : shippingList) {
				row = sheet.createRow(rowNo++);
				
				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(shipping.getShipping_recipient_name());
				
				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(shipping.getShipping_recipient_phone());
					
				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(shipping.getShipping_address1() + " " + shipping.getShipping_address2());
			}
		
			// 牧刨明 鸥涝苞 颇老疙 瘤沥
			response.setContentType("application/octet-stream;");
			response.setHeader("Content-Disposition", "attachment; filename=\"价厘.xls");
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");
	       
			// excel 颇老 历厘
	        try {
	            fileOut = new FileOutputStream("test.xls");
	            wb.write(response.getOutputStream());
	            fileOut.flush();
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if(fileOut != null) {
	                fileOut.close();
	            }
	        }
		}
		
		//林巩包府 硅价苞沥 府胶飘
		@RequestMapping("admin_orderdeliveryList.mdo")
		public String orderDeliveryList(Model model) {
			model.addAttribute("orderList",adminService.getOrderDeliveryList());
			return "order/admin_orderDeliveryList";
		}

		
		//林巩包府 备概肯丰 府胶飘
		@RequestMapping("admin_orderFinishList.mdo")
		public String orderFinishList(Model model) {
			model.addAttribute("orderList",adminService.getOrderFinishList());
			return "order/admin_orderFinishList";
		}	
//========================================================================		
		//券阂包府 府胶飘
		@RequestMapping("admin_orderRefundList.mdo")
		public String orderRefundList(Model model) {
			model.addAttribute("orderList",adminService.getOrderRefundList());
			return "order/admin_orderRefundList";
		}
		//巩狼俊辑 券阂夸没 贸府惑怕肺 函版
		@ResponseBody
		@RequestMapping("admin_orderRefundUpdate.mdo")
		public boolean orderRefundUpdate(AdminQnaVO qna){
			int success1 = 0;
			int success2 = 0;
			success1 =adminService.updateRefundWait(qna);
			success2 = adminService.updateQnaWait(qna);
			if(success1 !=0 && success2 !=0) {
				return true;
			}else {
				return false;
			}
		}
		
		
		//馆前包府 府胶飘
		@RequestMapping("admin_orderReturnList.mdo")
		public String orderReturnList(Model model) {
			model.addAttribute("orderList",adminService.getOrderReturnList());
			return "order/admin_orderReturnList";
		}
		@ResponseBody
		@RequestMapping("admin_orderReturnUpdate.mdo")
		public boolean orderReturnUpdate(AdminQnaVO qna){
			int success1 = 0;
			int success2 = 0;
			success1 = adminService.updateReturnWait(qna);
			success2 = adminService.updateQnaWait(qna);
			if(success1 !=0 && success2 !=0) {
				return true;
			}else {
				return false;
			}
		}
		
		//秒家包府 府胶飘
		@RequestMapping("admin_orderCancleList.mdo")
		public String orderCancleList(Model model) {
			model.addAttribute("orderList",adminService.getOrderCancleList());
			return "order/admin_orderCancleList";
		}
		@ResponseBody
		@RequestMapping("admin_orderCancleUpdate.mdo")
		public boolean orderCancleUpdate(AdminQnaVO qna){
			int success1 = 0;
			int success2 = 0;
			success1 =adminService.updateCancleWait(qna);
			success2 = adminService.updateQnaWait(qna);
			if(success1 !=0 && success2 !=0) {
				return true;
			}else {
				return false;
			}
			
		}
}
