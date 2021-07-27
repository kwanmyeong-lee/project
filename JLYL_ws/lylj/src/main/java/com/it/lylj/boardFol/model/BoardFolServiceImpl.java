package com.it.lylj.boardFol.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardFolServiceImpl implements BoardFolService{
	private final BoardFolDAO boardFolDao;
	
	@Override
	public int insertBoardFol(BoardFolVO vo) {
		return boardFolDao.insertBoardFol(vo);
	}

	@Override
	public List<BoardFolVO> selectBoardFol() {
		return boardFolDao.selectBoardFol();
	}

	@Override
	public BoardFolVO selectByNo(int boardFolderNo) {
		return boardFolDao.selectByNo(boardFolderNo);
	}

	@Override
	public List<BoardFolVO> otherFolder() {
		return boardFolDao.otherFolder();
	}

	@Override
	public int updateBoardFol(BoardFolVO vo) {
		return boardFolDao.updateBoardFol(vo);
	}

	@Override
	public int deleteBoardFol(int boardFolderNo) {
		return boardFolDao.deleteBoardFol(boardFolderNo);
	}


}
