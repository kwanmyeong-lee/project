package com.it.lylj.emp.model;

import java.util.List;
import java.util.Map;

import com.it.lylj.common.SearchVO;

public interface EmpService {
	//로그인처리 상수
	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;
	
	//adminLevel
	int ADMIN=1;
	int LEADER=2;
	int EMP=3;
	
	int insertEmp(EmpVO vo);
	public int loginProc(int empNo, String empPwd);
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
	String selectPwd(int empNo);
	List<EmpVO> selectAllEmpForEle();
	List<EmpVO> selectSearchNum(int searcNo);
	
	//이메일발송
	public void sendEmail(EmpVO vo);
}
