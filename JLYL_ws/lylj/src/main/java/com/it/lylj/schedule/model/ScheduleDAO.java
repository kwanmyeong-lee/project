package com.it.lylj.schedule.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {
	int insertSchedule(ScheduleVO vo);
	List<ScheduleVO> selectAllScheduleByEmpNo(int empNo);
	ScheduleVO selectScheduleByScheduleNo(int scheduleNo);
	List<ScheduleVO> selectAllScheduleByScFolderNo(int scheduleFolderNo);
	int deleteScheduleByScFolderNo(int scheduleFolderNo);
	int deleteScheduleByScheduleNo(int scheduleNo);
	int updateScheduleByScFolderNo(ScheduleVO vo);
	int selectMaxScNoByEmpNo(int empNo);
	
}
