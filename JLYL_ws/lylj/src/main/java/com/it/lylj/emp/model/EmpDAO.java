package com.it.lylj.emp.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpDAO {
	int insertEmp(EmpVO vo);
	String selectPwd(int empNo);
	EmpVO selectByEmpNo(int empNo);
}
