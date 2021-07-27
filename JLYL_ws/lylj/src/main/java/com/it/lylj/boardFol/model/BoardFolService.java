package com.it.lylj.boardFol.model;

import java.util.List;

public interface BoardFolService {
	int insertBoardFol(BoardFolVO vo);
	List<BoardFolVO> selectBoardFol();
	BoardFolVO selectByNo(int boardFolderNo);
	List<BoardFolVO> otherFolder();
	int updateBoardFol(BoardFolVO vo);
	int deleteBoardFol(int boardFolderNo);
}
