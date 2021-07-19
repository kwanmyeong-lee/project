package com.it.lylj.boardComment.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardCommentDAO {
	int insertComment(int boardNo);
}
