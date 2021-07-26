package com.it.lylj.attendDay.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendDayServiceImpl implements AttendDayService{
	private final AttendDayDAO dao;


	@Override
	public AttendDayVO selectAttendDayByRegdate(AttendDayVO vo) {
		return dao.selectAttendDayByRegdate(vo);
	}


	@Override
	public int insertAttendDay(AttendDayVO vo) {
		return dao.insertAttendDay(vo);
	}


	@Override
	public int updateAttendDayByOffHour(AttendDayVO vo) {
		return dao.updateAttendDayByOffHour(vo);
	}


	@Override
	public int selectSumWeekWork(int empNo) {
		return dao.selectSumWeekWork(empNo);
	}


	@Override
	public int selectSumMonthWork(HashMap<String, Object> map) {
		return dao.selectSumMonthWork(map);
	}


	@Override
	public int selectSumWeekWorkByMonth(HashMap<String, Object> map) {
		return dao.selectSumWeekWorkByMonth(map);
	}


	@Override
	public List<AttendDayVO> selectAttendMonth(HashMap<String, Object> map) {
		return dao.selectAttendMonth(map);
	}


	@Override
	public int selectSumWeekWorkEx(int empNo) {
		return dao.selectSumWeekWorkEx(empNo);
	}


	@Override
	public int selectSumMonthWorkEx(HashMap<String, Object> map) {
		return dao.selectSumMonthWorkEx(map);
	}


	@Override
	public int selectLeftTimeWeek(int empNo) {
		return dao.selectLeftTimeWeek(empNo);
	}


	@Override
	public int selectDayWorkEx(HashMap<String, Object> map) {
		return dao.selectDayWorkEx(map);
	}


	@Override
	public int updateAttendDay(AttendDayVO vo) {
		return dao.updateAttendDay(vo);
	}


	@Override
	public List<Map<String, Object>> selectSumConditionByGroup(HashMap<String, Object> map) {
		return dao.selectSumConditionByGroup(map);
	}


	@Override
	public List<ConditionViewVO> selectAllConditionByDepartMent(HashMap<String, Object> map) {
		return dao.selectAllConditionByDepartMent(map);
	}


	@Override
	public List<ConditionViewVO> selectAllConditionByMonth(HashMap<String, Object> map) {
		return dao.selectAllConditionByMonth(map);
	}


	@Override
	public int selectCntConditionByMonth(HashMap<String, Object> map) {
		return dao.selectCntConditionByMonth(map);
	}


	@Override
	public int selectCntBreakDayByMonth(HashMap<String, Object> map) {
		return dao.selectCntBreakDayByMonth(map);
	}


	

}
