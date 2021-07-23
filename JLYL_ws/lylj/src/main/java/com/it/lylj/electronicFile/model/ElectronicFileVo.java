package com.it.lylj.electronicFile.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ElectronicFileVo {
	private int fileNo;
	private String fileName;
	private String fileOriginalname;
	private long fileSize;
	private int electronicNo;
}
