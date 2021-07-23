package com.it.lylj.attend.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendServiceImpl implements AttendService{
	private final AttendDAO dao;
	
	@Override
	public int updateLateAttendByEmpNo(int empNo) {
		return dao.updateLateAttendByEmpNo(empNo);
	}

	@Override
	public AttendVO selectAttendByEmpNo(int empNo) {
		return dao.selectAttendByEmpNo(empNo);
	}

}
