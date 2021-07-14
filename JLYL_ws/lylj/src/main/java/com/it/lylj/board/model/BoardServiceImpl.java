package com.it.lylj.board.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardDAO boardDao;
	
	@Override
	public int insertBoard(BoardVO vo) {
		return boardDao.insertBoard(vo);
	}

	@Override
	public List<BoardVO> selectBoard(int boardFolderNo) {
		return boardDao.selectBoard(boardFolderNo);
	}

	@Override
	public int updateReadCount(int boardNo) {
		return boardDao.updateReadCount(boardNo);
	}

	@Override
	public BoardVO selectByNo(int boardNo) {
		return boardDao.selectByNo(boardNo);
	}
}
