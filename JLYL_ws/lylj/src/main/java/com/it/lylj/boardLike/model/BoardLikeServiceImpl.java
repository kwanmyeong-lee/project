package com.it.lylj.boardLike.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardLikeServiceImpl implements BoardLikeService {
	private final BoardLikeDAO boardLikeDao;

	@Override
	public int insertLike(BoardLikeVO likeVo) {
		return boardLikeDao.insertLike(likeVo);
	}

	@Override
	public int deleteLike(BoardLikeVO likeVo) {
		return boardLikeDao.deleteLike(likeVo);
	}

	@Override
	public int selectLikeCnt(int boardNo) {
		return boardLikeDao.selectLikeCnt(boardNo);
	}

	@Override
	public BoardLikeVO selectData(int boardNo) {
		return boardLikeDao.selectData(boardNo);
	}
}
