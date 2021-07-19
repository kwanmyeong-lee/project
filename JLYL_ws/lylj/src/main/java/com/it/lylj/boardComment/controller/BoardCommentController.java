package com.it.lylj.boardComment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.lylj.boardComment.model.BoardCommentService;
import com.it.lylj.boardComment.model.BoardCommentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardCommentController {
	private static final Logger logger=LoggerFactory.getLogger(BoardCommentController.class);
	
	private final BoardCommentService boardCommentService;
	
	@RequestMapping("/commentWrite")
	public int write(@ModelAttribute BoardCommentVO commVo) {
		logger.info("댓글 등록 처리, 파라미터 commVo={}", commVo);
		
		return boardCommentService.insertComment(commVo.getBoardNo());
	}
}
