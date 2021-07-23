package com.it.lylj.boardLike.model;

public interface BoardLikeService {
	int firstInsert(int boardNo);
	int insertLike(BoardLikeVO likeVo);
	int deleteLike(BoardLikeVO likeVo);
	int selectLike(int boardNo);
	int selectByEmpNo(BoardLikeVO likeVo);
}
