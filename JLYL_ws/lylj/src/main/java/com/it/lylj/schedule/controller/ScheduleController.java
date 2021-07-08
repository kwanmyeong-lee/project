package com.it.lylj.schedule.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.schedule.model.ScheduleService;
import com.it.lylj.schedule.model.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {
	private final ScheduleService service;
	private static final Logger logger
		=LoggerFactory.getLogger(ScheduleController.class);

	@PostMapping("/insertSchedule")
	@ResponseBody
	public void insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		logger.info("cal 등록, 파라미터 vo = {}", scheduleVO);
		service.insertSchedule(scheduleVO);
		
	}
	
	@GetMapping("/scheduleMain")
	public String Schedule(){
		
		return "schedule/scheduleMain";
	}
	
	@GetMapping("/listSchedule")
	@ResponseBody
	public List<ScheduleVO> listSchedule(){
		List<ScheduleVO> list = service.listSchedule();
		logger.info("cal 리스트, 파라미터 vo = {}", list.get(1));
		
		return list;
	}
}
