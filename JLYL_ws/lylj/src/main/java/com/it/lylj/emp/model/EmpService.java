package com.it.lylj.emp.model;

import java.util.List;

public interface EmpService {
	int insertEmp(EmpVO vo);
	List<EmpVO> selectAllEmp();
}
