package com.it.lylj.electronic.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ElectronicVo {

	private int electronicNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date electronicDate;
	private String electronicTitle;
	private String electronicContent;
	private String electronicFileFlag;
	private String electronicCompletFlag;
	private String electronicEmergencyFlag;
	private int empNo;
	private int styleNo;

}
