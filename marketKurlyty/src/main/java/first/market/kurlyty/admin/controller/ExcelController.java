package first.market.kurlyty.admin.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminShippingInfoVO;


@Controller
public class ExcelController {
	
	@Autowired
	private AdminService adminService;
	
    @RequestMapping("/excel/download")
    public void excelDown(HttpServletResponse response) throws IOException {
		
    	// �Խ��� �����ȸ
		//List<AdminShippingInfoVO> list = adminService.selectBoardList();

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
		cell.setCellValue("��ȣ");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("�̸�");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("����");

		// ������ �κ� ����
//		for (BoardVO vo : list) {
//			row = sheet.createRow(rowNo++);
//			cell = row.createCell(0);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getNum());
//			cell = row.createCell(1);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getName());
//			cell = row.createCell(2);
//			cell.setCellStyle(bodyStyle);
//			cell.setCellValue(vo.getTitle());
//		}

		// ������ Ÿ�԰� ���ϸ� ����
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xls");

		// ���� ���
		wb.write(response.getOutputStream());
		wb.close();
	}

}
