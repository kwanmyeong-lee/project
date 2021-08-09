package com.it.lylj.emp.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.attendDay.model.AttendDayService;
import com.it.lylj.attendDay.model.AttendDayVO;
import com.it.lylj.booking.model.BookingService;
import com.it.lylj.booking.model.BookingVO;
import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.FileUploadUtil;
import com.it.lylj.common.PaginationInfo;
import com.it.lylj.common.SearchVO;
import com.it.lylj.department.model.DepartmentService;
import com.it.lylj.department.model.DepartmentVO;
import com.it.lylj.electronic.model.ElectronicService;
import com.it.lylj.electronic.model.ElectronicVo;
import com.it.lylj.email.model.EmailService;
import com.it.lylj.email.model.EmailVO;
import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;
import com.it.lylj.position.model.PositionService;
import com.it.lylj.position.model.PositionVO;
import com.it.lylj.schedule.model.ScheduleService;

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
	private final PasswordEncoder passwordEncoder;
	private final EmailService emailService;
	private final ElectronicService eleService;
	private final BookingService bookingService;
	private final ScheduleService scheduleService;
	private final AttendDayService attendDayService;
	
	
	//사원등록페이지
	@GetMapping("/empWrite")
	public String empWrite(Model model) {
		//1
		logger.info("사원등록페이지");
		
		//2 직급, 부서명 가지고 오기
		List<PositionVO> positionList = positionService.selectAllPosition();
		List<DepartmentVO> departmentList = departmentService.selectAllDepartment();
		logger.info("positionList={}, departmentList={}", positionList, departmentList);
		
		//3 모델에 저장, 뷰페이지 리턴
		model.addAttribute("positionList", positionList);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("navNo", 8);
		
		return "emp/empWrite";
		
	}
	
	//사원등록처리
	@PostMapping("/empWrite")
	public String empWrite_post(@ModelAttribute EmpVO vo, HttpServletRequest request, Model model) {
		//1
		logger.info("사원등록처리, 파라미터 vo={}",vo);
		
		//2. 사진파일 업로드(단일파일)
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
		
		//3. 등록처리
		int cnt = empService.insertEmp(vo);
		logger.info("사원등록정보 vo={}",vo);
		logger.info("사원등록처리 성공여부, cnt={}",cnt);
		
		String msg ="등록실패", url="/emp/empWrite";
		if(cnt>0) {
			msg="등록성공";
			url="/emp/empList";
		}
		
		//4. 모델에 저장 및 리턴
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	/* 비밀번호 체크 */
	@ResponseBody
	@RequestMapping("/pwdCheck")
	public boolean pwdCheck(@RequestParam String empPwd ) {
		logger.info("비밀번호 chk, empPwd={}", empPwd);
		
		//2.
		//반환값 셋팅
		boolean chkPwd = false;
		
		//정규식 최소 8자, 최소 하나의 문자 및 하나의 숫자 포함
		String validPwd = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
		
		Pattern pt_symbol= Pattern.compile(validPwd);
		Matcher mt_symbol= pt_symbol.matcher(empPwd);
		
		if(mt_symbol.find()) {
			chkPwd=true;
		}
		
		//3. 리턴
		return chkPwd;
	}

	/* 사원정보 상세보기 */
	@GetMapping("/empInfo")
	public String empinfo(@RequestParam(defaultValue = "0")int empNo, HttpSession session ,Model model) {
		//1
		logger.info("사원정보디테일 페이지, 파라미터 empNo={}",empNo);
		
		//출퇴근 시간 체크 by 준경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		logger.info("메인페이지");
		int empNo2 = Integer.parseInt((String)session.getAttribute("empNo"));
		
		EmpVO empVO = empService.selectByEmpNo(empNo2);
		List<ElectronicVo> elist = eleService.selectUpdateToday(empNo2);
		List<BookingVO> bookingList2 = bookingService.selectAllBookingViewByEmpNo(empNo2);
		List<BookingVO> bookingList = new ArrayList<BookingVO>();
		Date startDate;
		Date endDate;
		for(int i=0; i<bookingList2.size(); i++) {
			try {
				startDate = sdf.parse(bookingList2.get(i).getBookingStart());
				endDate = sdf.parse(bookingList2.get(i).getBookingEnd());
				if(startDate.getTime()<now.getTime() && now.getTime()<endDate.getTime()) {
					bookingList.add(bookingList2.get(i));
				}
			} catch (ParseException e) {
			}
		}
		Date today = new Date();
		today.setHours(0);
		today.setMinutes(0);
		today.setSeconds(0);
		logger.info("strToday ={}",today);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo2);
		map.put("nowDate", today);
		int todayScheduleCnt= scheduleService.selectCntScheduleByToday(map);
		AttendDayVO atdVO = new AttendDayVO();
		atdVO.setEmpNo(empNo2);
		atdVO.setAttendanceDayRegdate(today);
		AttendDayVO attendDayVO = attendDayService.selectAttendDayByRegdate(atdVO);
		
		logger.info("elist={}", elist);

		//안읽은 메일 숫자
		int mailCount = emailService.totalCountByReadDateMain(empNo2);
		logger.info("index 안읽은 메일, mailCount={}",mailCount);
		//파라미터로 넘어온 정보
		EmpVO paramEmpVo = empService.selectByEmpNo(empNo);
		
		//모델에 저장, 뷰페이지 리턴
		model.addAttribute("elist", elist);
		model.addAttribute("empNo", empNo2);
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("todayScheduleCnt", todayScheduleCnt);
		model.addAttribute("attendDayVO", attendDayVO);
		model.addAttribute("empVO", empVO);
		model.addAttribute("mailCount", mailCount);
		model.addAttribute("paramEmpVo", paramEmpVo);

		return "emp/empInfo";
	}
	
	/* 사원정보 수정페이지보기 */
	@GetMapping("/empEdit")
	public String empEdit(@RequestParam(defaultValue = "0") int empNo, HttpSession session ,Model model) {
		logger.info("사원정보수정페이지, empNo={}", empNo);
		int adminLev = (int)session.getAttribute("empAdminLev");
		
		//출퇴근 시간 체크 by 준경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		logger.info("메인페이지");
		int empNo2 = Integer.parseInt((String)session.getAttribute("empNo"));
		
		EmpVO empVO = empService.selectByEmpNo(empNo2);
		List<ElectronicVo> elist = eleService.selectUpdateToday(empNo2);
		List<BookingVO> bookingList2 = bookingService.selectAllBookingViewByEmpNo(empNo2);
		List<BookingVO> bookingList = new ArrayList<BookingVO>();
		Date startDate;
		Date endDate;
		for(int i=0; i<bookingList2.size(); i++) {
			try {
				startDate = sdf.parse(bookingList2.get(i).getBookingStart());
				endDate = sdf.parse(bookingList2.get(i).getBookingEnd());
				if(startDate.getTime()<now.getTime() && now.getTime()<endDate.getTime()) {
					bookingList.add(bookingList2.get(i));
				}
			} catch (ParseException e) {
			}
		}
		Date today = new Date();
		today.setHours(0);
		today.setMinutes(0);
		today.setSeconds(0);
		logger.info("strToday ={}",today);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo2);
		map.put("nowDate", today);
		int todayScheduleCnt= scheduleService.selectCntScheduleByToday(map);
		AttendDayVO atdVO = new AttendDayVO();
		atdVO.setEmpNo(empNo2);
		atdVO.setAttendanceDayRegdate(today);
		AttendDayVO attendDayVO = attendDayService.selectAttendDayByRegdate(atdVO);
		
		logger.info("elist={}", elist);

		//안읽은 메일 숫자
		int mailCount = emailService.totalCountByReadDateMain(empNo2);
		logger.info("index 안읽은 메일, mailCount={}",mailCount);
		
		//수정할 EMP 정보 선택
		EmpVO empVo = empService.selectByEmpNo(empNo);
		logger.info("사원정보수정페이지, adminLev={}", adminLev);
		
		//모델 저장, 뷰페이지 리턴 => input태그에 정보 띄어주기 위함
		model.addAttribute("elist", elist);
		model.addAttribute("empNo", empNo2);
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("todayScheduleCnt", todayScheduleCnt);
		model.addAttribute("attendDayVO", attendDayVO);
		model.addAttribute("empVO", empVO);
		model.addAttribute("mailCount", mailCount);
		model.addAttribute("empVo", empVo);
		
		return "emp/empEdit";
	}
	
	/* 사원정보 수정처리 */
	@PostMapping("/empEdit")
	public String empEdit_post(@ModelAttribute EmpVO empVo, @RequestParam String mEmpNo, @RequestParam String loginEmpNo
			, @RequestParam String mEmpPwd, HttpServletRequest request, @RequestParam String oldFileName, Model model) {
		logger.info("사원정보 수정처리, vo={}", empVo);
		
		//비밀번호 수정 요청자의 사원번호, 비밀번호로 본인확인
		int result = empService.loginProc(Integer.parseInt(loginEmpNo), mEmpPwd);
		logger.info("정보확인,result={}",result);
		
		String msg="사원정보수정 실패", url="/emp/empEdit?empNo="+empVo.getEmpNo();
		//본인확인 후 결과처리
		if(result==EmpService.LOGIN_OK) {
			//사진파일 수정
			String fileUrl="";
			List<Map<String, Object>> list = null;
			try {
				list = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_EMP_FLAG);
				
				for(int i=0; i<list.size();i++ ) {
					Map<String, Object> map = list.get(i);
					fileUrl = (String)map.get("fileName");
				}
				
				logger.info("파일 업로드 성공, fileUrl={}",fileUrl);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			empVo.setEmpPhoto(fileUrl);
			
			//정보 수정 처리
			int cnt = empService.updateEmp(empVo);
			logger.info("사원정보수정여부 cnt={}",cnt);
			if(cnt>0) {
				msg="사원정보가 수정되었습니다.";
				url="/emp/empInfo?empNo="+empVo.getEmpNo();
				
				//사진파일 수정시 기존파일 삭제
				if(!list.isEmpty()) {
	            	if(oldFileName!=null && !oldFileName.isEmpty()) {
	            		File oldFile = new File(fileUploadUtil.getUploadPath(request,ConstUtil.UPLOAD_EMP_FLAG), oldFileName);
	            		if(oldFile.exists()) {
	            			boolean bool = oldFile.delete();
	            			logger.info("기존파일 삭제여부 : {}", bool);
	            		}
	            	}
	            }//
			}
			
		}else if(result==EmpService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/* 사원리스트 보기 */
	@RequestMapping("/empList")
	public String empList(@ModelAttribute SearchVO searchVo , Model model) {
		logger.info("사원정보리스트 페이지");
		
		//2
		//페이징 처리
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());			 
		pagingInfo.setBlockSize(ConstUtil.EMP_BLOCK_SIZE); 	 
		pagingInfo.setRecordCountPerPage(ConstUtil.EMP_RECORD_COUNT);
		searchVo.setRecordCountPerPage(ConstUtil.EMP_RECORD_COUNT);		 
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo={}",searchVo);
		
		//사원목록선택
		List<EmpVO> empList = empService.selectAllEmpList(searchVo);
		logger.info("사원목록조회, empList.size()={}",empList.size());
		
		//검색에 따른 전체데이터 수 얻어오기
		int totalRecord = empService.selectTotalEmp(searchVo);
		logger.info("totalRecord={}",totalRecord);
		
		//페이징인포에 값 셋팅
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("navNo", 8);
		model.addAttribute("empList", empList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "emp/empList";
		
	}
	
	/* 사원정보삭제 - DB베이스에 정보는 유지 */
	@PostMapping("/leaveEmp")
	public String deleteEmp(@RequestParam String modalEmpNo, @RequestParam String modalAdmin, @RequestParam String modalAdminPwd, Model model) {
		//퇴사하는 사원번호
		int delEmpNo = Integer.parseInt(modalEmpNo);
		//퇴사요청하는 관리자번호
		int adminEmpNo = Integer.parseInt(modalAdmin);
		
		logger.info("사원퇴사처리 삭제요청관리자, modalEmpNo={}, adminEmpNo={}",modalEmpNo, adminEmpNo);
		logger.info("사원퇴사처리 삭제사원번호, modalEmpNo={}",modalEmpNo);

		String msg = "", url= "";
		//관리자 확인
		int result = empService.loginProc(adminEmpNo, modalAdminPwd);
		
		//결과처리
		if(result == EmpService.LOGIN_OK) {
			int cnt = empService.deleteEmp(delEmpNo);
			msg="퇴사되었습니다.";
			url="/emp/empList";
		}else {
			msg="요청이 실패되었습니다.";
			url="/emp/empList";
		}
		
		//모델에 저장, 뷰페이지 리턴
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/* 비밀번호 변경 */
	@PostMapping("/changePwd")
	public String changePwd(@ModelAttribute EmpVO vo, @RequestParam String changeEmpPwd, Model model) {
		logger.info("비밀번호변경, 변경요청 vo={}",vo);
		
		//기존비밀번호 가져오기
		String dbPwd = empService.selectPwd(vo.getEmpNo());
		logger.info("비밀번호변경, 변경요청 dbPwd={}, changeEmpPwd={}",dbPwd,changeEmpPwd);

		
		String msg ="", url="";
		if(passwordEncoder.matches(vo.getEmpPwd(), dbPwd)) {//기존비밀번호와 일치하면
			//변경요청
			vo.setEmpPwd(changeEmpPwd);
			int cnt = empService.updateTempPwd(vo);
			
			if(cnt>0) {
				msg="비밀번호가 변경되었습니다. 로그아웃됩니다.";
				url="/login/logout";
			}else {
				msg="비밀번호가 변경되지 않았습니다. 다시 시도해주세요";
				url="/emp/empEdit?empNo="+vo.getEmpPwd();
			}
		}else { // 기존비밀번호와 다르면
			msg="비밀번호가 다릅니다, 다시확인해주세요";
			url="/emp/empEdit?empNo="+vo.getEmpPwd();
		}
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
	
	/* 이메일 작성 시 사원번호 자동완성 */
	@ResponseBody
	@RequestMapping("/searchEmp")
	public List<EmpVO> searchEmp(@RequestParam(defaultValue = "0") int searchNo){
		logger.info("searchNo={}",searchNo);
		List<EmpVO> list = empService.selectSearchNum(searchNo);
		return list;
	}
}



