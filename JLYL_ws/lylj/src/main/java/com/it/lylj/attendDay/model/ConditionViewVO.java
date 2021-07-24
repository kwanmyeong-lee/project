package com.it.lylj.attendDay.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ConditionViewVO {
	private String empName;
	private String departmentName;
	private int departmentNo;
	private String positionName;
	private int attendanceDayNo;
	private int empNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date attendanceDayOnHour; /* 출근 시간 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date attendanceDayOffHour; /* 퇴근 시간 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date attendanceDayWorkHour;/* 근무 시간 */
	private String attendanceDayHolidayFlag;/* 휴일 여부 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date attendanceDayRegdate;
	private long excessTimeDay;
	private long normalTimeDay;
	private long workTimeDay;
}