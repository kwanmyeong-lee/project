package com.it.lylj.addBookFol.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.lylj.addBook.model.AddBookVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddBookFolServiceImpl implements AddBookFolService{
	private final AddBookFolDAO addBookFolDao;

	@Override
	public int insertFol(AddBookFolVO folVo) {
		return addBookFolDao.insertFol(folVo);
	}

	@Override
	public List<AddBookFolVO> selectFol(int empNo) {
		return addBookFolDao.selectFol(empNo);
	}

	@Override
	public int updateFol(AddBookFolVO folVo) {
		return addBookFolDao.updateFol(folVo);
	}

	@Override
	public int deleteFol(AddBookFolVO folVo) {
		return addBookFolDao.deleteFol(folVo);
	}


}
