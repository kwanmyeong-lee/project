package com.it.lylj.boardComment.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardCommentServiceImpl implements BoardCommentService{
	private final BoardCommentDAO boardCommentDao;

	@Override
	public int insertComment(BoardCommentVO commVo) {
		return boardCommentDao.insertComment(commVo);
	}

	@Override
	public List<BoardCommentVO> selectByNo(int boardNo) {
		return boardCommentDao.selectByNo(boardNo);
	}
}
