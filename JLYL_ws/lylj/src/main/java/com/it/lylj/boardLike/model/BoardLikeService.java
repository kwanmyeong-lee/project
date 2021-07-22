package com.it.lylj.boardLike.model;

public interface BoardLikeService {
	int insertLike(BoardLikeVO likeVo);
	int deleteLike(BoardLikeVO likeVo );
	int selectLikeCnt(int boardNo);
	BoardLikeVO selectData(int boardNo);
}
