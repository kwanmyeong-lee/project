package com.it.lylj.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.scFolder.model.ScFolderService;
import com.it.lylj.scFolder.model.ScFolderVO;
import com.it.lylj.schedule.model.ScheduleService;
import com.it.lylj.schedule.model.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {
	private final ScheduleService service;
	private final ScFolderService sfService;
	
	private static final Logger logger
		=LoggerFactory.getLogger(ScheduleController.class);

	@PostMapping("/insertSchedule")
	@ResponseBody
	public int insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		logger.info("cal 등록, 파라미터 vo = {}", scheduleVO);
		
		service.insertSchedule(scheduleVO);
		
		
		return 1;
	}
	
	@GetMapping("/scheduleMain")
	public String Schedule(Model model, HttpServletRequest req){
		model.addAttribute("navNo",4);
		HttpSession session = req.getSession();
		int empNo = (int)session.getAttribute("empNo");
		logger.info("emp search, 파라미터 empNo = {}", empNo);
		
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(empNo);
		
		model.addAttribute("sfList", sfList);
		return "schedule/scheduleMain";
	}
	
	@GetMapping("/listSchedule")
	@ResponseBody
	public List<ScheduleVO> listSchedule(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		int empNo = (int)session.getAttribute("empNo");
		
		List<ScheduleVO> list = service.selectAllScheduleByEmpNo(empNo);
		logger.info("cal 리스트, 파라미터 vo = {}", list.get(0));
		
		return list;
	}
	
	@PostMapping("/listScheduleByScFolderNo")
	@ResponseBody
	public List<ScheduleVO> listScheduleByScFolderNo(@RequestBody int scFolderNo){
		
		logger.info("listScheduleByScFolderNo scFolderNo = {}", scFolderNo);
		List<ScheduleVO> list = service.selectAllScheduleByScFolderNo(scFolderNo);
		
		return list;
	}
	
	@GetMapping("/write")
	public void write(Model model) {
		model.addAttribute("navNo",4);
	}
}
