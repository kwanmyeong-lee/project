package com.it.lylj.electronic.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicServiceImpl implements ElectronicService {
	private final ElectronicDAO electronicDao;

	@Override
	public int insertEle(ElectronicVo vo) {
		return electronicDao.insertEle(vo);
	}

	@Override
	public ElectronicVo selectByElectronicNo(int ElectronicNo) {
		return electronicDao.selectByElectronicNo(ElectronicNo);
	}

	@Override
	public int selectMaxEleNo(int empNo) {
		return electronicDao.selectMaxEleNo(empNo);
	}

	@Override
	public List<ElectronicVo> selectByEmpNo(int empNo) {
		return electronicDao.selectByEmpNo(empNo);
	}

}
