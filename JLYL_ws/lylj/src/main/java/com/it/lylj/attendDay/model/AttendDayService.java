package com.it.lylj.attendDay.model;

import java.util.Date;
import java.util.HashMap;

public interface AttendDayService {
	AttendDayVO selectAttendDayByRegdate(AttendDayVO vo);
	int insertAttendDay(AttendDayVO vo);
	int updateAttendDayByOffHour(AttendDayVO vo);
	int selectSumWeekWork();
	int selectSumMonthWork();
	int selectSumWeekWorkByMonth(HashMap<String, Object> map);

}
