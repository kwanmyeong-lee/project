package com.it.lylj.common;

import java.util.ArrayList;
import java.util.List;

public class ExcelReadOption {
	private String filePath;
	private List<String> outputColumns;
	private int startRow;
	private int totalRow;
	private static int excelRowCnt;
	
	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public List<String> getOutPutColumns(){
		List<String> temp = new ArrayList<String>();
		temp.addAll(outputColumns);
		return temp;
	}
	
	public void setOutputColumns(List<String> outputColumns) {
		List<String> temp = new ArrayList<String>();
		temp.addAll(outputColumns);
		this.outputColumns = temp;
	}
	
	public void setOutputColumns(String ... outputColumns) {
		if(this.outputColumns == null) {
			this.outputColumns = new ArrayList<String>();
		}
		
		for(String outputColumn : outputColumns) {
			this.outputColumns.add(outputColumn);
		}
	}
	
	public int getStartRow() {
		return startRow;
	}
	
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
	public int getTotalRow() {
		return totalRow;
	}
	
	public static int getExcelRowCnt() {
		return ExcelReadOption.excelRowCnt;
	}
	
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	public static void setExcelRowCnt(int excelRowCnt) {
		ExcelReadOption.excelRowCnt = excelRowCnt;
	}
	
	
}
