package com.it.lylj.addressbook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/addressBook")
public class addressBookController {
	private static final Logger logger=LoggerFactory.getLogger(addressBookController.class);
	
	@RequestMapping("/addressBookMain")
	public String bookMain(Model model) {
		logger.info("주소록 메인 페이지");
		model.addAttribute("navNo", 5);
		return "addressBook/addressBookMain";
	}

	@RequestMapping("/addressBookWrite")
	public String bookWrite(Model model) {
		logger.info("주소록 추가 페이지");
		model.addAttribute("navNo", 5);
		
		return "addressBook/addressBookWrite";
	}

	@RequestMapping("/addressBookEdit")
	public String bookEdit(Model model) {
		logger.info("주소록 수정 페이지");
		model.addAttribute("navNo", 5);
		
		return "addressBook/addressBookEdit";
	}
	
	@RequestMapping("/booktop")
	public String top() {
		logger.info("주소록 탑 테스트");
		
		return "addressBook/booktop";
	}
}
