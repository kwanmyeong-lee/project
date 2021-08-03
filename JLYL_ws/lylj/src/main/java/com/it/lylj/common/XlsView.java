package com.it.lylj.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.it.lylj.attendDay.model.AttendDayService;
import com.it.lylj.index.Controller.IndexController;

import lombok.RequiredArgsConstructor;

@Component("XlsView")
@RequiredArgsConstructor
public class XlsView extends AbstractXlsView{
	private final AttendDayService attendDayService;
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/* 월별 근태 정보 엑셀 기본틀 */
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String str = (String)request.getAttribute("selectDate");
		logger.info("str={}",str);
		response.setHeader("Content-Disposition", "attachment; filename=\"sample.xls\""); 
		CellStyle numberCellStyle = workbook.createCellStyle(); 
		DataFormat numberDataFormat = workbook.createDataFormat(); 
		numberCellStyle.setDataFormat(numberDataFormat.getFormat("#,##0")); 
		Sheet sheet = workbook.createSheet("sample_sheet"); 
		Row row0 = sheet.createRow(0); 
		Cell cell0 = row0.createCell(0); 
		cell0.setCellValue("이름"); 
		Cell cell1 = row0.createCell(1); 
		cell1.setCellValue("부서명"); 
		Cell cell2 = row0.createCell(2); 
		cell2.setCellValue("날짜"); 
		Cell cell3 = row0.createCell(3); 
		cell3.setCellValue("출근"); 
		Cell cell4 = row0.createCell(4); 
		cell4.setCellValue("퇴근"); 
		
		
		
		Row row1 = sheet.createRow(1); 
		cell0 = row1.createCell(0); 
		cell0.setCellValue("2019-01-01"); 
		cell1 = row1.createCell(1); 
		cell1.setCellValue("s"); 
		cell2 = row1.createCell(2); 
		cell2.setCellType(CellType.NUMERIC); 
		cell2.setCellValue(1000000); 
		cell2.setCellStyle(numberCellStyle);

		
	}

}
