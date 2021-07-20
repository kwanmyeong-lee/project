package com.it.lylj.electronic.model;

import java.util.List;
import java.util.Map;

public interface ElectronicService {

	int insertEle(ElectronicVo vo);
	ElectronicVo selectByElectronicNo(int ElectronicNo);
	int selectMaxEleNo(int empNo);
	List<ElectronicVo> selectByEmpNo(int empNo);
	List<Map<String, Object>> selectListByEmpNo(int empNo, String no);
	
	
}
