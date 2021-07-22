package com.it.lylj.assiduity.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.attendDay.model.AttendDayService;
import com.it.lylj.attendDay.model.AttendDayVO;
import com.it.lylj.schedule.controller.ScheduleController;
import com.it.lylj.schedule.model.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/assiduity")
@RequiredArgsConstructor
public class AssiduityController {
	private final AttendDayService attendDayService;
	
	private static final Logger logger
	=LoggerFactory.getLogger(ScheduleController.class);

	
	@GetMapping("/insertComTime")
	@ResponseBody
	public int insertComTime(AttendDayVO vo){
		
		attendDayService.insertAttendDay(vo);
		
		return 1;
	}//ajax 출근 입력하기
	
	@GetMapping("/updateLeaveTime")
	@ResponseBody
	public int updateLeaveTime(AttendDayVO vo){
		
		attendDayService.updateAttendDayByOffHour(vo);
		
		return 1;
	}//ajax 근태 퇴근,근무시간 업데이트하기
	
	@GetMapping("/selectAttendDayView")
	@ResponseBody
	public AttendDayVO selectAttendDayView(AttendDayVO vo){
		
		AttendDayVO attendDayVo = attendDayService.selectAttendDayByRegdate(vo);
		
		return attendDayVo;
	}//ajax 로그인된 사원의 특정 날짜 근태 정보 불러오기
	
	
	
	@GetMapping("/main")
	public void main(Model model, HttpServletRequest req) {
		model = topView(req,model);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = new GregorianCalendar();
		int year = cal.get(Calendar.YEAR);
		int month =cal.get(Calendar.MONTH);
		int maxday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<Integer> weekTimelist = new ArrayList<>(); 
		Calendar startDate= new GregorianCalendar(year,month,1);
		int firstDay = startDate.get(Calendar.DAY_OF_WEEK)-1;
		int weekCheck=1;
		for(int i=1; i<=maxday; i++) {
			Calendar date=new GregorianCalendar(year,month,i);
			int weekNum = (int)Math.ceil((i + firstDay)/7.0);
			
			if(weekCheck<weekNum) {
				date.add(Calendar.DATE, -1);
				HashMap<String, Object> map = new HashMap<>();
				
				map.put("startDate", sdf.format(startDate.getTime()));
				map.put("endDate", sdf.format(date.getTime()));
				
				weekTimelist.add(attendDayService.selectSumWeekWorkByMonth(map));
				startDate = new GregorianCalendar(year,month,i);
				weekCheck++;
			}else if(i==maxday) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("startDate", sdf.format(startDate.getTime()));
				map.put("endDate", sdf.format(date.getTime()));
				
				weekTimelist.add(attendDayService.selectSumWeekWorkByMonth(map));
			}
		}
		
		model.addAttribute("weekTimelist", weekTimelist);
		
	}//main 페이지
	
	@GetMapping("/annual")
	public void annual(Model model, HttpServletRequest req) {
		model = topView(req,model);
	}//휴가 페이지
	
	@GetMapping("/condition")
	public void condition(Model model, HttpServletRequest req) {
		model = topView(req,model);
	}//근태 현황 페이지
	
	@GetMapping("/stats")
	public void stats(Model model, HttpServletRequest req) {
		model = topView(req,model);
	}//근태 통계 페이지
	
	
	
	public Model topView(HttpServletRequest req,Model model) {
		Date today =new Date();
		HttpSession session =req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		
		AttendDayVO attendDayVo = new AttendDayVO();
		attendDayVo.setAttendanceDayRegdate(today);
		attendDayVo.setEmpNo(empNo);
		
		AttendDayVO attendDayVo2 = attendDayService.selectAttendDayByRegdate(attendDayVo);
		
		model.addAttribute("navNo",3);
		model.addAttribute("attendDayVo", attendDayVo2);
		
		return model;
	}
}
