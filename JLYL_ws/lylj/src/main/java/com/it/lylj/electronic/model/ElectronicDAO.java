package com.it.lylj.electronic.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectronicDAO {
	
	int insertEle(ElectronicVo vo);
	ElectronicVo selectByElectronicNo(int ElectronicNo);
	int selectMaxEleNo(int empNo);
	List<ElectronicVo> selectByEmpNo(int empNo);
	List<Map<String, Object>> selectListByEmpNo1(int empNo);
	List<Map<String, Object>> selectListByEmpNo3(int empNo);
	List<Map<String, Object>> selectListByEmpNo6(int empNo);
	List<Map<String, Object>> selectListByEmpNo2(int empNo);
	List<Map<String, Object>> selectListByEmpNo4(int empNo);
	List<Map<String, Object>> selectListByEmpNo5(int empNo);
	
}
