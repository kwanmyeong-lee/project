package com.it.lylj.electronicReLine.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectronicReLineDAO {
	int insertReLine(ElectronicReLineVo vo);
	List<ElectronicReLineVo> selectByElectronicNo(int ElectronicNo);
}
