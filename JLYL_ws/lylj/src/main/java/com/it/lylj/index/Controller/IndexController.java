package com.it.lylj.index.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping("/index")
	public void test() {
		logger.info("메인 화면 보여주기");
		
	}

	@RequestMapping("/inc/organizationChart")
	public void organizationChart() {
		logger.info("메인 화면 보여주기");
		
	}
	
	
}

