package com.it.lylj.assiduity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/assiduity")
@RequiredArgsConstructor
public class AssiduityController {
	
	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("navNo",3);
		
	}//main 페이지

	@GetMapping("/annual")
	public void annual(Model model) {
		model.addAttribute("navNo",3);
	}//휴가 페이지
	
	@GetMapping("/condition")
	public void condition(Model model) {
		model.addAttribute("navNo",3);
	}//근태 현황 페이지
	
	@GetMapping("/stats")
	public void stats(Model model) {
		model.addAttribute("navNo",3);
	}//근태 통계 페이지
	
}
