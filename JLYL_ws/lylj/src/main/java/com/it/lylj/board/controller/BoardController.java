package com.it.lylj.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	
	//메인
	@RequestMapping("/boardMain")
	public String main(Model model) {
		logger.info("게시판 메인 페이지");
		model.addAttribute("navNo",6);
		
		return "board/boardMain";
	}
	
	//게시글 등록
	@RequestMapping("/boardWrite")
	public String write(Model model) {
		logger.info("게시판 등록 페이지");
		model.addAttribute("navNo",6);

		
		return "board/boardWrite";
	}
	
	
	//게시글 수정
	@RequestMapping("/boardEdit")
	public String eidt(Model model) {
		logger.info("게시판 수정 페이지");
		model.addAttribute("navNo",6);

		return "board/boardEdit";
	}
	
	//게시글 상세보기
	@RequestMapping("/boardDetail")
	public String detail(Model model) {
		logger.info("게시판 상세보기 페이지");
		model.addAttribute("navNo",6);
		
		return "board/boardDetail";
	}
	
	//게시글 목록
	@RequestMapping("/boardList")
	public String list(Model model) {
		logger.info("게시판 목록 페이지");
		model.addAttribute("navNo",6);
		
		return "board/boardList";
	}
}
