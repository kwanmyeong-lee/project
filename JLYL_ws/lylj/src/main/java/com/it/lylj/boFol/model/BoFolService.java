package com.it.lylj.boFol.model;

import java.util.List;

public interface BoFolService {
	List<BoFolVO> selectAllBoFol(); 
	int insertBoFol(BoFolVO vo);
	int updateBoFol(BoFolVO vo);
	int deleteBoFol(int bookingFolderNo);
}
