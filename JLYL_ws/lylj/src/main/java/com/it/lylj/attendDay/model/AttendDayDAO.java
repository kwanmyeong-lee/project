package com.it.lylj.attendDay.model;


import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendDayDAO {
	AttendDayVO selectAttendDayByRegdate(AttendDayVO vo);
	int insertAttendDay(AttendDayVO vo);
	int updateAttendDayByOffHour(AttendDayVO vo);
	int selectSumWeekWork();
	int selectSumMonthWork();
	int selectSumWeekWorkByMonth(HashMap<String, Object> map);
}
