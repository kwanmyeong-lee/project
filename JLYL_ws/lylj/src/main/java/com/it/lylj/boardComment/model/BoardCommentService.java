package com.it.lylj.boardComment.model;

import java.util.List;

public interface BoardCommentService {
	int insertComment(BoardCommentVO commVo);
	List<BoardCommentVO> selectByNo(int boardNo);
}
