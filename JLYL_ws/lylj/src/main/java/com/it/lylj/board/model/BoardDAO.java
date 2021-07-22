package com.it.lylj.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.boardFol.model.BoardFolVO;
import com.it.lylj.common.SearchVO;

@Mapper
public interface BoardDAO {
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
}
