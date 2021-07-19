package com.it.lylj.electronicAppLine.model;

import java.util.List;

public interface ElectronicAppLineService {
	
	int insertAppLine(ElectronicAppLineVo vo);
	List<ElectronicAppLineVo> selectByElectronicNo(int ElectronicNo);
}
