package com.it.lylj.electronic.model;

import java.util.List;
import java.util.Map;

import com.it.lylj.common.SearchVO;

public interface ElectronicService {

	int insertEle(ElectronicVo vo);
	ElectronicVo selectByElectronicNo(int ElectronicNo);
	int selectMaxEleNo(int empNo);
	List<ElectronicVo> selectByEmpNo(int empNo);
	List<Map<String, Object>> selectListByEmpNo(SearchVO searchVo, String no);
	int TotalSelectListByEmpNo(SearchVO searchVo, String no);
	int updateEle(ElectronicVo vo);
	int updateEleReturn(int ElectronicNo);
	int updateEleComplete(int ElectronicNo);
	List<Map<String, Object>> selectTopSty();
	int upToDate(int ElectronicNo);
}
