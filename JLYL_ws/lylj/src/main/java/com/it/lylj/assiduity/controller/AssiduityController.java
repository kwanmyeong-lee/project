package com.it.lylj.assiduity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/assiduity")
public class AssiduityController {
	
	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("navNo",3);
	}
	
}
