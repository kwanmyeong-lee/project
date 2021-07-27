package com.it.lylj.email.model;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailVO {
	private int mailNo; 			
	private String mailTitle;		
	private String mailContent;     
	private String mailSend;         //EMPNO		 
	private String mailTake;
	private Timestamp mailSenddate;
	private String mailTempsave;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp mailReaddate; 
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private	Date mailReserve;
	private String mailDelCheck;     
	int mailEmpno;		    //EMPNO
	private String empName;
	private String mailImportant;
}
