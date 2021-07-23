package com.it.lylj.addBookFol.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddBookFolDAO {
	List<AddBookFolVO> selectFol(int empNo);
}
