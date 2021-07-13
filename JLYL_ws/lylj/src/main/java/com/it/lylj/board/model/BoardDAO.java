package com.it.lylj.board.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO vo);
}
