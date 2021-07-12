package com.it.lylj.addressbook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/addressBook")
public class addressBookController {
	private static final Logger logger=LoggerFactory.getLogger(addressBookController.class);
	
	@RequestMapping("/addressBookMain")
	public String bookMain() {
		logger.info("주소록 메인 페이지");
		
		return "addressBook/addressBookMain";
	}

	@RequestMapping("/addressBookWrite")
	public String bookWrite() {
		logger.info("주소록 추가 페이지");
		
		return "addressBook/addressBookWrite";
	}

	@RequestMapping("/addressBookEdit")
	public String bookEdit() {
		logger.info("주소록 수정 페이지");
		
		return "addressBook/addressBookEdit";
	}
}
