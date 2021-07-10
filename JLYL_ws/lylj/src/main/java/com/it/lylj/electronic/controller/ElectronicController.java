package com.it.lylj.electronic.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/electronic")
public class ElectronicController {
	private static final Logger logger = LoggerFactory.getLogger(ElectronicController.class);
	
	@GetMapping("/electronicMain")
	public void electronicMain(Model model) {
		logger.info("전자결재 화면 보여주기");
		model.addAttribute("navNo", 1);
		
	}
	@GetMapping("/documentSelect")
	public void documentSty() {
		logger.info("양식 선택 보여주기");
	}

}
