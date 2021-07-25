package com.it.lylj.assiduity.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.attend.model.AttendService;
import com.it.lylj.attend.model.AttendVO;
import com.it.lylj.attendDay.model.AttendDayService;
import com.it.lylj.attendDay.model.AttendDayVO;
import com.it.lylj.attendDay.model.ConditionViewVO;
import com.it.lylj.breakDay.model.BreakDayService;
import com.it.lylj.breakDay.model.BreakDayVO;
import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.PaginationInfo;
import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;
import com.it.lylj.schedule.controller.ScheduleController;
import com.it.lylj.schedule.model.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/assiduity")
@RequiredArgsConstructor
public class AssiduityController {
	private final AttendDayService attendDayService;
	private final AttendService attendService;
	private final BreakDayService breakDayService;
	private final EmpService empService;
	
	private static final Logger logger
	=LoggerFactory.getLogger(ScheduleController.class);

	
	@GetMapping("/insertComTime")
	@ResponseBody
	public int insertComTime(AttendDayVO vo){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		attendDayService.insertAttendDay(vo);
		
		Date comet= vo.getAttendanceDayOnHour();
		Date regt= vo.getAttendanceDayRegdate();
		
		regt.setHours(10);
		if(comet.getTime()>regt.getTime()) {
			attendService.updateLateAttendByEmpNo(vo.getEmpNo());
		}
		
		return 1;
	}//ajax 출근 입력하기
	
	@GetMapping("/updateLeaveTime")
	@ResponseBody
	public int updateLeaveTime(AttendDayVO vo){
		
		attendDayService.updateAttendDay(vo);
		
		
		return 1;
	}//ajax 근태 퇴근,근무시간 업데이트하기
	
	@GetMapping("/conditionMonthView")
	@ResponseBody
	public HashMap<String,Object> conditionMonthView(int departmentNo, String selectDate, int selectNum,int timeNum, String searchKeyword){
		HashMap<String, Object> map = new HashMap<>();
		map.put("departmentNo", departmentNo);
		map.put("selectDate", selectDate);
		map.put("selectNum", selectNum);
		map.put("timeNum", timeNum);
		map.put("searchKeyword", searchKeyword);
		
		
		
		List<Map<String,Object>> conditionSumList = attendDayService.selectSumConditionByGroup(map);
		List<ConditionViewVO> conditionList = attendDayService.selectAllConditionByDepartMent(map);
		
		logger.info("conditionList={}",conditionList);
		HashMap<String, Object> data = new HashMap<>();
		data.put("conditionSumList", conditionSumList);
		data.put("conditionList", conditionList);
		
		return data;
	}//ajax 근태 현황 목록
	
	@GetMapping("/selectAttendDayView")
	@ResponseBody
	public AttendDayVO selectAttendDayView(AttendDayVO vo){
		
		AttendDayVO attendDayVo = attendDayService.selectAttendDayByRegdate(vo);
		
		return attendDayVo;
	}//ajax 로그인된 사원의 특정 날짜 근태 정보 불러오기
	
	@GetMapping("/selectMonthSumTime")
	@ResponseBody
	public int selectMonthSumTime(int empNo,String nowDate){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("nowDate", nowDate);
		int data = attendDayService.selectSumMonthWork(map);
		
		return data;
	}//ajax 선택된 달의 누적근무
	
	@GetMapping("/selectMonthExTime")
	@ResponseBody
	public int selectMonthExTime(int empNo,String nowDate){

		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("nowDate", nowDate);
		int data = attendDayService.selectSumMonthWorkEx(map);
		
		return data;
	}//ajax 선택된 달의 초과 근무
	
	@GetMapping("/currentList")
	@ResponseBody
	public HashMap<String,Object> currentList(int empNo,int currentPage, int btCheck){
		
		if(btCheck==1) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN + 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;
		}else if(btCheck == 2) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN - 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;			
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("currentPage", currentPage);
		
		int TotalRecord = breakDayService.selectCntAllBREAKDAYByEmpNo(empNo);
		List<BreakDayVO> breakdayList = breakDayService.selectAllBREAKDAYByEmpNo(map);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(currentPage);
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE_ANN);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_ANN);
		pagingInfo.setTotalRecord(TotalRecord);
		
		HashMap<String, Object> data = new HashMap<>();
		logger.info("list={}",breakdayList);
		data.put("pagingInfo", pagingInfo);
		data.put("breakdayList", breakdayList);
		
		return data;
	}//ajax 선택된 페이지로 
	
	
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
		
		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("empNo",empNo);
		Date nowDate = new Date();
		map2.put("nowDate", sdf.format(nowDate));
		
		int selectSumWeekWork = attendDayService.selectSumWeekWork(empNo);
		int selectSumMonthWork = attendDayService.selectSumMonthWork(map2);
		int selectSumWeekWorkEx = attendDayService.selectSumWeekWorkEx(empNo);
		int selectSumMonthWorkEx = attendDayService.selectSumMonthWorkEx(map2);
		int selectLeftTimeWeek = attendDayService.selectLeftTimeWeek(empNo);
		
		model.addAttribute("attendMonthList", attendMonthList);
		model.addAttribute("weekTimelist", weekTimelist);
		model.addAttribute("selectSumMonthWork", selectSumMonthWork);
		model.addAttribute("selectSumWeekWork", selectSumWeekWork);
		model.addAttribute("selectSumMonthWorkEx", selectSumMonthWorkEx);
		model.addAttribute("selectSumWeekWorkEx", selectSumWeekWorkEx);
		model.addAttribute("selectLeftTimeWeek", selectLeftTimeWeek);
	
		
	}//main 페이지
	
	@Transactional
	@GetMapping("/annual")
	public void annual(Model model, HttpServletRequest req) {
		model = topView(req,model);
		HttpSession session =req.getSession();
		int empNo = Integer.parseInt((String)session.getAttribute("empNo"));
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("currentPage", 1);
		
		AttendVO attendVo = attendService.selectAttendByEmpNo(empNo);
		List<BreakDayVO> breakDayList = breakDayService.selectAllBREAKDAYByEmpNo(map);
		EmpVO empVo = empService.selectByEmpNo(empNo);
		PaginationInfo pagingInfo = new PaginationInfo();
		int TotalRecord = breakDayService.selectCntAllBREAKDAYByEmpNo(empNo);
		
		pagingInfo.setCurrentPage(1);
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE_ANN);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_ANN);
		pagingInfo.setTotalRecord(TotalRecord);
		
		model.addAttribute("empVo", empVo);
		model.addAttribute("attendVo", attendVo);
		model.addAttribute("breakDayList", breakDayList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		
	}//휴가 페이지
	
	@GetMapping("/condition")
	public void condition(Model model, HttpServletRequest req) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		model = topView(req,model);
		HttpSession session =req.getSession();
		int departmentNo = (Integer)session.getAttribute("departmentNo");
		String selectDate = sdf.format(new Date());
		HashMap<String, Object> map = new HashMap<>();
		map.put("departmentNo", departmentNo);
		map.put("selectDate", selectDate);
		map.put("selectNum", 0);
		map.put("timeNum", 0);
		map.put("searchKeyword", 0);
		
		Calendar cal = new GregorianCalendar();
		int nowDay =cal.get(Calendar.DAY_OF_WEEK)-1;
		cal.add(Calendar.DATE, nowDay);
		Date now = cal.getTime();
		now.setHours(0);
		now.setMinutes(0);
		now.setSeconds(0);
		long nowMili = now.getTime()/1000;
		
		
		List<Map<String,Object>> conditionSumList = attendDayService.selectSumConditionByGroup(map);
		List<ConditionViewVO> conditionList = attendDayService.selectAllConditionByDepartMent(map);
		
		model.addAttribute("conditionList", conditionList);
		model.addAttribute("conditionSumList", conditionSumList);
		model.addAttribute("nowMili", nowMili);
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
