package com.it.lylj.booking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.boFol.model.BoFolService;
import com.it.lylj.boFol.model.BoFolVO;
import com.it.lylj.boTarget.model.BoTargetService;
import com.it.lylj.boTarget.model.BoTargetVO;
import com.it.lylj.booking.model.BookingService;
import com.it.lylj.booking.model.BookingVO;
import com.it.lylj.emp.model.EmpDAO;
import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;
import com.it.lylj.schedule.controller.ScheduleController;
import com.it.lylj.schedule.model.ScheduleService;
import com.it.lylj.schedule.model.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/booking")
@RequiredArgsConstructor
public class BookingController {
	private final BoFolService boFolservice;
	private final BoTargetService boTargetService;
	private final ScheduleService scService;
	private final BookingService bookingService;
	
	private static final Logger logger
	=LoggerFactory.getLogger(ScheduleController.class);
	
	@GetMapping("/main")
	public void main(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		model = topModel(model);
		List<BookingVO> bookingList = bookingService.selectAllBookingByEmpNo(empNo);
		model.addAttribute("bookingList", bookingList);
		
	}//main 페이지
	
	
	@GetMapping("/assetInfo")
	public void assetInfo(Model model, @RequestParam int bookingTargetNo, @RequestParam int bookingFolderNo ) {
		model = topModel(model);
		model.addAttribute("bTNo", bookingTargetNo);
		model.addAttribute("bFNo", bookingFolderNo);
	}//예약 정보 페이지
	
	
	@GetMapping("/rent")
	public void rent(Model model) {
		model.addAttribute("navNo",8);
	}//예약 관리 페이지
	
	@GetMapping("/calDraw")
	@ResponseBody
	public List<BoTargetVO> calDraw(){
		List<BoTargetVO> data=boTargetService.selectAllBoTarget();
		
		return data;
	}//ajax 모든타켓 가져오기
	
	@PostMapping("/calDrawByBTNo")
	@ResponseBody
	public List<ScheduleVO> calDrawByBTNo(@RequestParam int bTNo){
		List<ScheduleVO> data=scService.selectAllScheduleByBTNo(bTNo);
		
		return data;
	}//ajax 특정 타겟 가져오기
	
	@PostMapping("/insertSchedule")
	@ResponseBody
	@Transactional
	public int insertSchedule(@RequestBody ScheduleVO scheduleVO) {
		logger.info("insertSchedule 업데이트, 파라미터 scheduleVO = {}", scheduleVO);
		scService.insertSchedule(scheduleVO);
		int maxScNo = scService.selectMaxScNoByEmpNo(scheduleVO.getEmpNo());
		
		BookingVO bookingVo = new BookingVO();
		bookingVo.setBookingContent(scheduleVO.getScheduleContent());
		bookingVo.setBookingEnd(scheduleVO.getScheduleEnd());
		bookingVo.setBookingStart(scheduleVO.getScheduleStart());
		bookingVo.setBookingTargetNo(scheduleVO.getBookingTargetNo());
		bookingVo.setEmpNo(scheduleVO.getEmpNo());
		bookingVo.setScheduleNo(maxScNo);
		
		logger.info("insertSchedule 업데이트, 파라미터 bookingVo = {}", bookingVo);
		
		bookingService.insertBooking(bookingVo);
		
		int no = scService.selectMaxScNoByEmpNo(scheduleVO.getEmpNo());
		
		return no;
	}//ajax 특정 타겟 일정 추가
	
	@GetMapping("/selectAllSchedule")
	@ResponseBody
	public List<ScheduleVO> selectAllSchedule(){	
		List<ScheduleVO> list = scService.selectAllScheduleByScThemeNo(2);
		
		return list;
		
	}//ajax 전체 일정 불러오기
	
	
	public Model topModel(Model model) {
		model.addAttribute("navNo",7);
		List<BoFolVO> boFolList = boFolservice.selectAllBoFol();
		List<BoTargetVO> boTargetList = boTargetService.selectAllBoTarget();
	
		model.addAttribute("boFolList", boFolList);
		model.addAttribute("boTargetList", boTargetList);
		return model;
	}//top.jsp 모델
}
