package com.it.lylj.emp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp")
public class EmpController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);

	
	@RequestMapping("/empWrite")
	public void empWrite() {
		logger.info("사원등록페이지");
	}
}
