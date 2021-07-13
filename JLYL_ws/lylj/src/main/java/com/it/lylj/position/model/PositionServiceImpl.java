package com.it.lylj.position.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PositionServiceImpl implements PositionService{
	private final PositionDAO positionDao;

	@Override
	public List<PositionVO> selectAllPosition() {
		return positionDao.selectAllPosition();
	}
	
}
