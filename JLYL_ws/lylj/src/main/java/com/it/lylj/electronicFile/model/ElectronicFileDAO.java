package com.it.lylj.electronicFile.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectronicFileDAO {
	
	int insertFile(ElectronicFileVo vo);
	List<ElectronicFileVo> selectFileByEleNo(int electronicNo);
	ElectronicFileVo selectFileByFileNo(int fileNo);

}
