package com.it.lylj.emp.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.FileUploadUtil;
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
	private final FileUploadUtil fileUploadUtil;
	
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
		model.addAttribute("navNo", 8);
		
		return "emp/empWrite";
		
	}
	
	@PostMapping("/empWrite")
	public String empWrite_post(@ModelAttribute EmpVO vo, HttpServletRequest request, Model model) {
		//1
		logger.info("사원등록처리, 파라미터 vo={}",vo);
		
		//2
		//사진업로드
		String fileUrl ="";
		
		try {
			List<Map<String, Object>> list = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_EMP_FLAG);
			
			for(int i=0; i<list.size();i++ ) {
				Map<String, Object> map = list.get(i);
				fileUrl = (String)map.get("fileName");
			}
			
			logger.info("파일 업로드 성공, fileUrl={}",fileUrl);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		vo.setEmpPhoto(fileUrl);
		
		//등록처리
		int cnt = empService.insertEmp(vo);
		logger.info("사원등록정보 vo={}",vo);
		logger.info("사원등록처리 성공여부, cnt={}",cnt);
		
		String msg ="등록실패", url="/emp/empWrite";
		if(cnt>0) {
			msg="등록성공";
			url="/emp/empList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/pwdCheck")
	public boolean pwdCheck(@RequestParam String empPwd ) {
		logger.info("비밀번호 chk, empPwd={}", empPwd);
		
		boolean chkPwd = false;
		
		//최소 8자, 최소 하나의 문자 및 하나의 숫자 포함
		String validPwd = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
		
		Pattern pt_symbol= Pattern.compile(validPwd);
		Matcher mt_symbol= pt_symbol.matcher(empPwd);
		
		if(mt_symbol.find()) {
			chkPwd=true;
		}
		
		return chkPwd;
	}


	@GetMapping("/empInfo")
	public String empinfo(@RequestParam(defaultValue = "0")int empNo , Model model) {
		//1
		logger.info("사원정보디테일 페이지, 파라미터 empNo={}",empNo);
		//2
		EmpVO vo = empService.selectByEmpNo(empNo);
		logger.info("사원정보, 파라미터 vo={}",vo);
		//3
		
		model.addAttribute("vo", vo);

		return "emp/empInfo";
	}
	
	@GetMapping("/empEdit")
	public void empEdit(Model model) {
		logger.info("사원정보디테일 페이지");
		model.addAttribute("navNo", 8);
	}
	
	@GetMapping("/empList")
	public void empList(Model model) {
		logger.info("사원정보리스트 페이지");
		model.addAttribute("navNo", 8);
	}

}



