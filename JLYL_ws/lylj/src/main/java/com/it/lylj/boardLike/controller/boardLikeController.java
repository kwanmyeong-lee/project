package com.it.lylj.boardLike.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.boardLike.model.BoardLikeService;
import com.it.lylj.boardLike.model.BoardLikeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class boardLikeController {
	private final Logger logger=LoggerFactory.getLogger(boardLikeController.class);
	
	private final BoardLikeService boardLikeService;
	
	@ResponseBody
	@RequestMapping(value = "/like/insert")
	public int insert(@RequestParam(defaultValue = "0") int boardNo, HttpSession session) {
		logger.info("좋아요 등록 처리, 파라미터 boardNo={}", boardNo);
		
		String empNo=(String)session.getAttribute("empNo");
		
		BoardLikeVO likeVo = new BoardLikeVO();
		likeVo.setBoardNo(boardNo);
		likeVo.setEmpNo(Integer.parseInt(empNo));
		
		int cnt = boardLikeService.insertLike(likeVo);
		logger.info("좋아요 등록 처리, 파라미터 likeVo={}", boardNo);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/like/delete")
	public int delete(@RequestParam(defaultValue = "0")int boardNo, HttpSession session) {
		logger.info("좋아요 삭제 처리, 파라미터 boardNo={}", boardNo);

		String empNo=(String)session.getAttribute("empNo");
		
		BoardLikeVO likeVo = new BoardLikeVO();
		likeVo.setBoardNo(boardNo);
		likeVo.setEmpNo(Integer.parseInt(empNo));
		
		int cnt = boardLikeService.deleteLike(likeVo);
		logger.info("좋아요 삭제 처리, 파라미터 likeVo={}", likeVo);
		
		return cnt;
	}

}