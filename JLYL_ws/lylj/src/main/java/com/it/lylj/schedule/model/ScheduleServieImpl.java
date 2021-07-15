package com.it.lylj.schedule.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScheduleServieImpl implements ScheduleService{
	
	private final  ScheduleDAO dao;
	
	@Override
	public int selectAllSchedule(ScheduleVO vo) {
		return dao.selectAllSchedule(vo);
	}

	@Override
	public List<ScheduleVO> listSchedule() {
		return dao.listSchedule();
	}
	
}
