package com.it.lylj.breakDay.model;

import java.util.HashMap;
import java.util.List;

public interface BreakDayService {
	List<BreakDayVO> selectAllBREAKDAYByEmpNo(HashMap<String, Object> map);
	int selectCntAllBREAKDAYByEmpNo(int empNo);

}
