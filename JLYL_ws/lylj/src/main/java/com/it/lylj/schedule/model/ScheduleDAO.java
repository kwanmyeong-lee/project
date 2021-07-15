package com.it.lylj.schedule.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {
	int selectAllSchedule(ScheduleVO vo);
	List<ScheduleVO> listSchedule();
	
}
