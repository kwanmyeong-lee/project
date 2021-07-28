package com.it.lylj.boardFile.model;

import java.util.List;

public interface BoardFileService {
	int insertFile(BoardFileVO fileVo);
	List<BoardFileVO> selectByNo(int boardNo);
	BoardFileVO selectByFileNo(int boardFileNo);
	int deleteFile(int boardNo);
}
