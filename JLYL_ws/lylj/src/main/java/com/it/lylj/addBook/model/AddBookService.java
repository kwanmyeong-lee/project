package com.it.lylj.addBook.model;

import java.util.List;

import com.it.lylj.common.SearchVO;

public interface AddBookService {
	int insertAddBook(AddBookVO vo);
	List<AddBookVO> selectAllAddBook(SearchVO searchVo);
	int selectAllTotalRecord(SearchVO searchVo);
}
