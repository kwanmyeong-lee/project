package com.it.lylj.emp.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.common.SearchVO;

@Mapper
public interface EmpDAO {
	int insertEmp(EmpVO vo);
	String selectPwd(int empNo);
	EmpVO selectByEmpNo(int empNo);
	List<EmpVO> selectAllEmp();
	List<EmpVO> selectAllEmpList(SearchVO searchVo);
	Map<String, Object> selectstamp(String userNo);
	Map<String, Object> selectstampList(String empNo);
	int selectTotalEmp(SearchVO searchVo);
	int updateEmp(EmpVO vo);
	int deleteEmp(int empNo);
	String checkEmail(int empNo);
	int updateTempPwd(EmpVO vo);
	List<EmpVO>  selectAllEmpForEle();
	List<EmpVO> selectSearchNum(int searcNo);
	int selectCountByEmpNo(int empNo);
	List<HashMap<String, Object>> selectAge();
	List<HashMap<String, Object>> selectAgeGrop();
	List<HashMap<String, Object>> selectJoinLeave();
}
