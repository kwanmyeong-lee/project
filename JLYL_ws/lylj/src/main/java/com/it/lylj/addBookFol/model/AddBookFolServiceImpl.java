package com.it.lylj.addBookFol.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddBookFolServiceImpl implements AddBookFolService{
	private final AddBookFolDAO addBookFolDao;

	@Override
	public List<AddBookFolVO> selectFol(int empNo) {
		return addBookFolDao.selectFol(empNo);
	}

}
