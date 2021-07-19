package com.it.lylj.electronicAppLine.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicAppLineServiceImpl implements ElectronicAppLineService{
	private final ElectronicAppLineDAO electronicAppLineDao;

	@Override
	public int insertAppLine(ElectronicAppLineVo vo) {
		return electronicAppLineDao.insertAppLine(vo);
	}

	@Override
	public List<ElectronicAppLineVo> selectByElectronicNo(int ElectronicNo) {
		return electronicAppLineDao.selectByElectronicNo(ElectronicNo);
	}

}
