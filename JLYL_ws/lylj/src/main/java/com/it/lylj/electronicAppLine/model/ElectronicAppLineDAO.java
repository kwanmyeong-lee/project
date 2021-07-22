package com.it.lylj.electronicAppLine.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.electronic.model.ElectronicVo;

@Mapper
public interface ElectronicAppLineDAO {
	
	int insertAppLine(ElectronicAppLineVo vo);
	List<ElectronicAppLineVo> selectByElectronicNo(int ElectronicNo);
	int AcceptUpdateAppLine(ElectronicVo vo);
	int deleteAppLine(ElectronicAppLineVo vo);
	int selectForCheckExist(ElectronicAppLineVo vo);
}
