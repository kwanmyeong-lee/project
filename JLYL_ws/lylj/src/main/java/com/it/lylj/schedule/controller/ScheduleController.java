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

	/* 일정 추가 (ajax) */
	@PostMapping("/insertSchedule")
	@ResponseBody
	@Transactional
	public int insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		service.insertSchedule(scheduleVO); //입력받은 일정 스케줄에 추가
		int no = service.selectMaxScNoByEmpNo(scheduleVO.getEmpNo());//empNo의 스케줄의 일정중 가장 최근의 스케줄 번호 반환
		return no;
	}
	
	/* 일정 목록명 추가 (ajax) */
	@PostMapping("/insertScFolder")
	@ResponseBody
	public List<ScFolderVO> insertScFolder(@ModelAttribute ScFolderVO vo) {
		sfService.insertScFolder(vo); //empNo의 일정 목록명 추가
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(vo.getEmpNo());//empNo의 모든 일정목록명 반환
		
		return sfList;
	}
	
	/* 일정 목록 번호에 해당하는 일정List, 일정 목록명과 이를 포함하는 일정 제거후 일정목록List 반환 (ajax) */
	@PostMapping("/deleteScFolder")
	@ResponseBody
	@Transactional
	public Map<String,Object> deleteScFolder(@ModelAttribute ScFolderVO vo) {
		List<ScheduleVO> list = service.selectAllScheduleByScFolderNo(vo.getScheduleFolderNo()); //일정목록번호에 해당하는 모든 일정 반환
		sfService.deleteScFolderByScFolderNo(vo.getScheduleFolderNo());//일정 목록 번호에 해당하는 일정목록 제거
		service.deleteScheduleByScFolderNo(vo.getScheduleFolderNo());// 일정 목록 번호에 해당하는 일정 제거
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(vo.getEmpNo()); // empNo의 모든 일정목록 반환
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("sfList", sfList);
		rmap.put("list", list);
		
		return rmap;
	}
	
	/* 일정목록명과 이를 포함하는 일정 업데이트 후 일정List, 일정목록List 반환 (ajax)*/
	@PostMapping("/updateScFolder")
	@ResponseBody
	@Transactional
	public Map<String,Object> updateScFolder(@ModelAttribute ScFolderVO vo) {
		ScheduleVO scvo= new ScheduleVO();//xml에서 sql을 이용한 if 구절이 있기 때문에 vo를 따로 만들어서 넣음
		scvo.setScheduleFolderNo(vo.getScheduleFolderNo());
		scvo.setScheduleColor(vo.getScheduleFolderColor());
		service.updateScheduleByScFolderNo(scvo);//일정목록명에 해당되는 일정 업데이트
		sfService.updateScFolderByScFolderNo(vo);// 일정목록번호와 맞는 일정목록 업데이트
		List<ScheduleVO> list = service.selectAllScheduleByScFolderNo(vo.getScheduleFolderNo());
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(vo.getEmpNo());
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("sfList", sfList);
		rmap.put("list", list);
		
		return rmap;
	}
	
	/* 메인 페이지 */
	@GetMapping("/scheduleMain")
	public String Schedule(Model model, HttpServletRequest req){
		model.addAttribute("navNo",4);
		HttpSession session = req.getSession();
		
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(empNo);
		
		if(sfList.isEmpty() || sfList==null) { //만약 empNo의 일정목록명이 하나도 없다면 기본 일정목록 추가
			sfService.insertDefaultScFolder(empNo);
		}
		
		sfList= sfService.selectAllScFolderByEmpNo(empNo); //empNo의 일정목록명 반환
		model.addAttribute("sfList", sfList);
		return "schedule/scheduleMain";
	}
	
	/* empNo의 전체 일정 반환 AJAX */
	@GetMapping("/listSchedule")
	@ResponseBody
	public List<ScheduleVO> listSchedule(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
	
		
		List<ScheduleVO> list = service.selectAllScheduleByEmpNo(empNo);
		
		return list;
		
	}
	
	/* 일정번호와 맞는 일정 정보, 일정목록명번호와 맞는 일정목록명 반환 AJAX */
	@PostMapping("/selectScheduleByScheduleNo")
	@ResponseBody
	public Map<String,Object> selectScheduleByScheduleNo(@RequestBody int scheduleNo){
		Map<String,Object> map = new HashMap<>();
	
		ScheduleVO scvo = service.selectScheduleByScheduleNo(scheduleNo);
		ScFolderVO scfvo = sfService.selectScFolderByScFolderNo(scvo.getScheduleFolderNo());
		map.put("scFolderName", scfvo.getScheduleFolderName());
		map.put("scvo", scvo);
		return map;
		
	}
	
	/* 일정번호와 맞는 일정정보 삭제 AJAX */
	@PostMapping("/deleteScheduleByScheduleNo")
	@ResponseBody
	public int deleteScheduleByScheduleNo(@RequestBody int scheduleNo){
		service.deleteScheduleByScheduleNo(scheduleNo);
		
		return 1;
	}
	
	/* empNo의 일정목록List 반환  AJAX*/
	@GetMapping("/listScFolder")
	@ResponseBody
	public List<ScFolderVO> listScFolder(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		List<ScFolderVO> list = sfService.selectAllScFolderByEmpNo(empNo);
		
		return list;
	}
	
	/* 일정 목록 번호에 맞는 일정List 반환 AJAX*/
	@PostMapping("/listScheduleByScFolderNo")
	@ResponseBody
	public List<ScheduleVO> listScheduleByScFolderNo(@RequestBody int scFolderNo){
		
		List<ScheduleVO> list = service.selectAllScheduleByScFolderNo(scFolderNo);
		
		return list;
	}
	
	/* 일정 등록 페이지 */
	@GetMapping("/write")
	public String write(Model model, HttpServletRequest req) {
		model.addAttribute("navNo",4);
		HttpSession session = req.getSession();
		
		
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		List<ScFolderVO> sfList= sfService.selectAllScFolderByEmpNo(empNo);
		if(sfList.isEmpty() || sfList==null) {
			sfService.insertDefaultScFolder(empNo);
		}
		sfList= sfService.selectAllScFolderByEmpNo(empNo);
		model.addAttribute("sfList", sfList);
		
		return "schedule/write";

	}
	
	/* 등록페이지에서 일정 등록 후 main페이지로 이동 */
	@PostMapping("/write")
	public String writeok(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		
		
		return "redirect:/schedule/scheduleMain";
		
	}
}
