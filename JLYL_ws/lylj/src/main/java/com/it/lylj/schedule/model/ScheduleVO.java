package com.it.lylj.schedule.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	private int scheduleNo;
	private String scheduleTitle;
	private String scheduleStart;
	private String scheduleEnd;
	private String scheduleAllday;
	private String scheduleColor;
	private int scheduleFolderNo;
	private int scheduleThemeNo;
	private int empNo;
	private int bookingTargetNo;
	private String scheduleContent;
	
}
