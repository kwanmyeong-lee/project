package com.it.lylj.boTarget.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoTargetServiceImpl implements BoTargetService{
	private final BoTargetDAO dao;

	@Override
	public List<BoTargetVO> selectAllBoTarget() {
		return dao.selectAllBoTarget();
	}

	@Override
	public int insertBoTarget(BoTargetVO vo) {
		return dao.insertBoTarget(vo);
	}

	@Override
	public int updateBorTarget(BoTargetVO vo) {
		return dao.updateBorTarget(vo);
	}

	@Override
	public int deleteBorTarget(int bookingTargetNo) {
		return dao.deleteBorTarget(bookingTargetNo);
	}
	
	
}
