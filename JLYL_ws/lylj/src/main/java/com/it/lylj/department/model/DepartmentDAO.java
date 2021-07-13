package com.it.lylj.department.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentDAO {
	List<DepartmentVO> selectAllDepartment();
}
