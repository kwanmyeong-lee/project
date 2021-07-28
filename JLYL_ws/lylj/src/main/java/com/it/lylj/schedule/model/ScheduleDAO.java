package com.it.lylj.schedule.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {
	int insertSchedule(ScheduleVO vo);
	List<ScheduleVO> selectAllScheduleByEmpNo(int empNo);
	List<ScheduleVO> selectAllScheduleByBTNo(int bookingTargetNo);
	ScheduleVO selectScheduleByScheduleNo(int scheduleNo);
	List<ScheduleVO> selectAllScheduleByScFolderNo(int scheduleFolderNo);
	List<ScheduleVO> selectAllScheduleByScThemeNo(int scheduleThemeNo);
	int deleteScheduleByScFolderNo(int scheduleFolderNo);
	int deleteScheduleByScheduleNo(int scheduleNo);
	int updateScheduleByScFolderNo(ScheduleVO vo);
	int selectMaxScNoByEmpNo(int empNo);
	int selectCntScheduleByToday(HashMap<String, Object> map);
	
}
