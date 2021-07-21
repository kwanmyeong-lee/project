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
	
	
}
