package com.it.lylj.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private final EmpService empService;
	
	/* 로그인페이지 보여주기 */
	@GetMapping("/")
	public String login() {
		logger.info("로그인 페이지");
		return "login/login";
	}
	
	/* 테스트 페이지 삭제예정 */
	@RequestMapping("/testLogin")
	public void testpage() {
		
	}
	
	/* 로그인처리 */
	@PostMapping("/login/login")
	public String login_post(@RequestParam String empNo, @RequestParam String empPwd, 
				@RequestParam(required = false) String chkSave, HttpServletRequest request, HttpServletResponse response,
				Model model) {
		//1 파라미터 셋팅
	    int iEmpNo =Integer.parseInt(empNo);
		logger.info("로그인 처리, 파라미터 empNo={}, pwd={}, chkSave={}", iEmpNo, empPwd, chkSave);
	    
		//2 DB 처리
	    int result = empService.loginProc(iEmpNo, empPwd);
	    logger.info("로그인 처리, 결과 cnt={}", result);
	    	
	    String msg="로그인실패", url="/";
	    EmpVO vo= null;
	    HttpSession session = request.getSession();
	    if(result==EmpService.LOGIN_OK) {
	    	vo = empService.selectByEmpNo(iEmpNo);
	    	logger.info("로그인된 사원정보, vo={}",vo);
	    	
	    	//세션에 저장
	    	session.setAttribute("empNo",empNo);
	    	session.setAttribute("empName", vo.getEmpName());
	    	session.setAttribute("empAdminLev", vo.getEmpAdminLev());
	    	session.setAttribute("departmentNo", vo.getDepartmentNo());
	    	session.setAttribute("empPhoto", vo.getEmpPhoto());
	    	session.setMaxInactiveInterval(120*60);
	    	
	    	//쿠키 저장
	    	Cookie ck = new Cookie("ck_empNo", empNo);
	    	ck.setPath("/");
	    	 if(chkSave!=null && !chkSave.isEmpty()) {
	             ck.setMaxAge(1000*24*60*60);
	          }else {
	             ck.setMaxAge(0);
	          }
	    	 
	    	response.addCookie(ck);
	    	msg="로그인되었습니다";
	    	url="/index";
	    	 
	    }else if(result==EmpService.PWD_DISAGREE) {
	    	msg = "비밀번호가 일치하지 않습니다.";
	    }else if(result==EmpService.ID_NONE) {
	    	msg = "사원번호를 확인하세요";
	    	
	    }
	       
	    //3 모델 저장, 뷰페이지 리턴
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    logger.info("session={}",session.getAttribute("empNo"));
	    
	    return "common/message";
	}
	
	/* 로그아웃처리 */
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.removeAttribute("empNo");
		session.removeAttribute("empName");
		session.removeAttribute("empAdminLev");
		session.removeAttribute("departmentNo");
		
		return "redirect:/";
	}
	
	
	/* 비밀번호 찾기 */
	@RequestMapping("login/findPwd")
	public String sendRandomPwd(@ModelAttribute EmpVO empVo, Model model) {
		//1 파라미터 셋팅
		int chkEmpNo= empVo.getEmpNo();
		String checkEmail = empVo.getEmpEmail();
		logger.info("임시비밀번호 파라미터, chkEmpNo={},modalEmpEmail={}",chkEmpNo,empVo.getEmpEmail());
		
		//2
		//사원번호로 email 체크
		String dbEmail = empService.checkEmail(chkEmpNo);
		String msg="",url="/";
		if(checkEmail.equals(dbEmail)) {
			//입력된 이메일과 데이터베이스의 이메일이 동일하면 임시비밀번호 생성
			String tempPwd =  RandomPwd.getRandomPwd(8);
			// vo에 저장
			empVo.setEmpPwd(tempPwd);
			logger.info("생성된 tempPwd={}",tempPwd);
			logger.info("empVo={}",empVo);
			
			// 등록된 메일로 메일전송
			empService.sendEmail(empVo);
			
			// 데이터베이스에 업데이트
			int cnt = empService.updateTempPwd(empVo);
			logger.info("임시비밀번호성공, cnt={}",cnt);
			
			// 성공 or 실패안내
			if(cnt>0) {
				msg="임시비밀번호가 발급되었습니다";
			}else {
				msg="임시비밀번호 발급실패";
			}
		}else { //입력된 이메일과 데이터베이스의 이메일이 동일하지 않으면 불일치 안내 
			msg="이메일이 일치하지 않습니다.";
		}
		
		//3 모델 저장, 뷰페이지 리턴
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

}
