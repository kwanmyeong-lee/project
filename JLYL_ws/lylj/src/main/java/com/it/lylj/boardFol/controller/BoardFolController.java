package com.it.lylj.boardFol.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.lylj.boardFol.model.BoardFolService;
import com.it.lylj.boardFol.model.BoardFolVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/adminBoard")
@RequiredArgsConstructor
public class BoardFolController {
	private static final Logger logger=LoggerFactory.getLogger(BoardFolController.class);
	
	private final BoardFolService boardFolService;
	
	/* 관리자 페이지 - 게시판 */
	@RequestMapping("/main")
	public String adminBoard(Model model) {
		logger.info("관리자 - 게시판 페이지");
		
		/* 게시판 폴더 처리 */
		List<BoardFolVO> boFol = boardFolService.otherFolder();
		logger.info("게시판 폴더 조회, boFol.size={}", boFol.size());
		
		model.addAttribute("boFol", boFol);
		model.addAttribute("navNo", 8);
		return "board/adminBoardFolMain";
	}
	
	/* 카테고리 추가 */
	@RequestMapping("/insert")
	public String insert(@ModelAttribute BoardFolVO folVo) {
		logger.info("관리자 - 게시판 카테고리 수정 처리, 파라미터 folVo={}", folVo);

		boardFolService.insertBoardFol(folVo);

		return "redirect:/adminBoard/main";
	}
	
	/* 카테고리 수정 */
	@RequestMapping("/update")
	public String update(@ModelAttribute BoardFolVO folVo) {
		logger.info("관리자 - 게시판 카테고리 등록 처리, 파라미터 folVo={}", folVo);
		
		boardFolService.updateBoardFol(folVo);
		
		return "redirect:/adminBoard/main";
	}

	/* 카테고리 삭제 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(defaultValue = "0") int boardFolderNo) {
		logger.info("관리자 - 게시판 카테고리 삭제 처리, 파라미터 boardFolderNo={}", boardFolderNo);
		
		boardFolService.deleteBoardFol(boardFolderNo);
		
		return "redirect:/adminBoard/main";
	}
}
