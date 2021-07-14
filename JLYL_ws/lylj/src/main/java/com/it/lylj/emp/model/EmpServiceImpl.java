package com.it.lylj.emp.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService{
	private final EmpDAO empDao;

	@Override
	public int insertEmp(EmpVO vo) {
		return empDao.insertEmp(vo);
	}

	@Override
	public List<EmpVO> selectAllEmp() {
		return empDao.selectAllEmp();
	}
}
