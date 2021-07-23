package com.it.lylj.addBook.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddBookServiceImpl implements AddBookService{
	private final AddBookDAO addBookDao;

	@Override
	public int insertAddBook(AddBookVO vo) {
		return addBookDao.insertAddBook(vo);
	}

	@Override
	public List<AddBookVO> selectAllAddBook(int empNo) {
		return addBookDao.selectAllAddBook(empNo);
	}

}
