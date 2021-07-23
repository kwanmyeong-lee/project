package com.it.lylj.email.model;

import java.sql.Timestamp;

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
	private Timestamp mailReaddate; 
	private Timestamp mailReserve;   
	private String mailDelCheck;     
	int mailEmpno;		    //EMPNO
	
}
