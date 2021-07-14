package com.it.lylj.boardFol.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardFolDAO {
	int insertBoardFol(BoardFolVO vo);
	List<BoardFolVO> selectBoardFol();
}
