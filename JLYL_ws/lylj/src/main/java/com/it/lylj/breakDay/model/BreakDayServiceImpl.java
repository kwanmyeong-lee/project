package com.it.lylj.breakDay.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BreakDayServiceImpl implements BreakDayService{
	private final BreakDayDAO dao;


	@Override
	public List<BreakDayVO> selectAllBREAKDAYByEmpNo(HashMap<String, Object> map) {
		return dao.selectAllBREAKDAYByEmpNo(map);
	}


	@Override
	public int selectCntAllBREAKDAYByEmpNo(int empNo) {
		return dao.selectCntAllBREAKDAYByEmpNo(empNo);
	}
	
}
