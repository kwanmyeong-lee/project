package com.it.lylj.board.model;

import java.util.List;

public interface BoardService {
	int insertBoard(BoardVO vo);
	List<BoardVO> selectBoard(int boardFolderNo);
	int updateReadCount(int boardNo);
	BoardVO selectByNo(int boardNo);
	int updateBoard(BoardVO vo);
	int deleteBoard(int boardNo);
}
