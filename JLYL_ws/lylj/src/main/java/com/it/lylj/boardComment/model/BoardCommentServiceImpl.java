package com.it.lylj.boardComment.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardCommentServiceImpl implements BoardCommentService{
	private final BoardCommentDAO boardCommentDao;

	@Override
	public int insertComment(int boardNo) {
		return boardCommentDao.insertComment(boardNo);
	}
}
