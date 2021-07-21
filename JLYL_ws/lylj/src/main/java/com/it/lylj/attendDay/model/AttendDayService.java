package com.it.lylj.attendDay.model;

import java.util.Date;

public interface AttendDayService {
	AttendDayVO selectAttendDayByRegdate(AttendDayVO vo);
	int insertAttendDay(AttendDayVO vo);
	int updateAttendDayByOffHour(AttendDayVO vo);
}
