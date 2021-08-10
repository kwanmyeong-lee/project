package com.it.lylj.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.it.lylj.schedule.controller.ScheduleController;

public class ExcelUtil {
	/* 엑셀파일을 읽어 XLS, XLSX 확장자 확인후 Workbook으로 리턴 */
	private static final Logger logger
	=LoggerFactory.getLogger(ScheduleController.class);
	public static Workbook getWorkbook(String filePath) {
		FileInputStream fis = null;
		
		//파일 존재 여부 확인
		try {
			fis=new FileInputStream(filePath);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		Workbook workbook = null;
		
		//파일 확장자 확인
		if(filePath.toUpperCase().endsWith(".XLS")) {
			try {
				workbook = new HSSFWorkbook(fis);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(filePath.toUpperCase().endsWith(".XLSX")) {
			try {
				workbook = new XSSFWorkbook(fis);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return workbook;
	}
	
	
	/* Cell의 Column name 가져오기 */
	public static String getName(Cell cell, int cellIndex) {
		int cellNum = 0;
		if(cell !=null) {
			cellNum = cell.getColumnIndex();
		}
		else {
			cellNum = cellIndex;
		}
		
		return CellReference.convertNumToColString(cellNum);
	}
	
	/* Cell 타입 변환 */
	public static String getValue(Cell cell) {
		String value = "";
		
		if(cell == null) {
			value = "";
		}else {
			switch(cell.getCellType()) {
				case Cell.CELL_TYPE_FORMULA :
					value = cell.getCellFormula();
					break;
				case Cell.CELL_TYPE_NUMERIC :
					value = (int)cell.getNumericCellValue() +"";
					break;
				case Cell.CELL_TYPE_STRING :
					value = cell.getStringCellValue();
					break;
				case Cell.CELL_TYPE_BOOLEAN :
					value = cell.getBooleanCellValue() +"";
					break;
				case Cell.CELL_TYPE_ERROR :
					value = cell.getErrorCellValue() +"";
					break;
				case Cell.CELL_TYPE_BLANK :
					value = "";
					break;
				default :
					value =cell.getStringCellValue();
			}
		}
		
		return value;
	}
	
	/* 엑셀파일 내용 읽어오기  */
	public static List<Map<String, String>> excelRead(ExcelReadOption excelReadOption){
		//엑셀 파일을 읽어 들임
		Workbook wb = getWorkbook(excelReadOption.getFilePath());
		
		//엑셀 첫번째 시트 가지고옴
		Sheet sheet = wb.getSheetAt(0);
		//데이터가 있는 Sheet의 수 => wb.getNumberOfSheets()
		//Sheet의 이름 => wb.getSheetName(0);
		
		int numOfStartRows =2;
		int numOfLastRows = sheet.getPhysicalNumberOfRows();
		int numOfRows = 0;
		int numOfCells = 0;
		int numOfnotNull =0; // 널값은 뺀 행의 총 갯수
		
		if(excelReadOption.getStartRow()==-1) { //만약 첫행이 -1이면 모든 행을 리스트에 담음
			numOfRows = numOfLastRows;
		}else { // 아니라면 패이징 리스트
			numOfStartRows = excelReadOption.getStartRow();
			numOfRows = numOfStartRows+ConstUtil.RECORD_COUNT-1;
			
		}
		
		
		
		Row row = null;
		Cell cell = null;
		
		String cellName = "";
		
		//각 row마다의 값을 저장할 맵 객체. put("A","꼬깔콘") 여기서 A는 excel의 A번째 칼럼을 의미;
		Map<String,String> map = null;
		
		List<Map<String,String>> result = new ArrayList<Map<String,String>>();
		
		for(int rowIndex = numOfStartRows-1; rowIndex < numOfRows; rowIndex++) {
			//만약 현재행이 마지막행에 도달하면 탈출
			if(rowIndex==numOfLastRows) {
				break;
			}
			
			//해당 row를 가져 온다
			row = sheet.getRow(rowIndex);
			boolean nullcheck = false;
			if(row != null) {
				//가져온 row의 cell 갯수 구하기
				numOfCells = row.getLastCellNum();
				
				map = new HashMap<String,String>();
				
				for(int cellIndex = 0; cellIndex < numOfCells; cellIndex++) {
					//해당 cell 가져오기, 해당 cell 이름 가져오기
					cell = row.getCell(cellIndex);
					cellName = getName(cell, cellIndex);
					
					if(cellIndex ==0 || cellIndex==1) {
						if(getValue(cell)==null || getValue(cell).isEmpty()) {
							nullcheck=true;
							break;
						}
					}
					
					//만약 cell이 추출 대상 컬럼이 아니면 다음 for로 넘어감
					if(!excelReadOption.getOutPutColumns().contains(cellName)) {
						continue;
					}
					map.put(cellName,getValue(cell));
					
					
					logger.info("celName={}",getValue(cell));
				}
				
				if(nullcheck) {
					numOfRows++;
					continue;
				}
				//행 번호 추가
				map.put("rowNum", String.valueOf(rowIndex+1));
				result.add(map);
			}
		}
		
		//excel의 행의 총 갯수 셋팅
		excelReadOption.setTotalRow(numOfnotNull);
		return result;
	}
	
	/* 필수값이 필요한 칼럼에 값이 없을 경우를 뺀 행의 총 갯수 */
	public static void excelReadCnt(ExcelReadOption excelReadOption){
		Workbook wb = getWorkbook(excelReadOption.getFilePath());
		Sheet sheet = wb.getSheetAt(0);
		
		int numOfStartRows =2;
		int numOfLastRows = sheet.getPhysicalNumberOfRows();
		int numOfnotNull =0; // 널값은 뺀 행의 총 갯수
		
		Row row = null;
		Cell cell = null;
		
		boolean nullcheck = false;
		
		for(int rowIndex = numOfStartRows-1; rowIndex < numOfLastRows; rowIndex++) {
			
			row = sheet.getRow(rowIndex);
			
			if(row != null) {
				
				for(int cellIndex = 0; cellIndex < 2; cellIndex++) { // 널값이면 안되는 칼럼들만 조회
					cell = row.getCell(cellIndex);
					
					if(getValue(cell)==null || getValue(cell).isEmpty()) {
						nullcheck=true;
						break;
					}
					
				}
				
				if(nullcheck) {
					nullcheck=false;
					continue;
				}
				
				numOfnotNull++;
			}
		}
		
		//excel의 행의 총 갯수 셋팅
		ExcelReadOption.setExcelRowCnt(numOfnotNull);
	}
}
