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
	private final ElectronicService eletronicService;
	private final ElectronicAppLineService electronicAppService;
	private final ElectronicReLineService electronicReService;

	@GetMapping("/electronicMain")
	public void electronicMain(Model model) {
		logger.info("전자결재 화면 보여주기");
		model.addAttribute("navNo", 1);
	}

	@GetMapping("/documentSelect")
	public void documentSty() {
		logger.info("양식 선택 보여주기");
	}

	@GetMapping("/documentSelectApproval")
	public void documentSelectApproval() {
		logger.info("결재라인 선택 화면 보여주기");
	}

	@GetMapping("/documentSelectReceive")
	public void documentSelectReceive() {
		logger.info("결재라인 선택 화면 보여주기");
	}

	@GetMapping("/documentWrite")
	public void documentWrite(@RequestParam String styleNo, Model model) {
		logger.info("양식 작성 페이지 보여주기 파라미터 문서 번호 ={}, vo ={}", styleNo);
		ElectronicDocStyVO svo = electronicDocStyService.selectByStyleNo(styleNo);
		model.addAttribute("svo", svo);
	}

	@PostMapping("/documentWrite")
	public String documentWrite_post(@ModelAttribute ElectronicVo vo, @RequestParam String AempNoData, @RequestParam String RempNoData , HttpSession session,  Model model) {
		logger.info("양식 등록 하기 파라미터 ElectronicVo={}", vo);
		String empNo = (String) session.getAttribute("empNo");
		vo.setEmpNo(Integer.parseInt(empNo));
		int cnt = eletronicService.insertEle(vo);
		logger.info("세션에서 empNo={}", empNo);
		logger.info("결재 라인 결재자 AempNoData={}", AempNoData);
		logger.info("결재 라인 결재자 RempNoData={}", RempNoData);
		
		String url = "/electronic/documentSelect?no=" + 1, msg = "기안서 보내기 실패";
		if (cnt > 0) {
			msg = "기안서 보내기 성공";
			url = "/electronic/documentSelect?no=" + 2;
		}
		
		int electronicNo= eletronicService.selectMaxEleNo(Integer.parseInt(empNo));
		logger.info("electronicNo={}", electronicNo);
		
		String[] ApEmpNo = AempNoData.split(",");
		
		for(int i =0;i< ApEmpNo.length;i++) {
			String apempno=  ApEmpNo[i];
			ElectronicAppLineVo avo = new ElectronicAppLineVo();
			avo.setEmpNo(Integer.parseInt(apempno)); // 결재자 번호
			avo.setApprovalLineOrder(i); //결재 자 순서 번호 
			avo.setElectronicNo(electronicNo); //문서 번호 
			avo.setApprovalLineCompleteFlag("0");
			
			int cnt2 = electronicAppService.insertAppLine(avo);
			
		}
		
		String[] ReEmpNo = RempNoData.split(",");
		for(int i =0; i<ReEmpNo.length;i++) {
			String reempno = ReEmpNo[i];
			ElectronicReLineVo rvo = new ElectronicReLineVo();
			rvo.setEmpNo(Integer.parseInt(reempno));
			rvo.setElectronicNo(electronicNo);
			rvo.setReceiveLineFlag("0");
			
			int cnt3 = electronicReService.insertReLine(rvo);
		
		}
		

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@GetMapping("/electronicList")
	public void electronicWait(HttpSession session, Model model) {
		String empNo = (String) session.getAttribute("empNo");
		logger.info("결재 리스트 보여주기 파라미터 empNo={}", empNo);
		List<ElectronicVo> List = eletronicService.selectByEmpNo(Integer.parseInt(empNo));
		logger.info("결재 리스트 보여주기 결과 List={}", List);
		model.addAttribute("List", List);
		model.addAttribute("navNo", 1);
	}

	@GetMapping("/myDocument")
	public void myDocument(Model model) {
		logger.info("자주쓰는 양식 페이지 보여주기 ");
		model.addAttribute("navNo", 1);
	}

	@GetMapping("/electronicDetail")
	public void electronicDetail(@RequestParam int ElectronicNo, Model model) {
		logger.info("문서 선택시 디테일 화면 보여주기 파라미터 ElectronicNo={}", ElectronicNo);
		ElectronicVo vo = eletronicService.selectByElectronicNo(ElectronicNo);
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
	
	@PostMapping("/AcceptUpdateAppLine")
	public String AcceptUpdateAppLine(@ModelAttribute ElectronicVo vo, Model model) {
		logger.info("AppLine 업데이트 파라미터 electronicVo={}", vo);
		int cnt = electronicAppService.AcceptUpdateAppLine(vo);
		String url = "/electronic/electronicList", msg = "승인 실패";
		if(cnt>0) {
			 msg = "승인 성공";
		}
		
		model.addAttribute("msg", msg	);
		model.addAttribute("url", url);
		model.addAttribute("navNo", 1);
		
		return "common/message";
	}
	
	@GetMapping("/documentDetail")
	public String documentDetail(@RequestParam String styleNo, Model model) {
		logger.info("양식 선택시 디테일 화면 보여주기 파라미터 ={}", styleNo);
		ElectronicDocStyVO vo = electronicDocStyService.selectByStyleNo(styleNo);

		model.addAttribute("vo", vo);
		return "electronic/documentDetail";

	}

	@ResponseBody
	@RequestMapping("/list")
	public List<OriVo> selectDocFol() { // 문서 트리뷰 보여주기
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

	@ResponseBody
	@RequestMapping("/selectstamp")
	public Map<String, Object> selectstamp(@RequestParam String userNo) { // 유저 번호로 도장 정보 가져오기
		logger.info("유저 번호로 유저 도장 정보 조회 파라미터 userNo = {}", userNo);

		Map<String, Object> stampInfo = empService.selectstamp(userNo);
		// {"EMP_NAME":"관명","STAMP_NAME":"아이유1.jpg","POSITION_NO":2,"STAMP_NO":1,"EMP_NO":101,"POSITION_NAME":"부장"}
		return stampInfo;

	}

	@ResponseBody
	@RequestMapping("/selectstampList")
	public List<Map<String, Object>> selectstampList(@RequestParam(value = "empNo[]") List<String> empNo) {// 유저 번로 배열로
																											// 도장 조회하기
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
