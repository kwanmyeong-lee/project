package com.it.lylj.booking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	@GetMapping("/main")
	public void main(Model model) {
		model.addAttribute("navNo",7);
		
	}
	@GetMapping("/assetInfo")
	public void assetInfo(Model model) {
		model.addAttribute("navNo",7);
		
	}
	
	
}
