package com.it.lylj.boTarget.model;

import java.util.List;

public interface BoTargetService {
	List<BoTargetVO> selectAllBoTarget();
	int insertBoTarget(BoTargetVO vo);
	int updateBorTarget(BoTargetVO vo);
	int deleteBorTarget(int bookingTargetNo);
}
