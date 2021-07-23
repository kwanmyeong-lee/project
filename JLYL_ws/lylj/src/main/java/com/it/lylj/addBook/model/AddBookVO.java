package com.it.lylj.addBook.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddBookVO {
	private int addressBookNo;
	private int empNo;
	private String addressBookName;
	private String addressBookTel;
	private String addressBookMaile;
	private String addressBookPosition;
	private int addressFolderNo;
}
