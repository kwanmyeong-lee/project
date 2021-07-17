package com.it.lylj.boardFile.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardFileVO {
	private int boardFileNo;
	private int boardNo;
	private String fileName;
	private String originalFileName;
	private long fileSize;
}
