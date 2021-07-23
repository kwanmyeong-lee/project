package com.it.lylj.email.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.lylj.email.model.EmailService;
import com.it.lylj.email.model.EmailVO;
import com.it.lylj.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/email")
@RequiredArgsConstructor
public class EmailController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	private final EmailService emailService;
	
	@RequestMapping("/emailMain")
	public void email(Model model) {
		logger.info("이메일 페이지");
		model.addAttribute("navNo", 2);
		
	}
	
	@RequestMapping("/emailWrite")
	public void emailWrite(Model model) {
		logger.info("이메일쓰기 페이지");
		model.addAttribute("navNo", 2);
	}
	
	@RequestMapping("/emailDetail")
	public void emailDetail(Model model) {
		logger.info("emailDetail");
		model.addAttribute("navNo", 2);
	}
	
	@RequestMapping("/emailPreview")
	public String emailPreview(@ModelAttribute EmailVO vo, Model model) {
		logger.info("미리보기, vo={},",vo);
		model.addAttribute("vo", vo);
		return "/email/emailPreview";
	}
}
