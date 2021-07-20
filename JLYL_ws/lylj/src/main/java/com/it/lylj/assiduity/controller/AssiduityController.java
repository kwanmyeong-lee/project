package com.it.lylj.assiduity.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.attendDay.model.AttendDayService;
import com.it.lylj.attendDay.model.AttendDayVO;
import com.it.lylj.schedule.model.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/assiduity")
@RequiredArgsConstructor
public class AssiduityController {
	private final AttendDayService attendDayService;
	
	
	@GetMapping("/insertComTime")
	@ResponseBody
	public void insertComTime(AttendDayVO vo){
		
		attendDayService.insertAttendDay(vo);
		
	}//ajax 전체 일정 불러오기
	
	
	
	@GetMapping("/main")
	public void main(Model model, HttpServletRequest req) {
		Date today =new Date();
		HttpSession session =req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		AttendDayVO attendDayVo = new AttendDayVO();
		attendDayVo.setAttendanceDayRegdate(today);
		attendDayVo.setEmpNo(empNo);
		
		AttendDayVO attendDayVo2 = attendDayService.selectAttendDayByRegdate(attendDayVo);
		
		model.addAttribute("navNo",3);
		model.addAttribute("attendDayVo", attendDayVo2);
		
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
