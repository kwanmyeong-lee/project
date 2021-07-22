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
	
	@GetMapping("/")
	public String login() {
		logger.info("로그인 페이지");
		return "login/login";
	}
	
	@PostMapping("/login/login")
	public String login_post(@RequestParam String empNo, @RequestParam String empPwd, 
				@RequestParam(required = false) String chkSave, HttpServletRequest request, HttpServletResponse response,
				Model model) {
		//1
	    int iEmpNo =Integer.parseInt(empNo);
		logger.info("로그인 처리, 파라미터 empNo={}, pwd={}, chkSave={}", iEmpNo, empPwd, chkSave);
	    
		//2
	    int result = empService.loginProc(iEmpNo, empPwd);
	    logger.info("로그인 처리, 결과 cnt={}", result);
	    	
	    String msg="로그인실패", url="/";
	    EmpVO vo= null;
	    HttpSession session = request.getSession();
	    if(result==EmpService.LOGIN_OK) {
	    	vo = empService.selectByEmpNo(iEmpNo);
	    	logger.info("로그인된 사원정보, vo={}",vo);
	    	
	    	//[세션]
	    	session.setAttribute("empNo",empNo);
	    	session.setAttribute("empName", vo.getEmpName());
	    	session.setAttribute("empAdminLev", vo.getEmpAdminLev());
	    	session.setMaxInactiveInterval(120*60);
	    	
	    	//[쿠키]
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
	       
	    //3
	    model.addAttribute("msg", msg);
	    model.addAttribute("url", url);
	    logger.info("session={}",session.getAttribute("empNo"));
	    
	    return "common/message";
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.removeAttribute("empNo");
		session.removeAttribute("empName");
		session.removeAttribute("empAdminLev");
		
		return "redirect:/";
	}
	
	@RequestMapping("login/findPwd")
	public String sendRandomPwd(@ModelAttribute EmpVO empVo, HttpServletResponse response, Model model) {
		int chkEmpNo= empVo.getEmpNo();
		String checkEmail = empVo.getEmpEmail();
		logger.info("임시비밀번호 파라미터, chkEmpNo={},modalEmpEmail={}",chkEmpNo,empVo.getEmpEmail());
		
		//1 사원번호로 email 체크
		String dbEmail = empService.checkEmail(chkEmpNo);
		String msg="",url="/";
		if(checkEmail.equals(dbEmail)) {
			//2 동일하면 임시비밀번호 생성
			String tempPwd =  RandomPwd.getRandomPwd(8);
			empVo.setEmpPwd(tempPwd);
			logger.info("생성된 tempPwd={}",tempPwd);
			logger.info("empVo={}",empVo);
			//3메일전송
			empService.sendEmail(empVo);
			//4update
			int cnt = empService.updateTempPwd(empVo);
			
			logger.info("임시비밀번호성공, cnt={}",cnt);
			if(cnt>0) {
				msg="임시비밀번호가 발급되었습니다";
			}else {
				msg="임시비밀번호 발급실패";
			}
			
		}else {
			//실패안내
			msg="이메일이 일치하지 않습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

}
