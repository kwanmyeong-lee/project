package com.it.lylj.schedule.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	private int scno;
	private String title;
	private String startDate;
	private String endDate;
	private boolean allday;
}
