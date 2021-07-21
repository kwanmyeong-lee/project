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

	@Override
	public int updateScheduleByScFolderNo(ScheduleVO vo) {
		return dao.updateScheduleByScFolderNo(vo);
	}

	@Override
	public ScheduleVO selectScheduleByScheduleNo(int scheduleNo) {
		return dao.selectScheduleByScheduleNo(scheduleNo);
	}

	@Override
	public int deleteScheduleByScheduleNo(int scheduleNo) {
		return dao.deleteScheduleByScheduleNo(scheduleNo);
	}

	@Override
	public int selectMaxScNoByEmpNo(int empNo) {
		return dao.selectMaxScNoByEmpNo(empNo);
	}

	@Override
	public List<ScheduleVO> selectAllScheduleByBTNo(int bookingTargetNo) {
		return dao.selectAllScheduleByBTNo(bookingTargetNo);
	}

	@Override
	public List<ScheduleVO> selectAllScheduleByScThemeNo(int scheduleThemeNo) {
		return dao.selectAllScheduleByScThemeNo(scheduleThemeNo);
	}
	
}
