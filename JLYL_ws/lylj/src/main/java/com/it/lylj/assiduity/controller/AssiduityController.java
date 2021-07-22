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
	
	
	@GetMapping("/selectMonthWorkTime")
	@ResponseBody
	public List<Integer> selectMonthWorkTime(String selectDate, int empNo){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int ym = selectDate.indexOf("-");

		int year = Integer.parseInt(selectDate.substring(0, ym));
		int month = Integer.parseInt(selectDate.substring(ym+1))-1;
		Calendar firstDate = new GregorianCalendar(year, month, 1);
		int maxday = firstDate.getActualMaximum(Calendar.DAY_OF_MONTH);
		

		List<Integer> weekTimelist = new ArrayList<>(); 
		int firstDay = firstDate.get(Calendar.DAY_OF_WEEK)-1;
		int weekCheck=1;
		for(int i=1; i<=maxday; i++) {
			Calendar date=new GregorianCalendar(year,month,i);
			int weekNum = (int)Math.ceil((i + firstDay)/7.0);
			
			if(weekCheck<weekNum) {
				date.add(Calendar.DATE, -1);
				HashMap<String, Object> map = new HashMap<>();
				
				map.put("startDate", sdf.format(firstDate.getTime()));
				map.put("endDate", sdf.format(date.getTime()));
				map.put("empNo",empNo);
				
				weekTimelist.add(attendDayService.selectSumWeekWorkByMonth(map));
				firstDate = new GregorianCalendar(year,month,i);
				weekCheck++;
			}else if(i==maxday) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("startDate", sdf.format(firstDate.getTime()));
				map.put("endDate", sdf.format(date.getTime()));
				map.put("empNo",empNo);
				
				weekTimelist.add(attendDayService.selectSumWeekWorkByMonth(map));
			}
		}
		
		return weekTimelist;
	}//ajax 월 변경시 주간 근무 시간
	
	@GetMapping("/selectMonth")
	@ResponseBody
	public List<AttendDayVO> selectMonth(String selectDate, int empNo){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int ym = selectDate.indexOf("-");

		int year = Integer.parseInt(selectDate.substring(0, ym));
		int month = Integer.parseInt(selectDate.substring(ym+1))-1;
		Calendar firstDate = new GregorianCalendar(year, month, 1);
		int maxday = firstDate.getActualMaximum(Calendar.DAY_OF_MONTH);
		Calendar lastDate = new GregorianCalendar(year,month,maxday);
		
		int pday = firstDate.get(Calendar.DAY_OF_WEEK)-1;
		int fday = 7-lastDate.get(Calendar.DAY_OF_WEEK);
		
		firstDate.add(Calendar.DATE, -pday);
		lastDate.add(Calendar.DATE, fday);
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo",empNo);
		map.put("firstDate", sdf.format(firstDate.getTime()));
		map.put("lastDate", sdf.format(lastDate.getTime()));
		
		List<AttendDayVO> aMList= attendDayService.selectAttendMonth(map);
		int aMListSize = aMList.size();
		int aMListNum=0;
		
		long  distinction = (lastDate.getTimeInMillis()-firstDate.getTimeInMillis())/1000;
		distinction /= 24*60*60;
		
		List<AttendDayVO> attendMonthList = new ArrayList<AttendDayVO>();
		for(int i=0; i<=distinction; i++) {
			AttendDayVO emptyAttendVo = new AttendDayVO();
			
			
			if(aMListNum<aMListSize && sdf.format(firstDate.getTime()).equals(sdf.format(aMList.get(aMListNum).getAttendanceDayRegdate()))) {
				attendMonthList.add(aMList.get(aMListNum));
				aMListNum++;
			}else{
				attendMonthList.add(emptyAttendVo);
			}
			firstDate.add(Calendar.DATE, 1);
			
		}
		
		return attendMonthList;
	}//ajax 월 변경시 그 월의 정보 불러오기
	
	
	
	@GetMapping("/main")
	public void main(Model model, HttpServletRequest req) {
		model = topView(req,model);
		HttpSession session =req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
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
				map.put("empNo",empNo);
				
				weekTimelist.add(attendDayService.selectSumWeekWorkByMonth(map));
				startDate = new GregorianCalendar(year,month,i);
				weekCheck++;
			}else if(i==maxday) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("startDate", sdf.format(startDate.getTime()));
				map.put("endDate", sdf.format(date.getTime()));
				map.put("empNo",empNo);
				
				weekTimelist.add(attendDayService.selectSumWeekWorkByMonth(map));
			}
		}
		
		Calendar firstDate=new GregorianCalendar(year,month,1);
		Calendar lastDate=new GregorianCalendar(year,month,maxday);
		
		int pday = firstDate.get(Calendar.DAY_OF_WEEK)-1;
		int fday = 7-lastDate.get(Calendar.DAY_OF_WEEK);
		
		firstDate.add(Calendar.DATE, -pday);
		lastDate.add(Calendar.DATE, fday);
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo",empNo);
		map.put("firstDate", sdf.format(firstDate.getTime()));
		map.put("lastDate", sdf.format(lastDate.getTime()));
		
		List<AttendDayVO> aMList= attendDayService.selectAttendMonth(map);
		int aMListSize = aMList.size();
		int aMListNum=0;
		
		long  distinction = (lastDate.getTimeInMillis()-firstDate.getTimeInMillis())/1000;
		distinction /= 24*60*60;
		
		List<AttendDayVO> attendMonthList = new ArrayList<AttendDayVO>();
		for(int i=0; i<=distinction; i++) {
			AttendDayVO emptyAttendVo = new AttendDayVO();
			
			if(aMListNum<aMListSize && sdf.format(firstDate.getTime()).equals(sdf.format(aMList.get(aMListNum).getAttendanceDayRegdate()))) {
				attendMonthList.add(aMList.get(aMListNum));
				aMListNum++;
			}else{
				attendMonthList.add(emptyAttendVo);
			}
			firstDate.add(Calendar.DATE, 1);
			
		}
		
		
		int selectSumWeekWork = attendDayService.selectSumWeekWork();
		int selectSumMonthWork = attendDayService.selectSumMonthWork();
		int selectSumWeekWorkEx = attendDayService.selectSumWeekWorkEx();
		int selectSumMonthWorkEx = attendDayService.selectSumMonthWorkEx();
		
		
		model.addAttribute("attendMonthList", attendMonthList);
		model.addAttribute("weekTimelist", weekTimelist);
		model.addAttribute("selectSumMonthWork", selectSumMonthWork);
		model.addAttribute("selectSumWeekWork", selectSumWeekWork);
		model.addAttribute("selectSumMonthWorkEx", selectSumMonthWorkEx);
		model.addAttribute("selectSumWeekWorkEx", selectSumWeekWorkEx);
	
		
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
