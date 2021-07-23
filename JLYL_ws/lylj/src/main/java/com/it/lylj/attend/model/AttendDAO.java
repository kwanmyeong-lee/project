package com.it.lylj.attend.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendDAO {
	int updateLateAttendByEmpNo(int empNo);
}
