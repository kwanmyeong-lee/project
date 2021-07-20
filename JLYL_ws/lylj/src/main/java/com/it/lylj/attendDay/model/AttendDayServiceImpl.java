package com.it.lylj.attendDay.model;

import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendDayServiceImpl implements AttendDayService{
	private final AttendDayDAO dao;
	
	@Override
	public AttendDayVO selectAttendDayByRegdate(Date attendanceDayRegdate) {
		return dao.selectAttendDayByRegdate(attendanceDayRegdate);
	}
}
