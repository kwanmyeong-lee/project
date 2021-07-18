package com.it.lylj.boardFile.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardFileServiceImpl implements BoardFileService{
	private final BoardFileDAO boardFileDao;
	
	@Override
	public int insertFile(BoardFileVO fileVo) {
		return boardFileDao.insertFile(fileVo);
	}

}
