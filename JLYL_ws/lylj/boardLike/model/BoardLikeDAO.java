package com.it.lylj.boardLike.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardLikeDAO {
	int insertLike(BoardLikeVO likeVo);
	int deleteLike(BoardLikeVO likeVo );
	int selectLikeCnt(int boardNo);
	BoardLikeVO selectData(int boardNo);
}
