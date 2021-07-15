package com.it.lylj.schedule.model;

import java.util.List;

public interface ScheduleService {
	
	int selectAllSchedule(ScheduleVO vo);
	List<ScheduleVO> listSchedule();
	
}
