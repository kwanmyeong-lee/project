package com.it.lylj.attendDay.model;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendDayDAO {
	AttendDayVO selectAttendDayByRegdate(AttendDayVO vo);
	int insertAttendDay(AttendDayVO vo);
	int updateAttendDayByOffHour(AttendDayVO vo);
}
