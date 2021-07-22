package com.it.lylj.board.model;

import java.util.List;

import com.it.lylj.common.SearchVO;

public interface BoardService {
	int insertBoard(BoardVO vo);
	List<BoardVO> selectBoard(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	//int selectByFol(int boardFolderNo);
	List<BoardVO> selectBoardMain(int boardFolderNo);
	int updateReadCount(int boardNo);
	BoardVO selectByNo(int boardNo);
	int updateBoard(BoardVO vo);
	int deleteBoard(int boardNo);
	int updateCommentCnt(int boardNo);
	int updateLikeCntUp(int boardNo);
	int updateLikeCntDown(int boardNo);
}
