package com.it.lylj.boTarget.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoTargetDAO {
	List<BoTargetVO> selectAllBoTarget();
	int insertBoTarget(BoTargetVO vo);
	int updateBorTarget(BoTargetVO vo);
	int deleteBorTarget(int bookingTargetNo);
}
