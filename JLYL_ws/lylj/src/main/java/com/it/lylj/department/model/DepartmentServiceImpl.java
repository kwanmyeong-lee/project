package com.it.lylj.department.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService{
	private final DepartmentDAO departmentDao;

	@Override
	public List<DepartmentVO> selectAllDepartment() {
		return departmentDao.selectAllDepartment();
	}
	
}
