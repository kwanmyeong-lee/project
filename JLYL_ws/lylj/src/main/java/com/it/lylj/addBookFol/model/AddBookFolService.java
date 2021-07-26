package com.it.lylj.addBookFol.model;

import java.util.List;

public interface AddBookFolService {
	int insertFol(AddBookFolVO folVo);
	List<AddBookFolVO> selectFol(int empNo);
	AddBookFolVO selectByFolNo(int addressFolderNo);
	int updateFol(AddBookFolVO booFolVo);
	int deleteFol(AddBookFolVO folVo);
}
