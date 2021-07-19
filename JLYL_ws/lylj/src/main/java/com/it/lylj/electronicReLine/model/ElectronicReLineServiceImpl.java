package com.it.lylj.electronicReLine.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicReLineServiceImpl implements ElectronicReLineService{
	private final ElectronicReLineDAO electronicReLineDao;

	@Override
	public int insertReLine(ElectronicReLineVo vo) {
		return electronicReLineDao.insertReLine(vo);
	}

	@Override
	public List<ElectronicReLineVo> selectByElectronicNo(int ElectronicNo) {
		return electronicReLineDao.selectByElectronicNo(ElectronicNo);
	}

}
