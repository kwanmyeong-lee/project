package com.it.lylj.attendDay.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface AttendDayService {
	AttendDayVO selectAttendDayByRegdate(AttendDayVO vo);
	int insertAttendDay(AttendDayVO vo);
	int updateAttendDayByOffHour(AttendDayVO vo);
	int selectSumWeekWork();
	int selectSumMonthWork();
	int selectSumWeekWorkEx();
	int selectSumMonthWorkEx();
	int selectSumWeekWorkByMonth(HashMap<String, Object> map);
	List<AttendDayVO> selectAttendMonth(HashMap<String, Object> map);

}
