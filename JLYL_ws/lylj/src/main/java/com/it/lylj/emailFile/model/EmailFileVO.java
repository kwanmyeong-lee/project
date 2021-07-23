package com.it.lylj.emailFile.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailFileVO {
	private int fileno;
	private int mailNo; // FK
	private String filename;
	private String fileoriginname;
	private long filesize;  
}
