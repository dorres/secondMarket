package first.market.kurlyty.admin.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminBestGoodsVO;

@Controller
public class AdminBestGoodsController {
	
	@Autowired
	private AdminService adminServie;
	
	//����Ʈ ��ǰ
	@RequestMapping("bestList.mdo")
	public String bestList(AdminBestGoodsVO best, Model model) {
		model.addAttribute("bestList", adminServie.bestList(best));
		return "admin_bestGoods";
	}
	
	//������ȯ
	@RequestMapping("bestExel.mdo")
	public void salesExel(HttpServletResponse response,AdminBestGoodsVO best) throws Exception {
		// �Խ��� �����ȸ
		List<AdminBestGoodsVO> list = adminServie.bestList(best);
		// ��ũ�� ����
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("�Ϻ�����");
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
		// ����
		headStyle.setFillForegroundColor(HSSFColorPredefined.WHITE.getIndex());
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
		cell.setCellValue("��ǰ��");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("�Ǹ�Ƚ��");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("�� �Ǹűݾ�");
	

		// ������ �κ� ����
		for (AdminBestGoodsVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getCategory_goods_name());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrder_goods_count());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getOrder_goods_price());
		}
		// ������ Ÿ�԰� ���ϸ� ����
		String filename = "�ǸŻ�ǰ.xls";
		FileOutputStream fileOut = null;
		 response.setContentType("application/octet-stream;");
		    response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(filename.getBytes(), "UTF-8") + "\"");
		    response.setHeader("Pragma", "no-cache;");
		    response.setHeader("Expires", "-1;");

		    // excel ���� ����
		    try {
		        fileOut = new FileOutputStream("�ǸŻ�ǳ.xls");
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
}
