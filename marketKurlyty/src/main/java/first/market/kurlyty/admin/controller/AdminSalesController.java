package first.market.kurlyty.admin.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import first.market.kurlyty.admin.vo.AdminMemberChartVO;
import first.market.kurlyty.admin.vo.AdminSales2VO;
import first.market.kurlyty.admin.vo.AdminSalesVO;
import net.sf.json.JSONArray;

@Controller
public class AdminSalesController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("sales.mdo")
	public String sales(AdminSalesVO sales, AdminSales2VO sales2, Model model) {
		// �Ϻ�
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, -31);
		String startDate = date.format(day.getTime());
		sales.setStartdate(startDate);
		sales.setEnddate(date.format(new Date()));
		model.addAttribute("chartList", JSONArray.fromObject(adminService.getDate(sales)));
		// ����
		SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM");
		Calendar month = Calendar.getInstance();
		month.add(Calendar.DATE, -100);
		String startDate2 = date2.format(month.getTime());
		sales2.setStartdate2(startDate2);
		sales2.setEnddate2(date2.format(new Date()));
		model.addAttribute("chartMonth", JSONArray.fromObject(adminService.getMonth(sales2)));
		return "chart/sales";
	}

	// �Ϻ� ���� ����
	@RequestMapping("salesExel1.mdo")
	public void salesExel(HttpServletResponse response, AdminSalesVO sales) throws Exception {
		// �Խ��� �����ȸ
		List<AdminSalesVO> list = adminService.getDate(sales);
		System.out.println(sales.getStartdate());
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
		headStyle.setFillForegroundColor(HSSFColorPredefined.BLUE.getIndex());
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
		cell.setCellValue("��¥");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("����");

		// ������ �κ� ����
		for (AdminSalesVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getDaily_chart());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getSales_amount());
		}
		// ������ Ÿ�԰� ���ϸ� ����
		String filename = "�ϸ���.xls";
		FileOutputStream fileOut = null;
		response.setContentType("application/octet-stream;");
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + new String(filename.getBytes(), "UTF-8") + "\"");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		// excel ���� ����
		try {
			fileOut = new FileOutputStream("�ϸ���.xls");
			wb.write(response.getOutputStream());
			fileOut.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fileOut != null) {
				fileOut.close();
			}
		}
	}
	
	//ȸ����� ��Ʈ
	@RequestMapping("memberChart.mdo")
	public String memberchart(AdminMemberChartVO memch, Model model) {
		model.addAttribute("memch", JSONArray.fromObject(adminService.getMemChart(memch)));
		return "chart/member_chart";
	}
	
	// �Ϻ� ���� ����
	@RequestMapping("memchExel.mdo")
	public void salesExel(HttpServletResponse response, AdminMemberChartVO memch) throws Exception {
		// �Խ��� �����ȸ
		List<AdminMemberChartVO> list = adminService.getMemChart(memch);
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
		cell.setCellValue("���");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("�ѿ�");

		// ������ �κ� ����
		for (AdminMemberChartVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getMembership());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getCount());
		}
		// ������ Ÿ�԰� ���ϸ� ����
		String filename = "ȸ�����.xls";
		FileOutputStream fileOut = null;
		response.setContentType("application/octet-stream;");
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + new String(filename.getBytes(), "UTF-8") + "\"");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		// excel ���� ����
		try {
			fileOut = new FileOutputStream("ȸ�����.xls");
			wb.write(response.getOutputStream());
			fileOut.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fileOut != null) {
				fileOut.close();
			}
		}
	}
	
	
}
