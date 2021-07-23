package com.it.lylj.addBook.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.common.SearchVO;

@Mapper
public interface AddBookDAO {
	int insertAddBook(AddBookVO vo);
	List<AddBookVO> selectAllAddBook(SearchVO searchVo);
	int selectAllTotalRecord(SearchVO searchVo);
}
