package com.it.lylj.schedule.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScheduleServieImpl implements ScheduleService{
	
	private final  ScheduleDAO dao;
	
	@Override
	public int insertSchedule(ScheduleVO vo) {
		return dao.insertSchedule(vo);
	}

	@Override
	public List<ScheduleVO> selectAllScheduleByEmpNo(int empNo){
		return dao.selectAllScheduleByEmpNo(empNo);
	}

	@Override
	public List<ScheduleVO> selectAllScheduleByScFolderNo(int scheduleFolderNo) {
		return dao.selectAllScheduleByScFolderNo(scheduleFolderNo);
	}

	@Override
	public int deleteScheduleByScFolderNo(int scheduleFolderNo) {
		return dao.deleteScheduleByScFolderNo(scheduleFolderNo);
	}
	
}
