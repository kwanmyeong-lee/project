package com.it.lylj.emp.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.lylj.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService{
	private final EmpDAO empDao;
	private final PasswordEncoder passwordEncoder;
	private static final Logger logger = LoggerFactory.getLogger(EmpServiceImpl.class);


	 
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

	@Override
	public int selectTotalEmp(SearchVO searchVo) {
		return empDao.selectTotalEmp(searchVo);
	}

	@Override
	public List<EmpVO> selectAllEmpList(SearchVO searchVo) {
		return empDao.selectAllEmpList(searchVo);
	}

	@Override
	public List<EmpVO> selectAllEmp() {
		return empDao.selectAllEmp();
	}

	@Override
	public int updateEmp(EmpVO vo) {
		return empDao.updateEmp(vo);
	}

	@Override
	public int deleteEmp(int empNo) {
		return empDao.deleteEmp(empNo);
	}

	@Override
	public String checkEmail(int empNo) {
		return empDao.checkEmail(empNo);
	}

	@Override
	public int updateTempPwd(EmpVO vo) {
		vo.setEmpPwd(passwordEncoder.encode(vo.getEmpPwd()));
		return empDao.updateTempPwd(vo);
	}

	@Override
	public void sendEmail(EmpVO vo) {
		//메일서버설정
		String charSet = "utf-8";						//인코딩
		String hostSMTP = "smtp.gmail.com";				//서버
		String hostSMTPid = "gisungj5027@gmail.com";	//서버 사용아이디
		String hostSMTPpwd = "gksmfdnffla@";			//서버 비번
		
		//보내는사람 email
		String fromEmail = "gisungj5027@gmail.com"; //받는사람 이메일에 표시되는 이메일주소
		String fromName = "IU그룹웨어";
		String subject = "";
		String msg = "";
		
		//메일내용
		subject = "IU그룹웨어 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getEmpNo()+"님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += vo.getEmpPwd()+"</p>";
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getEmpEmail();
		logger.info("vo={}",vo);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public String selectPwd(int empNo) {
		return empDao.selectPwd(empNo);
	}

	@Override
	public List<EmpVO>  selectAllEmpForEle() {
		return empDao.selectAllEmpForEle();
	}

	@Override
	public List<EmpVO> selectSearchNum(int searcNo) {
		return empDao.selectSearchNum(searcNo);
	}

}

