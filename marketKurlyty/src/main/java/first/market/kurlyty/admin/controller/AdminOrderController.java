package first.market.kurlyty.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
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
import first.market.kurlyty.admin.vo.AdminShippingInfoVO;

@Controller
public class AdminOrderController {

		@Autowired
		private AdminService adminService;
		
		//주문관리 결제완료 리스트
		@RequestMapping("admin_orderWaitList.mdo")
		public String orderWaitList(Model model) {
			model.addAttribute("orderWaitList",adminService.getOrderWaitList());
			return "order/admin_orderWaitList";
		}
		//주문관리 결제완료 세부사항
		@RequestMapping("admin_orderWait.mdo")
		public String orderWait(Model model, AdminOrderVO order) {
			model.addAttribute("orderWait",adminService.getOrderWait(order));
			model.addAttribute("orderWaitDetail", adminService.getOrderWaitDetail(order));
			model.addAttribute("shippingInfo",adminService.getShippingInfo(order));

			return "order/admin_orderWait";
		}
		//주문관리 결제완료(받는사람) 수정
		@ResponseBody
		@RequestMapping("admin_shippingInfoUpdate.mdo")
		public int shippingInfoUpdate(AdminShippingInfoVO shipping) {
			int success = 0;
			success =adminService.updateShippingInfo(shipping);
			return success;	
		}
		
		//주문관리 결제완료(배송준비중,배송중, 배송완료 상태 변경)Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate.mdo")
		public int orderWaitUpdate(AdminOrderVO order) {
			int success = 0;
			success =adminService.updateOrderWait(order);
			return success;
		}
		
		//주문관리 결제완료 ->배송중 선택한거 Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate1.mdo")
		public int orderWaitUpdate1(@RequestParam(value = "merchant[]") List<String> merchantList){
			int success = 0;
			success =adminService.updateOrderWait1(merchantList);
			return success;
		}
		
		//송장 출력
		@ResponseBody
		@RequestMapping("admin_excelDown.mdo")
		public int excelDown(@RequestParam(value = "merchant[]") List<String> merchantList,HttpServletResponse response){
			int result = 0;
			//체크한 주문번호를 통해서 받는사람 정보를 list 들고옴
			List<AdminShippingInfoVO> shippingList = adminService.getShippingInfoList(merchantList);
			
			try {
				// 워크북 생성
				Workbook wb = new HSSFWorkbook();
				Sheet sheet = wb.createSheet("게시판");
				Row row = null;
				Cell cell = null;
				int rowNo = 0;
				// 테이블 헤더용 스타일
				CellStyle headStyle = wb.createCellStyle();
				// 가는 경계선을 가집니다.
				headStyle.setBorderTop(BorderStyle.THIN);
				headStyle.setBorderBottom(BorderStyle.THIN);
				headStyle.setBorderLeft(BorderStyle.THIN);
				headStyle.setBorderRight(BorderStyle.THIN);
				
				// 배경색은 노란색입니다.
				headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
				headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
				
				// 데이터는 가운데 정렬합니다.
				headStyle.setAlignment(HorizontalAlignment.CENTER);
	
				// 데이터용 경계 스타일 테두리만 지정
				CellStyle bodyStyle = wb.createCellStyle();
				bodyStyle.setBorderTop(BorderStyle.THIN);
				bodyStyle.setBorderBottom(BorderStyle.THIN);
				bodyStyle.setBorderLeft(BorderStyle.THIN);
				bodyStyle.setBorderRight(BorderStyle.THIN);
				
				// 헤더 생성
				row = sheet.createRow(rowNo++);
				
				cell = row.createCell(0);
				cell.setCellStyle(headStyle);
				cell.setCellValue("이름");
				
				cell = row.createCell(1);
				cell.setCellStyle(headStyle);
				cell.setCellValue("번호");
				
				cell = row.createCell(2);
				cell.setCellStyle(headStyle);
				cell.setCellValue("주소");
				
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
				// 컨텐츠 타입과 파일명 지정
				response.setContentType("ms-vnd/excel");
				response.setHeader("Content-Disposition", "attachment;filename=송장.xls");
				LocalDate date = LocalDate.now();
				LocalTime time = LocalTime.now();
				
				File xlsFile = new File("D:/"+date+"."+time.getHour()+":"+time.getMinute()+".xls");
	            FileOutputStream fileOut = new FileOutputStream(xlsFile);
	            wb.write(fileOut);
	            //db작업
	           result = adminService.updateStatus(merchantList);
	            
				}catch (Exception e) {e.printStackTrace(); }
			return result;
		}
		
		//주문관리 배송과정 리스트
		@RequestMapping("admin_orderdeliveryList.mdo")
		public String orderDeliveryList(Model model) {
			model.addAttribute("orderList",adminService.getOrderDeliveryList());
			return "order/admin_orderDeliveryList";
		}

		
		//주문관리 구매완료 리스트
		@RequestMapping("admin_orderFinishList.mdo")
		public String orderFinishList(Model model) {
			model.addAttribute("orderList",adminService.getOrderFinishList());
			return "order/admin_orderFinishList";
		}		
		//주문관리 구매완료 세부사항
		//주문관리 구매완료 삭제
		//주문관리 구매완료 수정
}
