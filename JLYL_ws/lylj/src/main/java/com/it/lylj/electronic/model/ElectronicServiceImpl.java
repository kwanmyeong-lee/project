package com.it.lylj.electronic.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> selectListByEmpNo(int empNo, String no) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if(no.equals("1")) {
			list = electronicDao.selectListByEmpNo1(empNo);
		}else if(no.equals("2")) {
			list = electronicDao.selectListByEmpNo2(empNo);
		}else if(no.equals("3")) {
			list = electronicDao.selectListByEmpNo3(empNo);
		}else if(no.equals("4")) {
			list = electronicDao.selectListByEmpNo4(empNo);
		}else if(no.equals("5")) {
			list = electronicDao.selectListByEmpNo5(empNo);
		}else if(no.equals("6")) {
			list = electronicDao.selectListByEmpNo6(empNo);
		}else if(no.equals("7")) {
			list = electronicDao.selectListByEmpNo7(empNo);
		}
		
		return list;
		
	}

	@Override
	public int updateEle(ElectronicVo vo) {
		return electronicDao.updateEle(vo);
	}

	@Override
	public int updateEleReturn(int ElectronicNo) {
		return electronicDao.updateEleReturn(ElectronicNo);
	}


}
