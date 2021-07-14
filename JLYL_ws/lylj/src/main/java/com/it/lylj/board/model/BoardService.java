package com.it.lylj.board.model;

import java.util.List;

public interface BoardService {
	int insertBoard(BoardVO vo);
	List<BoardVO> selectBoard(int boardFolderNo);
}
