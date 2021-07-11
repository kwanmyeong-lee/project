package com.it.lylj.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	
	//메인
	@RequestMapping("/boardMain")
	public String main() {
		logger.info("게시판 메인 페이지");
		
		return "board/boardMain";
	}
	
	//게시글 등록
	@RequestMapping("/boardWrite")
	public String write() {
		logger.info("게시판 등록 페이지");
		
		return "board/boardWrite";
	}
	
	//게시글 수정
	@RequestMapping("/boardEdit")
	public String eidt() {
		logger.info("게시판 수정 페이지");
		
		return "board/boardEdit";
	}
	
	//게시글 상세보기
	@RequestMapping("/boardDetail")
	public String detail() {
		logger.info("게시판 상세보기 페이지");
		
		return "board/boardDetail";
	}
	
	//게시글 목록
	@RequestMapping("/boardList")
	public String list() {
		logger.info("게시판 목록 페이지");
		
		return "board/boardList";
	}
}
