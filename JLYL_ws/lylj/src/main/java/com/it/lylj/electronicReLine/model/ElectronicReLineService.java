package com.it.lylj.electronicReLine.model;

import java.util.List;

import com.it.lylj.electronic.model.ElectronicVo;

public interface ElectronicReLineService {

	int insertReLine(ElectronicReLineVo vo);
	List<ElectronicReLineVo> selectByElectronicNo(int ElectronicNo);
	int AcceptUpdateReLine(ElectronicVo vo);
}
