package com.it.lylj.boardFile.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardFileDAO {
	int insertFile(BoardFileVO fileVo);
}
