package com.it.lylj.breakDay.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BreakDayDAO {
	List<Map<String, Object>> selectAllBREAKDAYByEmpNo(int empNo);
}
