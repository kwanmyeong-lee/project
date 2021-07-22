package com.it.lylj.boardLike.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardLikeDAO {
	int firstInsert(int boardNo);
	int insertLike(BoardLikeVO likeVo);
	int deleteLike(BoardLikeVO likeVo);
	int selectLike(int boardNo);
	int selectByEmpNo(BoardLikeVO likeVo);
}
