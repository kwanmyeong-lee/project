package com.it.lylj.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@Transactional
	public int insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		service.insertSchedule(scheduleVO);
		int no = service.selectMaxScNoByEmpNo(scheduleVO.getEmpNo());
		return no;
	}//일정 추가
	
	@PostMapping("/insertScFolder")
	@ResponseBody
	public List<ScFolderVO> insertScFolder(@ModelAttribute ScFolderVO vo) {
		sfService.insertScFolder(vo);
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(vo.getEmpNo());
		
		return sfList;
	}//일정목록 추가
	
	@PostMapping("/deleteScFolder")
	@ResponseBody
	@Transactional
	public Map<String,Object> deleteScFolder(@ModelAttribute ScFolderVO vo) {
		List<ScheduleVO> list = service.selectAllScheduleByScFolderNo(vo.getScheduleFolderNo());
		sfService.deleteScFolderByScFolderNo(vo.getScheduleFolderNo());
		service.deleteScheduleByScFolderNo(vo.getScheduleFolderNo());
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(vo.getEmpNo());
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("sfList", sfList);
		rmap.put("list", list);
		
		return rmap;
	}//일정목록 제거
	
	@PostMapping("/updateScFolder")
	@ResponseBody
	@Transactional
	public Map<String,Object> updateScFolder(@ModelAttribute ScFolderVO vo) {
		ScheduleVO scvo= new ScheduleVO();
		scvo.setScheduleFolderNo(vo.getScheduleFolderNo());
		scvo.setScheduleColor(vo.getScheduleFolderColor());
		service.updateScheduleByScFolderNo(scvo);
		sfService.updateScFolderByScFolderNo(vo);
		List<ScheduleVO> list = service.selectAllScheduleByScFolderNo(vo.getScheduleFolderNo());
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(vo.getEmpNo());
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("sfList", sfList);
		rmap.put("list", list);
		
		return rmap;
	}//일정목록 수정
	
	@GetMapping("/scheduleMain")
	public String Schedule(Model model, HttpServletRequest req){
		model.addAttribute("navNo",4);
		HttpSession session = req.getSession();
		
		if(session.getAttribute("empNo")==null) {
			model.addAttribute("msg","잘못된 URL입니다.");
			model.addAttribute("url", "/login/login");
			
			return "common/message";
		}
		
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(empNo);
		if(sfList.isEmpty() || sfList==null) {
			sfService.insertDefaultScFolder(empNo);
		}
		sfList= sfService.selectAllScFolderByEmpNo(empNo);
		model.addAttribute("sfList", sfList);
		return "schedule/scheduleMain";
	}//메인 페이지 일정불러오기
	
	@GetMapping("/listSchedule")
	@ResponseBody
	public List<ScheduleVO> listSchedule(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
	
		
		List<ScheduleVO> list = service.selectAllScheduleByEmpNo(empNo);
		
		return list;
		
	}//ajax 전체 일정 불러오기
	
	@PostMapping("/selectScheduleByScheduleNo")
	@ResponseBody
	public Map<String,Object> selectScheduleByScheduleNo(@RequestBody int scheduleNo){
		Map<String,Object> map = new HashMap<>();
	
		ScheduleVO scvo = service.selectScheduleByScheduleNo(scheduleNo);
		ScFolderVO scfvo = sfService.selectScFolderByScFolderNo(scvo.getScheduleFolderNo());
		map.put("scFolderName", scfvo.getScheduleFolderName());
		map.put("scvo", scvo);
		return map;
		
	}//ajax 일정 한개 불러오기
	
	@PostMapping("/deleteScheduleByScheduleNo")
	@ResponseBody
	public int deleteScheduleByScheduleNo(@RequestBody int scheduleNo){
		logger.info("scheduleNo 업데이트, 파라미터 scheduleNo = {}", scheduleNo);
		
		service.deleteScheduleByScheduleNo(scheduleNo);
		
		return 1;
	}//ajax 일정 한개 삭제하기
	
	@GetMapping("/listScFolder")
	@ResponseBody
	public List<ScFolderVO> listScFolder(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		List<ScFolderVO> list = sfService.selectAllScFolderByEmpNo(empNo);
		
		return list;
	}//ajax 일정목록 불러오기
	
	@PostMapping("/listScheduleByScFolderNo")
	@ResponseBody
	public List<ScheduleVO> listScheduleByScFolderNo(@RequestBody int scFolderNo){
		
		List<ScheduleVO> list = service.selectAllScheduleByScFolderNo(scFolderNo);
		
		return list;
	}//ajax 목록번호에 맞는 일정만 불러오기
	
	@GetMapping("/write")
	public String write(Model model, HttpServletRequest req) {
		model.addAttribute("navNo",4);
		HttpSession session = req.getSession();
		
		if(session.getAttribute("empNo")==null) {
			model.addAttribute("msg","잘못된 URL입니다.");
			model.addAttribute("url", "/login/login");
			
			return "common/message";
		}
		
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(empNo);
		if(sfList.isEmpty() || sfList==null) {
			sfService.insertDefaultScFolder(empNo);
		}
		sfList= sfService.selectAllScFolderByEmpNo(empNo);
		model.addAttribute("sfList", sfList);
		
		return "schedule/write";

	}//일정등록 페이지
	
	@PostMapping("/write")
	public String writeok(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		
		
		return "redirect:/schedule/scheduleMain";
		
	}//일정등록
}
