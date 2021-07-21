package com.it.lylj.attend.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendVO {
	private int attendanceNo; /* 근태 번호 */
	private int empNo; /* 사원 번호 */
	private int attendanceAnnualCount; /* 연차 갯수 */
	private int attendanceAnnualUse; /* 연차 사용일 */
	private int attendanceLateCount; /* 지각 일수 */
	private int attendanceRewardCount; /* 보상 휴가 일수 */
	private int attendanceRewardUse; 
}
