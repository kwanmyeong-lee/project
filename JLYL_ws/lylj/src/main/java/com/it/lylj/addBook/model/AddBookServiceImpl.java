package com.it.lylj.addBook.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.lylj.common.SearchVO;

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
	public List<AddBookVO> selectAllAddBook(SearchVO searchVo) {
		return addBookDao.selectAllAddBook(searchVo);
	}

	@Override
	public int selectAllTotalRecord(SearchVO searchVo) {
		return addBookDao.selectAllTotalRecord(searchVo);
	}

}
