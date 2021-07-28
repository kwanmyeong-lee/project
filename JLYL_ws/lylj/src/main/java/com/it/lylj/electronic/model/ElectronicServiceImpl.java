package com.it.lylj.electronic.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.lylj.common.SearchVO;

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
	public List<Map<String, Object>> selectListByEmpNo(SearchVO searchVo, String no) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if(no.equals("1")) {
			list = electronicDao.selectListByEmpNo1(searchVo);
		}else if(no.equals("2")) {
			list = electronicDao.selectListByEmpNo2(searchVo);
		}else if(no.equals("3")) {
			list = electronicDao.selectListByEmpNo3(searchVo);
		}else if(no.equals("4")) {
			list = electronicDao.selectListByEmpNo4(searchVo);
		}else if(no.equals("5")) {
			list = electronicDao.selectListByEmpNo5(searchVo);
		}else if(no.equals("6")) {
			list = electronicDao.selectListByEmpNo6(searchVo);
		}else if(no.equals("7")) {
			list = electronicDao.selectListByEmpNo7(searchVo);
		}
		
		return list;
		
	}
	
	@Override
	public int TotalSelectListByEmpNo(SearchVO searchVo, String no) {
		
		int cnt = 0;
		if(no.equals("1")) {
			cnt = electronicDao.TotalSelectListByEmpNo1(searchVo);
		}else if(no.equals("2")) {
			cnt = electronicDao.TotalSelectListByEmpNo2(searchVo);
		}else if(no.equals("3")) {
			cnt = electronicDao.TotalSelectListByEmpNo3(searchVo);
		}else if(no.equals("4")) {
			cnt = electronicDao.TotalSelectListByEmpNo4(searchVo);
		}else if(no.equals("5")) {
			cnt = electronicDao.TotalSelectListByEmpNo5(searchVo);
		}else if(no.equals("6")) {
			cnt = electronicDao.TotalSelectListByEmpNo6(searchVo);
		}else if(no.equals("7")) {
			cnt = electronicDao.TotalSelectListByEmpNo7(searchVo);
		}
		
		return cnt;
		
	}

	@Override
	public int updateEle(ElectronicVo vo) {
		return electronicDao.updateEle(vo);
	}

	@Override
	public int updateEleReturn(int ElectronicNo) {
		return electronicDao.updateEleReturn(ElectronicNo);
	}

	@Override
	public int updateEleComplete(int ElectronicNo) {
		return electronicDao.updateEleComplete(ElectronicNo);
	}


	@Override
	public int upToDate(int ElectronicNo) {
		return electronicDao.upToDate(ElectronicNo);
	}

	@Override
	public List<ElectronicVo> selectUpdateToday(int empNo) {
		return electronicDao.selectUpdateToday(empNo);
	}

	@Override
	public List<Map<String, Object>> selectTopSty(int empNo) {
		return electronicDao.selectTopSty(empNo);
	}


}
