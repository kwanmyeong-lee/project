package com.it.lylj.electronicDocFol.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ElectronicDocFolDAO {
	List<ElectronicDocFolVO> selectAll();
}
