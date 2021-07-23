package com.it.lylj.addBook.model;

import java.util.List;

public interface AddBookService {
	int insertAddBook(AddBookVO vo);
	List<AddBookVO> selectAllAddBook(int empNo);
}
