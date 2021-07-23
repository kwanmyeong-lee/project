package com.it.lylj.electronic.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.it.lylj.common.PaginationInfo;
import com.it.lylj.common.SearchVO;
import com.it.lylj.electronic.model.ElectronicService;
import com.it.lylj.electronic.model.ElectronicVo;
import com.it.lylj.electronicAppLine.model.ElectronicAppLineService;
import com.it.lylj.electronicAppLine.model.ElectronicAppLineVo;
import com.it.lylj.electronicDocFol.model.ElectronicDocFolService;
import com.it.lylj.electronicDocFol.model.ElectronicDocFolVO;
import com.it.lylj.electronicDocSty.model.ElectronicDocStyService;
import com.it.lylj.electronicDocSty.model.ElectronicDocStyVO;
import com.it.lylj.electronicReLine.model.ElectronicReLineService;
import com.it.lylj.electronicReLine.model.ElectronicReLineVo;
import com.it.lylj.emp.model.EmpService;
import com.it.lylj.index.model.OriVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/electronic")
@RequiredArgsConstructor
public class ElectronicController {
	private static final Logger logger = LoggerFactory.getLogger(ElectronicController.class);
	private final ElectronicDocFolService electronicDocFolService;
	private final ElectronicDocStyService electronicDocStyService;
	private final EmpService empService;
	private final ElectronicService electronicService;
	private final ElectronicAppLineService electronicAppService;
	private final ElectronicReLineService electronicReService;

	//전자결재 메인 보여주기
	@GetMapping("/electronicMain")
	public String electronicMain(HttpSession session, Model model) {
	
		String empNo = (String) session.getAttribute("empNo");
		logger.info("결재 리스트 보여주기 파라미터 empNo={}", empNo);
		SearchVO vo = new SearchVO();
		vo.setEmpNo(empNo);

		List<Map<String, Object>> ListAp = electronicService.selectListByEmpNo((vo), "1");
		
		List<Map<String, Object>> ListRe = electronicService.selectListByEmpNo((vo), "2");
		
		List<Map<String, Object>> ListFi = electronicService.selectListByEmpNo((vo), "6");
			
		logger.info("결재 대기 문서 보여주기  ListAp={}", ListAp);
		logger.info("결재 수신 문서 보여주기  ListRe={}", ListRe);
		logger.info("결재 완료 문서 보여주기  ListFi={}", ListFi);
		
		model.addAttribute("ListAp", ListAp);
		model.addAttribute("ListRe", ListRe);
		model.addAttribute("ListFi", ListFi);
		
		model.addAttribute("navNo", 1);
		
		return "electronic/electronicMain";
		
	}
	
	//자주쓰는 양식 리스트 보여주기
	@GetMapping("/myDocument")
	public void myDocument(Model model) {
		logger.info("자주쓰는 양식 페이지 보여주기 ");
		List<Map<String, Object>>  list = electronicService.selectTopSty();
		
		model.addAttribute("list", list);
		model.addAttribute("navNo", 1);
	}

	//문서 양식 선택화면 보여주기
	@GetMapping("/documentSelect")
	public void documentSty() {
		logger.info("양식 선택 보여주기");
	}

	//결재자 라인 선택 화면 보여주기
	@GetMapping("/documentSelectApproval")
	public void documentSelectApproval() {
		logger.info("결재라인 선택 화면 보여주기");
	}
	
	//수신라인 선택화면 보여주기
	@GetMapping("/documentSelectReceive")
	public void documentSelectReceive() {
		logger.info("결재라인 선택 화면 보여주기");
	}
	
	//기안서 작성 페이지 보여주기
	@GetMapping("/documentWrite")
	public void documentWrite(@RequestParam String styleNo, Model model) {
		logger.info("양식 작성 페이지 보여주기 파라미터 문서 번호 ={}", styleNo);
		ElectronicDocStyVO svo = electronicDocStyService.selectByStyleNo(styleNo);
		model.addAttribute("svo", svo);
	}
	
	//기안서 작성 하기 
	@PostMapping("/documentWrite")
	public String documentWrite_post(@ModelAttribute ElectronicVo vo, @RequestParam String AempNoData, @RequestParam String RempNoData , HttpSession session,  Model model) {
		logger.info("양식 등록 하기 파라미터 ElectronicVo={}", vo);
		
		String empNo = (String) session.getAttribute("empNo");
		vo.setEmpNo(Integer.parseInt(empNo));
		
		int cnt = electronicService.insertEle(vo);
		
		logger.info("세션에서 empNo={}", empNo);
		logger.info("결재 라인  AempNoData={}", AempNoData);
		logger.info("수신 라인  RempNoData={}", RempNoData);
		
		String draftVal = vo.getElectronicDraft();
		String url = "/electronic/documentSelect?no=" + 1, msg = "";
		if(draftVal.equals("1")) {
			if (cnt > 0) {
				msg = "임시저장 성공";
				url = "/electronic/documentSelect?no=" + 2;
			}else {
				msg = "임시저장 실패";
			}
		}else {
			if (cnt > 0) {
				msg = "기안서 보내기 성공";
				url = "/electronic/documentSelect?no=" + 2;
			}else {
				msg= "기안서 보내기 실패";
			}
		}
		
		int electronicNo= electronicService.selectMaxEleNo(Integer.parseInt(empNo));
		logger.info("electronicNo={}", electronicNo);
		
		String[] ApEmpNo = AempNoData.split(","); //결재자 번호 배열
		
		for(int i =0;i< ApEmpNo.length;i++) {
			String apempno=  ApEmpNo[i];
			ElectronicAppLineVo avo = new ElectronicAppLineVo();
			avo.setEmpNo(Integer.parseInt(apempno)); // 결재자 번호
			avo.setApprovalLineOrder(i); //결재 자 순서 번호 
			avo.setElectronicNo(electronicNo); //문서 번호 
			avo.setApprovalLineCompleteFlag("0");
			
			
			int cnt2 = electronicAppService.insertAppLine(avo);
			
			
		}
		if(RempNoData.length() > 0) {
			
			String[] ReEmpNo = RempNoData.split(","); // 수신자 번호 배열
			
			for(int i =0; i<ReEmpNo.length;i++) {
				String reempno = ReEmpNo[i];
				ElectronicReLineVo rvo = new ElectronicReLineVo();
				rvo.setEmpNo(Integer.parseInt(reempno));
				rvo.setElectronicNo(electronicNo);
				rvo.setReceiveLineFlag("0");
				
				int cnt3 = electronicReService.insertReLine(rvo);
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	//기안서 업데이트 하기
	@RequestMapping("/documentUpdate")
	public String documentUpdate(@ModelAttribute ElectronicVo vo, @RequestParam String AempNoData, @RequestParam String RempNoData , HttpSession session,  Model model) {
	logger.info("양식 수정 하기 파라미터 ElectronicVo={}", vo);
		
		String empNo = (String) session.getAttribute("empNo");
		vo.setEmpNo(Integer.parseInt(empNo));
		
		int cnt = electronicService.updateEle(vo); //기안서 업데이트
		
		logger.info("세션에서 empNo={}", empNo);
		logger.info("결재 라인  AempNoData={}", AempNoData);
		logger.info("수신 라인  RempNoData={}", RempNoData);
		
		int electronicNo= vo.getElectronicNo();
		logger.info("electronicNo={}", electronicNo);
		
		if(AempNoData.length() !=0) {
			
			String[] ApEmpNo = AempNoData.split(",");
			
			for(int i =0;i< ApEmpNo.length;i++) {
				String apempno=  ApEmpNo[i];
				ElectronicAppLineVo avo = new ElectronicAppLineVo();
				avo.setEmpNo(Integer.parseInt(apempno)); // 결재자 번호
				avo.setApprovalLineOrder(i); //결재 자 순서 번호 
				avo.setElectronicNo(electronicNo); //문서 번호 
				avo.setApprovalLineCompleteFlag("0");
				
				if(electronicAppService.selectForCheckExist(avo) != 1) {
					int cnt2 = electronicAppService.insertAppLine(avo);
				}
				
			}
		}
		
		if(RempNoData.length() !=0) {
			
			String[] ReEmpNo = RempNoData.split(",");
			
			for(int i =0; i<ReEmpNo.length;i++) {
				String reempno = ReEmpNo[i];
				ElectronicReLineVo rvo = new ElectronicReLineVo();
				rvo.setEmpNo(Integer.parseInt(reempno));
				rvo.setElectronicNo(electronicNo);
				rvo.setReceiveLineFlag("0");
				
				if(electronicReService.selectForCheckExist(rvo) != 1) {
					int cnt3 = electronicReService.insertReLine(rvo);
				}
			}
		}
		
		String url = "/electronic/electronicList?no="+5, msg = "실패";
		
		if(vo.getElectronicDraft().equals("1")) { //아직 임시저장 문서
			if (cnt > 0) {
				msg = "기안서 수정 성공";
				url = "/electronic/electronicList?no="+5;
			}
		}else {
			if (cnt > 0) {
				msg = "기안서 기안 성공";
				url = "/electronic/electronicList?no="+5;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	
	//사이드 바에서 항목 선택시 리스트 보여주기
	@RequestMapping("/electronicList")
	public void electronicWait(@RequestParam String no, HttpSession session,@ModelAttribute SearchVO searchVo, Model model) {
		
		String empNo = (String) session.getAttribute("empNo");		
		logger.info("결재 리스트 보여주기 파라미터 empNo={}", empNo);
		
		/* 페이징 처리 */
		PaginationInfo pagingInfo = new PaginationInfo();
	    pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	    pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
	    pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_ELE);
	      
	    searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	    searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_ELE);
	    searchVo.setEmpNo(empNo);
	    
		logger.info("사이드바 선택 번호 no ={}", no);
		int cnt = electronicService.TotalSelectListByEmpNo(searchVo, no);
	    
	    pagingInfo.setTotalRecord(cnt);
	    
	    logger.info("페이지 번호 관련 셋팅 후 serachVo={}", searchVo);
	    
		List<Map<String, Object>> List = electronicService.selectListByEmpNo(searchVo, no);
		
	    logger.info("결재 리스트 보여주기 결과 List={}", List);

			
		model.addAttribute("List", List);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("navNo", 1);
	}
	
	//문서 선택시 문서 디테일 보여주기
	@GetMapping("/electronicDetail")
	public void electronicDetail(@RequestParam int ElectronicNo, @RequestParam String no, Model model) {
		logger.info("문서 선택시 디테일 화면 보여주기 파라미터 ElectronicNo={}", ElectronicNo);
		ElectronicVo vo = electronicService.selectByElectronicNo(ElectronicNo);
		logger.info("vo={}", vo);
		ElectronicDocStyVO svo = electronicDocStyService.selectByStyleNo(Integer.toString(vo.getStyleNo()));
		String styleContent = svo.getStyleContent();
		logger.info("styleContent={}", styleContent);
		List<ElectronicAppLineVo> avo = electronicAppService.selectByElectronicNo(ElectronicNo);
		List<ElectronicReLineVo> rvo = electronicReService.selectByElectronicNo(ElectronicNo);
		logger.info("avo={}, rvo={}", avo, rvo);
		
		model.addAttribute("avo", avo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("vo", vo);
		model.addAttribute("navNo", 1);
		model.addAttribute("styleContent", styleContent);
		// http://localhost:9091/lylj/electronic/electronicDetail?ElectronicNo=1
	}
	
	//결재 승인
	@RequestMapping("/AcceptUpdateAppLine") 
	public String AcceptUpdateAppLine(@ModelAttribute ElectronicVo vo,@RequestParam String no, Model model) {
		logger.info("리스트 번호 no ={}", no);
		logger.info("AppLine 업데이트 파라미터 electronicVo={}", vo);
		
		int cnt = 0;
		ElectronicAppLineVo evo = null;
		if(electronicAppService.selectAppLineCheck(vo) != null ) {
			evo = electronicAppService.selectAppLineCheck(vo); //내 앞사람이 승인을 했는지 안했는지 
			logger.info("앞 라인 승인 여부 evo.getApprovalLineCompleteFlag()={}", evo.getApprovalLineCompleteFlag());
			
			if(evo.getApprovalLineCompleteFlag().equals("1")) { //앞사람이 승인을 했으면
				cnt = electronicAppService.AcceptUpdateAppLine(vo);
			}//앞사람이 승인을 안했으면
			
		}else { //앞사람이 없으면
			cnt = electronicAppService.AcceptUpdateAppLine(vo);
		}
		
		List<ElectronicAppLineVo> list= electronicAppService.selectByElectronicNo(vo.getElectronicNo());
		
		int sum = 0;
		for(int i = 0;i<list.size();i++) {
			ElectronicAppLineVo getList =list.get(i);
			if(getList.getApprovalLineCompleteFlag().equals("1")) {
				sum+=1;
			}
		}
		int completeCnt = 0;
		if(sum == list.size()) {
			completeCnt = electronicService.updateEleComplete(vo.getElectronicNo());
		}
		
		String url = "/electronic/electronicList?no="+no, msg = "승인 순서가 아닙니다.";
		if(cnt>0) {
			 msg = "승인 성공";
		}
		if(completeCnt>0) {
			msg = "결재 최종 완료";
		}
		
		model.addAttribute("msg", msg	);
		model.addAttribute("url", url);
		model.addAttribute("navNo", 1);
		
		return "common/message";
	}
	
	//결재 반려
	@RequestMapping("/EleReturn")
	public String EleReturn(@RequestParam int ElectronicNo, Model model) {
		logger.info("결재 반려하기 파라미터 electronicNo ={}", ElectronicNo);
		
		int cnt = electronicService.updateEleReturn(ElectronicNo);
		
		String msg ="결재 반려 실패", url = "/electronic/electronicList?no="+1;
		if(cnt>0) {
			msg = "결재 반려 완료";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	//결재자 삭제
	@RequestMapping("deleteAppLine")
	@ResponseBody
	public int deleteAppLine(@RequestParam(value = "empNo[]") String[] empNo, @RequestParam String electronicNo) {
		ElectronicAppLineVo vo = new ElectronicAppLineVo();
		vo.setElectronicNo(Integer.parseInt(electronicNo));
		
		int result = 0;
		for(int i =0;i<empNo.length;i++) {
			logger.info("AppLine 삭제 파라미터 empNo={}", empNo[i]);
			vo.setEmpNo(Integer.parseInt(empNo[i]));
			int cnt  = electronicAppService.deleteAppLine(vo);
			logger.info("AppLine 삭제 파라미터 vo ={}", vo);
			if(cnt>0) {
				logger.info("삭제 완료");
				result = cnt;
			}
		}
		return result;
	}
	
	//수신자 삭제
	@RequestMapping("deleteReLine")
	@ResponseBody
	public int deleteReLine(@RequestParam(value = "empNo[]") String[] empNo, @RequestParam String electronicNo) {
		ElectronicReLineVo vo = new ElectronicReLineVo();
		vo.setElectronicNo(Integer.parseInt(electronicNo));
		
		int result = 0;
		for(int i =0;i<empNo.length;i++) {
			logger.info("ReLine 삭제 파라미터 empNo={}", empNo[i]);
			vo.setEmpNo(Integer.parseInt(empNo[i]));
			int cnt  = electronicReService.deleteReLine(vo);
			logger.info("ReLine 삭제 파라미터 vo ={}", vo);
			if(cnt>0) {
				logger.info("삭제 완료");
				result = cnt;
			}
		}
		return result;
	}
	
	
	
	//수신 승인
	@RequestMapping("/AcceptUpdateReLine")
	public String AcceptUpdateReLine(@ModelAttribute ElectronicVo vo,@RequestParam String no, Model model) {
		logger.info("리스트 번호 no ={}", no);
		logger.info("ReLine 업데이트 파라미터 electronicVo={}", vo);
		int cnt = electronicReService.AcceptUpdateReLine(vo);
		String url = "/electronic/electronicList?no="+no, msg = "수신 실패";
		if(cnt>0) {
			 msg = "수신 확인 성공";
		}
		
		model.addAttribute("msg", msg	);
		model.addAttribute("url", url);
		model.addAttribute("navNo", 1);
		
		return "common/message";
	}
	
	
	//양식 선택시 양식 미리보기 화면 보여주기
	@GetMapping("/documentDetail")
	public String documentDetail(@RequestParam String styleNo, Model model) {
		logger.info("양식 선택시 디테일 화면 보여주기 파라미터 ={}", styleNo);
		ElectronicDocStyVO vo = electronicDocStyService.selectByStyleNo(styleNo);

		model.addAttribute("vo", vo);
		return "electronic/documentDetail";

	}

	//문서 선택시 트리뷰로 보여주기
	@ResponseBody
	@RequestMapping("/list")
	public List<OriVo> selectDocFol() { 
		logger.info("문서 트리뷰 보여주기");

		List<OriVo> olist = new ArrayList<>();

		List<ElectronicDocFolVO> elist = electronicDocFolService.selectAll();
		List<ElectronicDocStyVO> slist = electronicDocStyService.selectAll();
		logger.info("elist ={}", elist);

		for (int i = 0; i < elist.size(); i++) {

			ElectronicDocFolVO eleDocFolVo = elist.get(i);
			OriVo orivo = new OriVo();

			orivo.setId(Integer.toString(eleDocFolVo.getFolderNo()));
			orivo.setText(eleDocFolVo.getFolderName());
			orivo.setParent("#");
			olist.add(orivo);
		}

		for (int i = 0; i < slist.size(); i++) {

			ElectronicDocStyVO eleDocStyVo = slist.get(i);
			OriVo orivo = new OriVo();

			orivo.setId(Integer.toString(eleDocStyVo.getStyleNo()));
			orivo.setText(eleDocStyVo.getStyleName());
			orivo.setParent(Integer.toString(eleDocStyVo.getFolderNo()));
			olist.add(orivo);
		}

		return olist;

	}

	//유저번호로 유저 도장 정보 가져오기
	@ResponseBody
	@RequestMapping("/selectstamp")
	public Map<String, Object> selectstamp(@RequestParam String userNo) { 
		logger.info("유저 번호로 유저 도장 정보 조회 파라미터 userNo = {}", userNo);

		Map<String, Object> stampInfo = empService.selectstamp(userNo);
		// {"EMP_NAME":"관명","STAMP_NAME":"아이유1.jpg","POSITION_NO":2,"STAMP_NO":1,"EMP_NO":101,"POSITION_NAME":"부장"}
		return stampInfo;

	}

	//유저번호배열로 유저 도장 조회하기 
	@ResponseBody
	@RequestMapping("/selectstampList")
	public List<Map<String, Object>> selectstampList(@RequestParam(value = "empNo[]") List<String> empNo) {
																											
		logger.info("empNo={}", empNo);

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < empNo.size(); i++) {
			String emp = empNo.get(i);
			logger.info("emp = {}", emp);
			Map<String, Object> stampInfo = empService.selectstampList(emp);
			listmap.add(stampInfo);
			logger.info("추가 하는중 allInfo={}", listmap);
		}
		;
		logger.info("allInfo={}", listmap);

		return listmap;

	}
	
	

}
