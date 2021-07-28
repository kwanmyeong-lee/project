package com.it.lylj.schedule.model;

import java.util.HashMap;
import java.util.List;

public interface ScheduleService {
	
	int insertSchedule(ScheduleVO vo);
	List<ScheduleVO> selectAllScheduleByEmpNo(int empNo);
	List<ScheduleVO> selectAllScheduleByScFolderNo(int scheduleFolderNo);
	int deleteScheduleByScFolderNo(int scheduleFolderNo);
	int updateScheduleByScFolderNo(ScheduleVO vo);
	ScheduleVO selectScheduleByScheduleNo(int scheduleNo);
	int deleteScheduleByScheduleNo(int scheduleNo);
	int selectMaxScNoByEmpNo(int empNo);
	List<ScheduleVO> selectAllScheduleByBTNo(int bookingTargetNo);
	List<ScheduleVO> selectAllScheduleByScThemeNo(int scheduleThemeNo);
	int selectCntScheduleByToday(HashMap<String, Object> map);

}
