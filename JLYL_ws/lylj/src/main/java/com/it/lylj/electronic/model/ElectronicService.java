package com.it.lylj.electronic.model;

public interface ElectronicService {

	int insertEle(ElectronicVo vo);
	ElectronicVo selectByElectronicNo(int ElectronicNo);
	int selectMaxEleNo(int empNo);
}
