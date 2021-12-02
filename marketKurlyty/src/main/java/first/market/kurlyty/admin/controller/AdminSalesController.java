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
		// 일별
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, -31);
		String startDate = date.format(day.getTime());
		sales.setStartdate(startDate);
		sales.setEnddate(date.format(new Date()));
		model.addAttribute("chartList", JSONArray.fromObject(adminService.getDate(sales)));
		// 월별
		SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM");
		Calendar month = Calendar.getInstance();
		month.add(Calendar.DATE, -100);
		String startDate2 = date2.format(month.getTime());
		sales2.setStartdate2(startDate2);
		sales2.setEnddate2(date2.format(new Date()));
		model.addAttribute("chartMonth", JSONArray.fromObject(adminService.getMonth(sales2)));
		return "chart/sales";
	}

	// 일별 월별 엑셀
	@RequestMapping("salesExel1.mdo")
	public void salesExel(HttpServletResponse response, AdminSalesVO sales) throws Exception {
		// 게시판 목록조회
		List<AdminSalesVO> list = adminService.getDate(sales);
		System.out.println(sales.getStartdate());
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("일별매출");
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
		// 배경색
		headStyle.setFillForegroundColor(HSSFColorPredefined.BLUE.getIndex());
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
		cell.setCellValue("날짜");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("매출");

		// 데이터 부분 생성
		for (AdminSalesVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getDaily_chart());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getSales_amount());
		}
		// 컨텐츠 타입과 파일명 지정
		String filename = "일매출.xls";
		FileOutputStream fileOut = null;
		response.setContentType("application/octet-stream;");
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + new String(filename.getBytes(), "UTF-8") + "\"");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		// excel 파일 저장
		try {
			fileOut = new FileOutputStream("일매출.xls");
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
	
	//회원등급 차트
	@RequestMapping("memberChart.mdo")
	public String memberchart(AdminMemberChartVO memch, Model model) {
		model.addAttribute("memch", JSONArray.fromObject(adminService.getMemChart(memch)));
		return "chart/member_chart";
	}
	
	// 일별 월별 엑셀
	@RequestMapping("memchExel.mdo")
	public void salesExel(HttpServletResponse response, AdminMemberChartVO memch) throws Exception {
		// 게시판 목록조회
		List<AdminMemberChartVO> list = adminService.getMemChart(memch);
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("일별매출");
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
		// 배경색
		headStyle.setFillForegroundColor(HSSFColorPredefined.WHITE.getIndex());
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
		cell.setCellValue("등급");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("총원");

		// 데이터 부분 생성
		for (AdminMemberChartVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getMembership());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getCount());
		}
		// 컨텐츠 타입과 파일명 지정
		String filename = "회원등급.xls";
		FileOutputStream fileOut = null;
		response.setContentType("application/octet-stream;");
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + new String(filename.getBytes(), "UTF-8") + "\"");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		// excel 파일 저장
		try {
			fileOut = new FileOutputStream("회원등급.xls");
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
