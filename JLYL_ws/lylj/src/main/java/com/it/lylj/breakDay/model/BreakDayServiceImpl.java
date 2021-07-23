package com.it.lylj.breakDay.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BreakDayServiceImpl implements BreakDayService{
	private final BreakDayDAO dao;


	@Override
	public List<Map<String, Object>> selectAllBREAKDAYByEmpNo(int empNo) {
		return dao.selectAllBREAKDAYByEmpNo(empNo);
	}
	
}
