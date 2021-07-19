package com.it.lylj.boTarget.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoTargetVO {
	private int bookingTargetNo; /* 예약 대상 번호 */
	private String bookingTargetName; /* 예약 대상 이름 */
	private int bookingFolderNo; /* 예약 폴더 번호 */
}
