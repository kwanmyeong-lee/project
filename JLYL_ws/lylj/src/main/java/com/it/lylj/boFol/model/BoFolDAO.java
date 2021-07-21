package com.it.lylj.boFol.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoFolDAO {
	List<BoFolVO> selectAllBoFol(); 
}
