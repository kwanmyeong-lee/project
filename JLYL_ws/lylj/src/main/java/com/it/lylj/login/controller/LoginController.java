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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private final EmpService empService;
	
	@GetMapping("/login")
	public void login() {
		logger.info("로그인 페이지");
	}
	
	@PostMapping("/login")
	public String login_post(@RequestParam String empNo, @RequestParam String empPwd, 
				@RequestParam(required = false) String chkSave, HttpServletRequest request, HttpServletResponse response,
				Model model) {
		//1
	    int iEmpNo =Integer.parseInt(empNo);
		logger.info("로그인 처리, 파라미터 empNo={}, pwd={}, chkSave={}", iEmpNo, empPwd, chkSave);
	    
		//2
	    int result = empService.loginProc(iEmpNo, empPwd);
	    logger.info("로그인 처리, 결과 cnt={}", result);
	    	
	    String msg="로그인실패", url="/login/login";
	    EmpVO vo= null;
	    if(result==EmpService.LOGIN_OK) {
	    	vo = empService.selectByEmpNo(iEmpNo);
	    	logger.info("로그인된 사원정보, vo={}",vo);
	    	
	    	//[세션]
	    	HttpSession session = request.getSession();
	    	session.setAttribute("empNo",vo.getEmpNo());
	    	session.setAttribute("empName", vo.getEmpName());
	    	session.setAttribute("empAdminLev", vo.getEmpAdminLev());
	    	
	    	logger.info("session={}",session.getAttribute("empNo"));
	    	
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
	    
	    
	    return "common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.removeAttribute("empNo");
		session.removeAttribute("empName");
		session.removeAttribute("empAdminLev");
		
		return "redirect:/login/login";
	}
}
