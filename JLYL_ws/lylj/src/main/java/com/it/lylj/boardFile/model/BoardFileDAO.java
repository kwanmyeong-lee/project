package com.it.lylj.boardFile.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardFileDAO {
	int insertFile(BoardFileVO fileVo);
	List<BoardFileVO> selectByNo(int boardNo);
	BoardFileVO selectByFileNo(int boardFileNo);
}
