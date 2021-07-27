package com.it.lylj.booking.controller;

import java.util.HashMap;
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

import com.it.lylj.attendDay.model.ConditionViewVO;
import com.it.lylj.boFol.model.BoFolService;
import com.it.lylj.boFol.model.BoFolVO;
import com.it.lylj.boTarget.model.BoTargetService;
import com.it.lylj.boTarget.model.BoTargetVO;
import com.it.lylj.booking.model.BookingService;
import com.it.lylj.booking.model.BookingVO;
import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.PaginationInfo;
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
	private final ScheduleService scheduleService;
	
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
	
	@GetMapping("/property")
	public void property(Model model) {
		model.addAttribute("navNo",8);
	}//예약 관리 페이지
	
	@GetMapping("/calDraw")
	@ResponseBody
	public List<BoTargetVO> calDraw(){
		List<BoTargetVO> data=boTargetService.selectAllBoTarget();
		
		return data;
	}//ajax 모든타켓 가져오기
	
	@GetMapping("/targetSer")
	@ResponseBody
	public int targetSer(int ser, BoTargetVO vo){
		
		if(ser==1) {
			boTargetService.insertBoTarget(vo);
		}else if(ser==2) {
			boTargetService.updateBorTarget(vo);
		}else if(ser==3) {
			boTargetService.deleteBorTarget(vo.getBookingTargetNo());
		}
		
		return 1;
	}//ajax 타켓  추가 수정 삭제
	
	@GetMapping("/folSer")
	@ResponseBody
	public int folSer(int ser, BoFolVO vo){
		
		if(ser==1) {
			boFolservice.insertBoFol(vo);
		}else if(ser==2) {
			boFolservice.updateBoFol(vo);
		}else if(ser==3) {
			boFolservice.deleteBoFol(vo.getBookingFolderNo());
		}
		
		return 1;
	}//ajax 목록 추가 수정 삭제
	
	
	@GetMapping("/propertySelView")
	@ResponseBody
	public HashMap<String, Object> propertySelView(int raCheck){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(raCheck==0) {
			List<BoFolVO> boFolList = boFolservice.selectAllBoFol();
			map.put("boFolList", boFolList);
			logger.info("boFolList={}",boFolList);
		}else {
			List<BoTargetVO> boTargetList = boTargetService.selectAllBoTarget();
			map.put("boTargetList", boTargetList);
			logger.info("boTargetList={}",boTargetList);
		}
		
		return map;
	}//ajax 타켓,목록 중 선택 가져오기
	
	@GetMapping("/selectAllApp")
	@ResponseBody
	public HashMap<String, Object> selectAllApp(int currentPage, int btCheck){
		HashMap<String, Object> map = new HashMap<>();
		
		if(btCheck==1) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN + 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;
		}else if(btCheck == 2) {
			int block =currentPage/ConstUtil.BLOCK_SIZE_ANN - 1;
			currentPage= block*ConstUtil.BLOCK_SIZE_ANN +1;			
		}
		
		List<BookingVO> bookingList= bookingService.selectAllBookingByAppFlag(currentPage); 
		
		map.put("bookingList", bookingList);
		
		int TotalRecord = bookingService.selectCntAllByAppFlag();
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(currentPage);
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE_ANN);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_ANN);
		pagingInfo.setTotalRecord(TotalRecord);
		map.put("pagingInfo", pagingInfo);
		
		logger.info("bookingList={}",bookingList);
		return map;
	}//ajax 대기중인 예약 리스트 가져오기
	
	@GetMapping("/updateAppFlag")
	@ResponseBody
	public int updateAppFlag(int bookingNo, String bookingAppFlag, int scheduleNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookingNo", bookingNo);
		map.put("bookingAppFlag", bookingAppFlag);
		bookingService.updateBokkingByBookingNo(map);
		if(bookingAppFlag.equals("1")) {
			scheduleService.deleteScheduleByScheduleNo(scheduleNo);
		}
		
		return 1;
	}//ajax AppFlag 업데이트
	
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
