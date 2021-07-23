package com.it.lylj.addBook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.lylj.addBook.model.AddBookService;
import com.it.lylj.addBook.model.AddBookVO;
import com.it.lylj.addBookFol.model.AddBookFolService;
import com.it.lylj.addBookFol.model.AddBookFolVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/addressBook")
@RequiredArgsConstructor
public class AddBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddBookController.class);
	
	private final AddBookService addBookService;
	private final AddBookFolService addBookFolService;
	
	@RequestMapping("/addressBookMain")
	public String bookMain(HttpSession session, Model model) {
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		logger.info("주소록 메인 페이지, 파라미터 empNo={}", empNo);
		
		/* 주소록 목록 조회 */
		List<AddBookVO> bookList =addBookService.selectAllAddBook(empNo);
		logger.info("bookList.size()={}", bookList.size());
		
		/* top, 등록, 수정 카테고리 list처리 */
		List<AddBookFolVO> bookFolList = addBookFolService.selectFol(empNo);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("bookFolList", bookFolList);
		model.addAttribute("navNo", 5);
		
		return "addressBook/addressBookMain";
	}
	
	@RequestMapping("/write")
	public String insert(@ModelAttribute AddBookVO vo, HttpSession session, Model model) {
		logger.info("주소록 등록 처리, 파라미터 vo={}", vo);
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		vo.setEmpNo(empNo);
		int cnt=addBookService.insertAddBook(vo);
		
		return "redirect:/addressBook/addressBookMain?empNo="+empNo;
	}
}
