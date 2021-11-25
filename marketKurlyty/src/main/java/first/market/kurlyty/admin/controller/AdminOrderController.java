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
		
		//�ֹ����� �����Ϸ� ����Ʈ
		@RequestMapping("admin_orderWaitList.mdo")
		public String orderWaitList(Model model) {
			model.addAttribute("orderWaitList",adminService.getOrderWaitList());
			return "order/admin_orderWaitList";
		}
		//�ֹ����� �����Ϸ� ���λ���
		@RequestMapping("admin_orderWait.mdo")
		public String orderWait(Model model, AdminOrderVO order) {
			model.addAttribute("orderWait",adminService.getOrderWait(order));
			model.addAttribute("orderWaitDetail", adminService.getOrderWaitDetail(order));
			model.addAttribute("shippingInfo",adminService.getShippingInfo(order));

			return "order/admin_orderWait";
		}
		//�ֹ����� �����Ϸ�(�޴»��) ����
		@ResponseBody
		@RequestMapping("admin_shippingInfoUpdate.mdo")
		public int shippingInfoUpdate(AdminShippingInfoVO shipping) {
			int success = 0;
			success =adminService.updateShippingInfo(shipping);
			return success;	
		}
		
		//�ֹ����� �����Ϸ�(����غ���,�����, ��ۿϷ� ���� ����)Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate.mdo")
		public int orderWaitUpdate(AdminOrderVO order) {
			int success = 0;
			success =adminService.updateOrderWait(order);
			return success;
		}
		
		//�ֹ����� �����Ϸ� ->����� �����Ѱ� Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate1.mdo")
		public int orderWaitUpdate1(@RequestParam(value = "merchant[]") List<String> merchantList){
			int success = 0;
			success =adminService.updateOrderWait1(merchantList);
			return success;
		}
		
		//���� ���
		@ResponseBody
		@RequestMapping("admin_excelDown.mdo")
		public int excelDown(@RequestParam(value = "merchant[]") List<String> merchantList,HttpServletResponse response){
			int result = 0;
			//üũ�� �ֹ���ȣ�� ���ؼ� �޴»�� ������ list ����
			List<AdminShippingInfoVO> shippingList = adminService.getShippingInfoList(merchantList);
			
			try {
				// ��ũ�� ����
				Workbook wb = new HSSFWorkbook();
				Sheet sheet = wb.createSheet("�Խ���");
				Row row = null;
				Cell cell = null;
				int rowNo = 0;
				// ���̺� ����� ��Ÿ��
				CellStyle headStyle = wb.createCellStyle();
				// ���� ��輱�� �����ϴ�.
				headStyle.setBorderTop(BorderStyle.THIN);
				headStyle.setBorderBottom(BorderStyle.THIN);
				headStyle.setBorderLeft(BorderStyle.THIN);
				headStyle.setBorderRight(BorderStyle.THIN);
				
				// ������ ������Դϴ�.
				headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
				headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
				
				// �����ʹ� ��� �����մϴ�.
				headStyle.setAlignment(HorizontalAlignment.CENTER);
	
				// �����Ϳ� ��� ��Ÿ�� �׵θ��� ����
				CellStyle bodyStyle = wb.createCellStyle();
				bodyStyle.setBorderTop(BorderStyle.THIN);
				bodyStyle.setBorderBottom(BorderStyle.THIN);
				bodyStyle.setBorderLeft(BorderStyle.THIN);
				bodyStyle.setBorderRight(BorderStyle.THIN);
				
				// ��� ����
				row = sheet.createRow(rowNo++);
				
				cell = row.createCell(0);
				cell.setCellStyle(headStyle);
				cell.setCellValue("�̸�");
				
				cell = row.createCell(1);
				cell.setCellStyle(headStyle);
				cell.setCellValue("��ȣ");
				
				cell = row.createCell(2);
				cell.setCellStyle(headStyle);
				cell.setCellValue("�ּ�");
				
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
				// ������ Ÿ�԰� ���ϸ� ����
				response.setContentType("ms-vnd/excel");
				response.setHeader("Content-Disposition", "attachment;filename=����.xls");
				LocalDate date = LocalDate.now();
				LocalTime time = LocalTime.now();
				
				File xlsFile = new File("D:/"+date+"."+time.getHour()+":"+time.getMinute()+".xls");
	            FileOutputStream fileOut = new FileOutputStream(xlsFile);
	            wb.write(fileOut);
	            //db�۾�
	           result = adminService.updateStatus(merchantList);
	            
				}catch (Exception e) {e.printStackTrace(); }
			return result;
		}
		
		//�ֹ����� ��۰��� ����Ʈ
		@RequestMapping("admin_orderdeliveryList.mdo")
		public String orderDeliveryList(Model model) {
			model.addAttribute("orderList",adminService.getOrderDeliveryList());
			return "order/admin_orderDeliveryList";
		}

		
		//�ֹ����� ���ſϷ� ����Ʈ
		@RequestMapping("admin_orderFinishList.mdo")
		public String orderFinishList(Model model) {
			model.addAttribute("orderList",adminService.getOrderFinishList());
			return "order/admin_orderFinishList";
		}		
		//�ֹ����� ���ſϷ� ���λ���
		//�ֹ����� ���ſϷ� ����
		//�ֹ����� ���ſϷ� ����
}
