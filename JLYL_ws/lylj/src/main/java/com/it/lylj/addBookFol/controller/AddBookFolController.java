package com.it.lylj.addBookFol.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.lylj.addBookFol.model.AddBookFolService;
import com.it.lylj.addBookFol.model.AddBookFolVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/bookFolInfo")
@RequiredArgsConstructor
public class AddBookFolController {
	private static final Logger logger=LoggerFactory.getLogger(AddBookFolController.class);
	
	private final AddBookFolService addBookFolService;
	
	/* 카테고리 메인 페이지 */
	@RequestMapping("/main")
	public String folInfo(@ModelAttribute AddBookFolVO folVo, HttpSession session, Model model) {
		logger.info("카테고리 정보 페이지, folVo={}", folVo);
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		List<AddBookFolVO> bookFolList = addBookFolService.selectFol(empNo);
		
		model.addAttribute("empNo", empNo);
		model.addAttribute("bookFolList", bookFolList);
		
		return "addressBook/bookFolInfo";
	}
	
	/* 카테고리 추가 처리 */
	@RequestMapping("/insert")
	public String insert(@ModelAttribute AddBookFolVO folVo, Model model) {
		logger.info("카테고리 등록 처리, 파라미터 folVo={}", folVo);
		
		int cnt = addBookFolService.insertFol(folVo);
		
		String msg="등록처리 중 오류가 발생하였습니다.", url="/bookFolInfo/main";
		if(cnt>0) {
			msg="등록되었습니다.";
			url="/bookFolInfo/main";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/* 카테고리 수정 처리 */
	@RequestMapping("/update")
	public String update(@ModelAttribute AddBookFolVO folVo, Model model) {
		logger.info("카테고리 수정 처리, 파라미터 folVo={}", folVo);
		
		int cnt = addBookFolService.updateFol(folVo);
		String msg="수정처리 중 오류가 발생하였습니다.", url="/bookFolInfo/main";
		if(cnt>0) {
			msg="수정되었습니다.";
			url="/bookFolInfo/main";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	/* 카테고리 수정 처리 */
	@RequestMapping("/delete")
	public String delete(@ModelAttribute AddBookFolVO folVo, Model model) {
		logger.info("카테고리 삭제 처리, 파라미터 folVo={}", folVo);
		
		int cnt = addBookFolService.deleteFol(folVo);
		String msg="삭제처리 중 오류가 발생하였습니다.", url="/bookFolInfo/main";
		if(cnt>0) {
			msg="삭제되었습니다.";
			url="/bookFolInfo/main";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
