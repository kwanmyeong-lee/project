package com.it.lylj.electronic.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectronicDAO {
	
	int insertEle(ElectronicVo vo);
	ElectronicVo selectByElectronicNo(int ElectronicNo);
	int selectMaxEleNo(int empNo);
	List<ElectronicVo> selectByEmpNo(int empNo);
}
