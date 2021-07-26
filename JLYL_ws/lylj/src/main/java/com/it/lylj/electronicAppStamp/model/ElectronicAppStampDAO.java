package com.it.lylj.electronicAppStamp.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectronicAppStampDAO {
	int insertStamp(ElectronicAppStampVo stampVo);
	ElectronicAppStampVo selectByEmpNo(int empNo);
}
