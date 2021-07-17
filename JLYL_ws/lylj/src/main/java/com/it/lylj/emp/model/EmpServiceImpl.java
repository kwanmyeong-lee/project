package com.it.lylj.emp.model;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService{
	private final EmpDAO empDao;
	
	private final PasswordEncoder passwordEncoder;

	 @Override
	 public List<EmpVO> selectAllEmp() {
		return empDao.selectAllEmp();
	}
	 
	@Transactional
	@Override
	public int insertEmp(EmpVO vo) {
		vo.setEmpPwd(passwordEncoder.encode(vo.getEmpPwd()));
		return empDao.insertEmp(vo);
	}

	@Override
	public int loginProc(int empNo, String empPwd) {
		String dbPwd = empDao.selectPwd(empNo);
		
		int result = 0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result =ID_NONE;
		}else {
			if(passwordEncoder.matches(empPwd, dbPwd)) {
				result = LOGIN_OK;
			}else {
				result = PWD_DISAGREE;
			}
			
		}
		
		return result;
	}

	@Override
	public EmpVO selectByEmpNo(int empNo) {
		return empDao.selectByEmpNo(empNo);
	}

	@Override
	public Map<String, Object> selectstamp(String userNo) {
		return empDao.selectstamp(userNo);
	}

	@Override
	public Map<String, Object> selectstampList(String empNo) {
		Map<String, Object> map = empDao.selectstampList(empNo);
		return map;
		
	}

}
