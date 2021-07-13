package com.it.lylj.emp.model;

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
}
