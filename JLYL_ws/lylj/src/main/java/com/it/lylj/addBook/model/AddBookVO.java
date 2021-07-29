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
	private String addressBookTel2;
	private String addressBookTel3;
	private String addressBookMaile;
	private String addressBookPosition;
	private String addressBookOfficeName;
	private String addressBookOfficeTel;
	private String addressBookOfficeTel2;
	private String addressBookOfficeTel3;
	private String addressBookGender;
	private int addressFolderNo;
}
