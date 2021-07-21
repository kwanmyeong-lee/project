package com.it.lylj.attendDay.model;

import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendDayServiceImpl implements AttendDayService{
	private final AttendDayDAO dao;


	@Override
	public AttendDayVO selectAttendDayByRegdate(AttendDayVO vo) {
		return dao.selectAttendDayByRegdate(vo);
	}


	@Override
	public int insertAttendDay(AttendDayVO vo) {
		return dao.insertAttendDay(vo);
	}


	@Override
	public int updateAttendDayByOffHour(AttendDayVO vo) {
		return dao.updateAttendDayByOffHour(vo);
	}
}
