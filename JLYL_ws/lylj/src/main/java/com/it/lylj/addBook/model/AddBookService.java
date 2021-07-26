package com.it.lylj.addBook.model;

import java.util.List;
import java.util.Map;

import com.it.lylj.common.SearchVO;

public interface AddBookService {
	int insertAddBook(AddBookVO vo);
	List<Map<String, Object>> selectAllAddBook(SearchVO searchVo);
	int selectAllTotalRecord(SearchVO searchVo);
	AddBookVO selectByNo(int addressBookNo);
	int updateAddBook(AddBookVO vo);
	int deleteAddBook(AddBookVO vo);
	List<Map<String, Object>> selectByFolNo(SearchVO searchVo);
	int selectByFolNoTotalRecord(SearchVO searchVo);
}
