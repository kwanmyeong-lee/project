package com.it.lylj.electronic.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectronicDAO {
	
	int insertEle(ElectronicVo vo);

}
