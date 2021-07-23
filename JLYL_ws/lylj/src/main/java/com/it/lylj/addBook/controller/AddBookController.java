package com.it.lylj.addBook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.lylj.addBookFol.model.AddBookFolService;
import com.it.lylj.addBookFol.model.AddBookFolVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/addressBook")
@RequiredArgsConstructor
public class AddBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddBookController.class);
	
	private final AddBookFolService addBookFolService;
	
	@RequestMapping("/addressBookMain")
	public String bookMain(HttpSession session, Model model) {
		logger.info("주소록 메인 페이지");
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		/* top, 등록, 수정 카테고리 list처리 */
		List<AddBookFolVO> bookFolList = addBookFolService.selectFol(empNo);
		
		model.addAttribute("bookFolList", bookFolList);
		model.addAttribute("navNo", 5);
		
		return "addressBook/addressBookMain";
	}
}
