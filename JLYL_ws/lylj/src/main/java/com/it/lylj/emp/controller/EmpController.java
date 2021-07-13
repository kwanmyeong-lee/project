package com.it.lylj.emp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.lylj.department.model.DepartmentService;
import com.it.lylj.department.model.DepartmentVO;
import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;
import com.it.lylj.position.model.PositionService;
import com.it.lylj.position.model.PositionVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/emp")
public class EmpController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	private final PositionService positionService;
	private final DepartmentService departmentService;
	private final EmpService empService;
	
	@GetMapping("/empWrite")
	public String empWrite(Model model) {
		//1
		logger.info("사원등록페이지");
		
		//2
		List<PositionVO> positionList = positionService.selectAllPosition();
		List<DepartmentVO> departmentList = departmentService.selectAllDepartment();
		logger.info("positionList={}, departmentList={}", positionList, departmentList);
		
		//3
		model.addAttribute("positionList", positionList);
		model.addAttribute("departmentList", departmentList);
		
		return "emp/empWrite";
		
	}
	
	@PostMapping("/empWrite")
	public String empWrite_post(@ModelAttribute EmpVO vo, Model model) {
		//1
		logger.info("사원등록처리, 파라미터 vo={}",vo);
		
		//2
		int cnt = empService.insertEmp(vo);
		logger.info("사원등록처리 성공여부, cnt={}",cnt);
		
		String msg ="등록실패", url="/emp/empwrite";
		if(cnt>0) {
			msg="등록성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
