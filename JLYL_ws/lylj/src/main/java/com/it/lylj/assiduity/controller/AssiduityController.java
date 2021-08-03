package com.it.lylj.assiduity.controller;

import java.io.Console;
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

	/* 출근시 AttendDay 등록 AJAX*/
	@GetMapping("/insertComTime")
	@ResponseBody
	public int insertComTime(AttendDayVO vo){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		attendDayService.insertAttendDay(vo); // AttendDay 등록
		
		Date comet= vo.getAttendanceDayOnHour();
		Date regt= vo.getAttendanceDayRegdate();
		
		regt.setHours(10);
		if(comet.getTime()>regt.getTime()) {// 지각이면 Attend의 지각수 증가
			attendService.updateLateAttendByEmpNo(vo.getEmpNo());
		}
		
		return 1;
	}
	
	/* 퇴근시 attendDay 퇴근시간, 근무시간 업데이트 AJAX*/
	@GetMapping("/updateLeaveTime")
	@ResponseBody
	public int updateLeaveTime(AttendDayVO vo){
		attendDayService.updateAttendDay(vo);
		return 1;
	}
	
	/* 초과근무 승인여부 업데이트 AJAX*/
	@GetMapping("/updateExcess")
	@ResponseBody
	public int updateExcess(int attendanceDayNo, int flag){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("attendanceDayNo",attendanceDayNo);
		map.put("flag",flag);
		attendDayService.updateAttendDayByFlag(map);
		
		return 1;
	}
	
	/* 초과근무 승인대기 List 반환 AJAX*/
	@GetMapping("/excessView")
	@ResponseBody
	public HashMap<String, Object> excessView(int btCheck, int currentPage){
		/* 페이징 블럭 만큼만 초과근무 승인 List 조회*/
		HashMap<String, Object> map = new HashMap<>();
		if(btCheck==1) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN + 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;
		}else if(btCheck == 2) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN - 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;			
		}
		
		List<ConditionViewVO> conditionList= attendDayService.selectAttendDayByFlag(currentPage);
		map.put("conditionList", conditionList);
		
		/* 페이징 정보 */
		int TotalRecord = attendDayService.selecCnttAttendDayByFlag();
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(currentPage);
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE_ANN);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_ANN);
		pagingInfo.setTotalRecord(TotalRecord);
		map.put("pagingInfo", pagingInfo);
		
		logger.info("conditionList={}",conditionList);
		return map;
	}
	
	/* 근태 현황 해당 날짜 달의 conditionView List 반환 AJAX*/
	@GetMapping("/conditionMonthView")
	@ResponseBody
	public HashMap<String,Object> conditionMonthView(int departmentNo, String selectDate, int selectNum,int timeNum, String searchKeyword){
		HashMap<String, Object> map = new HashMap<>();
		map.put("departmentNo", departmentNo);
		map.put("selectDate", selectDate);
		map.put("selectNum", selectNum);
		map.put("timeNum", timeNum);
		map.put("searchKeyword", searchKeyword);
		
		List<Map<String,Object>> conditionSumList = attendDayService.selectSumConditionByGroup(map);//누적시간, 초과시간, 일한시간 조회
		List<ConditionViewVO> conditionList = attendDayService.selectAllConditionByDepartMent(map);//부서별 모든 conditionview 조회
		
		logger.info("conditionList={}",conditionList);
		HashMap<String, Object> data = new HashMap<>();
		data.put("conditionSumList", conditionSumList);
		data.put("conditionList", conditionList);
		
		return data;
	}
	
	/* 근태 통계 목록 List AJAX*/
	@GetMapping("/statsView")
	@ResponseBody
	public HashMap<String, Object> statsView(int selectItem1,int selectItem2,int selectItem3, String searchEmp,
											String searchDepart, String startDate,String endDate,String selectDate,
											int currentPage,int btCheck){
		/* 엑셀다운용 List 및 검색조건에 따른 List 반환 메서드의 매개변수용 map */
		HashMap<String, Object> map = new HashMap<>();
		HashMap<String, Object> map2 = new HashMap<>();
		map.put("selectItem1", selectItem1);
		map.put("selectItem2", selectItem2);
		map.put("selectItem3", selectItem3);
		map.put("searchEmp", searchEmp);
		map.put("searchDepart", searchDepart);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("selectDate", selectDate);
		
		map2.put("selectItem1", selectItem1);
		map2.put("selectItem2", selectItem2);
		map2.put("selectItem3", selectItem3);
		map2.put("searchEmp", searchEmp);
		map2.put("searchDepart", searchDepart);
		map2.put("startDate", startDate);
		map2.put("endDate", endDate);
		map2.put("selectDate", selectDate);
		
		if(btCheck==1) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN + 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;
		}else if(btCheck == 2) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN - 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;			
		}
		map2.put("currentPage", currentPage);
		
		List<ConditionViewVO> conditionList = attendDayService.selectAllConditionByMonth(map);//검색 view용 List
		List<ConditionViewVO> conditionList2 = attendDayService.selectAllConditionByMonth(map2);//엑셀 다운용 List
		int empCnt = attendDayService.selectCntConditionByMonth(map);
		int breakCnt = attendDayService.selectCntBreakDayByMonth(map);
		int TotalRecord = attendDayService.selectAllCntConditionByMonth(map);
		
		/* 페이징 정보 */
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(currentPage);
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE_ANN);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_ANN);
		pagingInfo.setTotalRecord(TotalRecord);
		
		logger.info("conditionList={}",conditionList);
		HashMap<String, Object> data = new HashMap<>();
		data.put("conditionList", conditionList);
		data.put("conditionList2", conditionList2);
		data.put("empCnt", empCnt);
		data.put("breakCnt", breakCnt);
		data.put("pagingInfo", pagingInfo);
		
		return data;
	}
	
	/* 로그인 사원의 특정 날짜 근태 정보 반환 AJAX*/
	@GetMapping("/selectAttendDayView")
	@ResponseBody
	public AttendDayVO selectAttendDayView(AttendDayVO vo){
		
		AttendDayVO attendDayVo = attendDayService.selectAttendDayByRegdate(vo);
		
		return attendDayVo;
	}
	
	/* 선택된 달의 누적근무 시간 반환 AJAX*/
	@GetMapping("/selectMonthSumTime")
	@ResponseBody
	public int selectMonthSumTime(int empNo,String nowDate){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("nowDate", nowDate);
		int data = attendDayService.selectSumMonthWork(map);
		
		return data;
	}
	
	/* 선택된 달의 초과 근무 반환 AJAX*/
	@GetMapping("/selectMonthExTime")
	@ResponseBody
	public int selectMonthExTime(int empNo,String nowDate){

		HashMap<String, Object> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("nowDate", nowDate);
		int data = attendDayService.selectSumMonthWorkEx(map);
		
		return data;
	}
	
	/* 로그인 사원의 휴가List 반환 AJAX*/
	@GetMapping("/currentList")
	@ResponseBody
	public HashMap<String,Object> currentList(int empNo,int currentPage, int btCheck){
		/* 페이징 블럭 만큼만 휴가 List 조회 AJAX*/
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
		
		/* 페이징 정보*/
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
	}
	
	/* 선택한 달의 주간 근무 시간 List 반환 AJAX*/
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
		for(int i=1; i<=maxday; i++) {//선택한 달의 첫날 부터 마지막날까지 반복
			Calendar date=new GregorianCalendar(year,month,i);
			int weekNum = (int)Math.ceil((i + firstDay)/7.0);
			
			if(weekCheck<weekNum) {//주차 검사
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
	}
	
	/* 선택한 월의 정보 List 반환 AJAX*/
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
	}
	
	
	/* 근태 main 페이지 */
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
		logger.info("selectSumWeekWork={}",selectSumWeekWork);
		model.addAttribute("attendMonthList", attendMonthList);
		model.addAttribute("weekTimelist", weekTimelist);
		model.addAttribute("selectSumMonthWork", selectSumMonthWork);
		model.addAttribute("selectSumWeekWork", selectSumWeekWork);
		model.addAttribute("selectSumMonthWorkEx", selectSumMonthWorkEx);
		model.addAttribute("selectSumWeekWorkEx", selectSumWeekWorkEx);
		model.addAttribute("selectLeftTimeWeek", selectLeftTimeWeek);
	
		
	}
	
	/* 휴가 페이지 */
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
		
		
	}
	
	/* 근태 현황 페이지 */
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
		cal.add(Calendar.DATE, -nowDay);
		Date now = cal.getTime();
		now.setHours(0);
		now.setMinutes(0);
		now.setSeconds(0);
		long nowMili = now.getTime()/1000;
		
		
		List<Map<String,Object>> conditionSumList = attendDayService.selectSumConditionByGroup(map);
		List<ConditionViewVO> conditionList = attendDayService.selectAllConditionByDepartMent(map);
		logger.info("conditionList={}",conditionList);
		model.addAttribute("conditionList", conditionList);
		model.addAttribute("conditionSumList", conditionSumList);
		model.addAttribute("nowMili", nowMili);
	}
	
	/* 근태 통계 페이지 */
	@GetMapping("/stats")
	public void stats(Model model, HttpServletRequest req) {
		model = topView(req,model);
		
		
	}
	
	/* 초과 근무 관리 페이지 */
	@GetMapping("/excess")
	public void excess(Model model) {
		model.addAttribute("navNo",8);
		
	}
	
	
	/* top의 출근시간,퇴근시간 정보 반환*/
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
