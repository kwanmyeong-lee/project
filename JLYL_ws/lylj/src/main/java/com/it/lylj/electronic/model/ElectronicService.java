package com.it.lylj.electronic.model;

import java.util.List;

public interface ElectronicService {

	int insertEle(ElectronicVo vo);
	ElectronicVo selectByElectronicNo(int ElectronicNo);
	int selectMaxEleNo(int empNo);
	List<ElectronicVo> selectByEmpNo(int empNo);
	
}
