package com.it.lylj.electronicReLine.model;

import java.util.List;

public interface ElectronicReLineService {

	int insertReLine(ElectronicReLineVo vo);
	List<ElectronicReLineVo> selectByElectronicNo(int ElectronicNo);
}
