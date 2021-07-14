package com.it.lylj.emp.model;

public interface EmpService {
	//로그인처리 상수
	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;
	
	int insertEmp(EmpVO vo);
	public int loginProc(int empNo, String empPwd);
	EmpVO selectByEmpNo(int empNo);
}
