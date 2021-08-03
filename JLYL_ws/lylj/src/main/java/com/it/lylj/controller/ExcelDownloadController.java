package com.it.lylj.controller;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.lylj.attendDay.model.AttendDayService;
import com.it.lylj.attendDay.model.ConditionViewVO;
import com.it.lylj.index.Controller.IndexController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/download")
@RequiredArgsConstructor
public class ExcelDownloadController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	private final AttendDayService attendDayService;

	/* 근태 정보 엑셀 다운 시 정보 변환*/
	@GetMapping(path="/stats", produces = "application/vnd.ms-excel")
	public void downloadExcel(@RequestParam String selectDate, HttpServletResponse response, Model model) throws Exception { 
		HashMap<String, Object> map = new HashMap<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
		map.put("selectDate", selectDate+"-01");
		List<ConditionViewVO> conditionViewVOList = attendDayService.selectAllConditionByMonth(map);
		logger.info("List={}",conditionViewVOList);
		HSSFWorkbook objWorkbook = new HSSFWorkbook();
		HSSFSheet objSheet =null;
		HSSFRow objRow=null;
		HSSFCell objCell=null;
		
		HSSFFont font = objWorkbook.createFont();
		font.setFontHeightInPoints((short)(9));
		font.setFontName("맑은고딕");
		
		
		HSSFCellStyle styleHd = objWorkbook.createCellStyle();
		HSSFCellStyle styleHd2 = objWorkbook.createCellStyle();
		styleHd.setFont(font);
		styleHd.setBorderBottom(BorderStyle.THIN);
		styleHd.setBorderTop(BorderStyle.THIN);
		styleHd.setBorderLeft(BorderStyle.THIN);
		styleHd.setBorderRight(BorderStyle.THIN);
		styleHd.setAlignment(HorizontalAlignment.CENTER);
		styleHd2.setFont(font);
		styleHd2.setBorderBottom(BorderStyle.THIN);
		styleHd2.setBorderTop(BorderStyle.THIN);
		styleHd2.setBorderLeft(BorderStyle.THIN);
		styleHd2.setBorderRight(BorderStyle.THIN);
		styleHd2.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		styleHd2.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		styleHd2.setAlignment(HorizontalAlignment.CENTER);
		objSheet = objWorkbook.createSheet("첫번째 시트");
		
		objRow = objSheet.createRow(0);
		objRow.setHeight((short)0x150);
		
		objCell = objRow.createCell(0);
		objCell.setCellValue("이름");
		objCell.setCellStyle(styleHd2);
		
		objCell = objRow.createCell(1);
		objCell.setCellValue("부서명");
		objCell.setCellStyle(styleHd2);
		
		objCell = objRow.createCell(2);
		objCell.setCellValue("날짜");
		objCell.setCellStyle(styleHd2);
		
		objCell = objRow.createCell(3);
		objCell.setCellValue("출근");
		objCell.setCellStyle(styleHd2);
		
		objCell = objRow.createCell(4);
		objCell.setCellValue("퇴근");
		objCell.setCellStyle(styleHd2);
		
		for(int i=0; i<conditionViewVOList.size(); i++) {
			objRow = objSheet.createRow(i+1);
			objRow.setHeight((short)0x150);
			
			objCell = objRow.createCell(0);
			objCell.setCellValue(conditionViewVOList.get(i).getEmpName());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(1);
			objCell.setCellValue(conditionViewVOList.get(i).getDepartmentName());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(2);
			objCell.setCellValue(sdf.format(conditionViewVOList.get(i).getAttendanceDayRegdate()));
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(3);
			objCell.setCellValue(sdf2.format(conditionViewVOList.get(i).getAttendanceDayOnHour()));
			objCell.setCellStyle(styleHd);
			
			if(conditionViewVOList.get(i).getAttendanceDayOffHour()==null) {
				
				objCell = objRow.createCell(4);
				objCell.setCellValue("");
				objCell.setCellStyle(styleHd);
			}else {
				objCell = objRow.createCell(4);
				objCell.setCellValue(sdf2.format(conditionViewVOList.get(i).getAttendanceDayOffHour()));
				objCell.setCellStyle(styleHd);
			}
		}
		objSheet.setColumnWidth(0, objSheet.getColumnWidth(0)+256);
		objSheet.setColumnWidth(1, objSheet.getColumnWidth(1)+1024);
		objSheet.setColumnWidth(2, objSheet.getColumnWidth(2)+1024);
		objSheet.setColumnWidth(3, objSheet.getColumnWidth(3)+1024);
		objSheet.setColumnWidth(4, objSheet.getColumnWidth(4)+1024);
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "ATTachment;FileName="+URLEncoder.encode("근태통계("+selectDate+")","UTF-8")+".xls");
		
		OutputStream fileOut = response.getOutputStream();
		objWorkbook.write(fileOut);
		fileOut.close();
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		
	}

}
