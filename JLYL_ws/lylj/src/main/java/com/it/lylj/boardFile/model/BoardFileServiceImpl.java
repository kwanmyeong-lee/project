package com.it.lylj.boardFile.model;

import java.util.List;

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

	@Override
	public List<BoardFileVO> selectByNo(int boardNo) {
		return boardFileDao.selectByNo(boardNo);
	}

	@Override
	public BoardFileVO selectByFileNo(int boardFileNo) {
		return boardFileDao.selectByFileNo(boardFileNo);
	}

	@Override
	public int deleteFile(int boardNo) {
		return boardFileDao.deleteFile(boardNo);
	}

}
