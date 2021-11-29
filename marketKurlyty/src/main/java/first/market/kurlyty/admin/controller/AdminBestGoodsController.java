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
	
	//베스트 상품
	@RequestMapping("bestList.mdo")
	public String bestList(AdminBestGoodsVO best, Model model) {
		model.addAttribute("bestList", adminServie.bestList(best));
		return "admin_bestGoods";
	}
	
	//엑셀변환
	@RequestMapping("bestExel.mdo")
	public void salesExel(HttpServletResponse response,AdminBestGoodsVO best) throws Exception {
		// 게시판 목록조회
		List<AdminBestGoodsVO> list = adminServie.bestList(best);
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
		cell.setCellValue("상품명");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("판매횟수");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("총 판매금액");
	

		// 데이터 부분 생성
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
		// 컨텐츠 타입과 파일명 지정
		String filename = "판매상품.xls";
		FileOutputStream fileOut = null;
		 response.setContentType("application/octet-stream;");
		    response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(filename.getBytes(), "UTF-8") + "\"");
		    response.setHeader("Pragma", "no-cache;");
		    response.setHeader("Expires", "-1;");

		    // excel 파일 저장
		    try {
		        fileOut = new FileOutputStream("판매상풍.xls");
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
