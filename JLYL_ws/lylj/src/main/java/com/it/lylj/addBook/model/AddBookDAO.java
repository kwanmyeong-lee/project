package com.it.lylj.addBook.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.common.SearchVO;

@Mapper
public interface AddBookDAO {
	int insertAddBook(AddBookVO vo);
	List<Map<String, Object>> selectAllAddBook(SearchVO searchVo);
	int selectAllTotalRecord(SearchVO searchVo);
	AddBookVO selectByNo(int addressBookNo);
	int updateAddBook(AddBookVO vo);
	int deleteAddBook(AddBookVO vo);
}
