package com.it.lylj.emp.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpDAO {
	int insertEmp(EmpVO vo);
	List<EmpVO> selectAllEmp();
}
