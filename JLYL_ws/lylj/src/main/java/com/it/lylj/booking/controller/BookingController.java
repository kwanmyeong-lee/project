package com.it.lylj.booking.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.boFol.model.BoFolService;
import com.it.lylj.boFol.model.BoFolVO;
import com.it.lylj.boTarget.model.BoTargetService;
import com.it.lylj.boTarget.model.BoTargetVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/booking")
@RequiredArgsConstructor
public class BookingController {
	private final BoFolService boFolservice;
	private final BoTargetService boTargetService;
	
	@GetMapping("/main")
	public void main(Model model) {
		model = topModel(model);
	}//main 페이지
	
	
	@GetMapping("/assetInfo")
	public void assetInfo(Model model) {
		model = topModel(model);
	}//예약 정보 페이지
	
	
	@GetMapping("/rent")
	public void rent(Model model) {
		model = topModel(model);
	}//예약 관리 페이지
	
	@GetMapping("/calDraw")
	@ResponseBody
	public List<BoTargetVO> calDraw(){
		List<BoTargetVO> data=boTargetService.selectAllBoTarget();
		
		return data;
	}
	
	
	public Model topModel(Model model) {
		model.addAttribute("navNo",7);
		List<BoFolVO> boFolList = boFolservice.selectAllBoFol();
		List<BoTargetVO> boTargetList = boTargetService.selectAllBoTarget();
		
		model.addAttribute("boFolList", boFolList);
		model.addAttribute("boTargetList", boTargetList);
		return model;
	}//top.jsp 모델
}
