package com.it.lylj.electronicAppLine.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ElectronicAppLineVo {

	private int approvalLineNo;
	private int electronicNo;
	private int empNo;
	private String approvalLineCompleteFlag;
	private int approvalLineOrder;
}
