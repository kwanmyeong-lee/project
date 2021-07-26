package com.it.lylj.addBookFol.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.addBook.model.AddBookVO;

@Mapper
public interface AddBookFolDAO {
	int insertFol(AddBookFolVO folVo);
	List<AddBookFolVO> selectFol(int empNo);
	int updateFol(AddBookFolVO folVo);
	int deleteFol(AddBookFolVO folVo);
}
