package com.it.lylj.breakDay.model;

import java.util.List;
import java.util.Map;

public interface BreakDayService {
	List<Map<String, Object>> selectAllBREAKDAYByEmpNo(int empNo);

}
