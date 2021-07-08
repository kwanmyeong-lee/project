package com.it.lylj.email.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/email")
public class EmailController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	
	@RequestMapping("/emailMain")
	public void email() {
		logger.info("이메일 페이지");
	}
	
	@RequestMapping("/emailWrite")
	public void emailWrite() {
		logger.info("이메일쓰기 페이지");
	}
}
