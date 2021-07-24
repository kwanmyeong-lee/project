package com.it.lylj.email.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.email.model.EmailService;
import com.it.lylj.email.model.EmailVO;
import com.it.lylj.emp.model.EmpService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/email")
@RequiredArgsConstructor
public class EmailController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	private final EmailService emailService;
	private final EmpService empService;
	
	@RequestMapping("/emailMain")
	public void emailMain(Model model) {
		logger.info("이메일메인페이지");
		model.addAttribute("navNo", 2);
	}
	
	@RequestMapping("/emailList")
	public void emailList(@RequestParam int empNo, Model model) {
		logger.info("이메일 페이지, 파라미터 empNo={}",empNo);
		
		List<Map<String, Object>> list = emailService.selectMailList(Integer.toString(empNo));
		logger.info("이메일 페이지, list.size()={}", list.size());
		
		model.addAttribute("navNo", 2);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/emailWrite")
	public void emailWrite(Model model) {
		logger.info("이메일쓰기 페이지");
		model.addAttribute("navNo", 2);
	}
	
	@PostMapping("/emailWrite")
	public String emailWrite_post(@ModelAttribute EmailVO emailVo, Model model) {
		logger.info("이메일 전송, emailVo={}", emailVo);
		//1 파라미터처리
		//사원번호 이름 분리작업
		String emailTaker = emailService.splitName(emailVo.getMailTake());
		logger.info("받는사람, emailTaker={}", emailTaker);
		//받는사람 존재여부체크
		int chkTaker = empService.selectCountByEmpNo(Integer.parseInt(emailTaker));
		logger.info("받는사람 존재여부, chkTaker={}", chkTaker);
		
		String msg="",url="/email/emailWrite";
		if(chkTaker==0) {
			msg="받으시는분을 확인해주세요";
			url="/email/emailWrite";
			
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			
			return "common/message";
		}
		emailVo.setMailTake(emailTaker);
		int cnt = emailService.sendEmail(emailVo);
		logger.info("전송결과, ent={},emailVo={}",cnt,emailVo);
		if(cnt>0) {
			msg="메일이발송되었습니다";
			url="/email/emailMain";
		}else {
			msg="메일전송실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/emailDetail")
	public void emailDetail(Model model) {
		logger.info("emailDetail");
		model.addAttribute("navNo", 2);
	}
	@RequestMapping("/emailPreview")
	public String emailPreview(@ModelAttribute EmailVO vo
			, Model model) {
		logger.info("vo={}",vo);
		model.addAttribute("vo", vo);
		return "email/emailPreview";
	}
}
