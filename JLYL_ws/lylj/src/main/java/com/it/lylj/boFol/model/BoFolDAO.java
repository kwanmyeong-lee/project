package com.it.lylj.boFol.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.boTarget.model.BoTargetVO;

@Mapper
public interface BoFolDAO {
	List<BoFolVO> selectAllBoFol(); 
	int insertBoFol(BoFolVO vo);
	int updateBoFol(BoFolVO vo);
	int deleteBoFol(int bookingFolderNo);
}
