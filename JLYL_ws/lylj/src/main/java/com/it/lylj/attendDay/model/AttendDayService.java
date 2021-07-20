package com.it.lylj.attendDay.model;

import java.util.Date;

public interface AttendDayService {
	AttendDayVO selectAttendDayByRegdate(Date attendanceDayRegdate);
}
