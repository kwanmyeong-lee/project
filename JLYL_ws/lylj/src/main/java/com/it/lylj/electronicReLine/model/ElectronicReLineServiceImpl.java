package com.it.lylj.electronicReLine.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.lylj.electronic.model.ElectronicVo;

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

	@Override
	public int AcceptUpdateReLine(ElectronicVo vo) {
		return electronicReLineDao.AcceptUpdateReLine(vo);
	}

	@Override
	public int deleteReLine(ElectronicReLineVo vo) {
		return electronicReLineDao.deleteReLine(vo);
	}

	@Override
	public int selectForCheckExist(ElectronicReLineVo vo) {
		return electronicReLineDao.selectForCheckExist(vo);
	}

}
