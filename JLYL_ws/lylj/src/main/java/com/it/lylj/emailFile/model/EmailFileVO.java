package com.it.lylj.emailFile.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailFileVO {
	private int fileNo;
	private int mailNo;
	private int fileCheckNo;
	private String fileName;
	private String fileOriginName;
	private long fileSize;
}
