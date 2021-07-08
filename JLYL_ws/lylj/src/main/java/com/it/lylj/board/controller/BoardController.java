package com.it.lylj.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/boardWrite")
	public String write() {
		logger.info("게시판 등록 페이지");
		
		return "board/boardWrite";
	}
}
