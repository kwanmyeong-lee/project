package com.it.lylj.emp.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpDAO {
	int insertEmp(EmpVO vo);
	String selectPwd(int empNo);
	EmpVO selectByEmpNo(int empNo);
	List<EmpVO> selectAllEmp();
	Map<String, Object> selectstamp(String userNo);
}
