package com.it.lylj.electronicAppLine.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.lylj.electronic.model.ElectronicVo;

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

	@Override
	public int AcceptUpdateAppLine(ElectronicVo vo) {
		return electronicAppLineDao.AcceptUpdateAppLine(vo);
	}

	@Override
	public int deleteAppLine(ElectronicAppLineVo vo) {
		return electronicAppLineDao.deleteAppLine(vo);
	}

	@Override
	public int selectForCheckExist(ElectronicAppLineVo vo) {
		return electronicAppLineDao.selectForCheckExist(vo);
	}

}
