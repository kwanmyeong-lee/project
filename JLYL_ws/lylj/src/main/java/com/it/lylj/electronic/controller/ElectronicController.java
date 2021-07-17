package com.it.lylj.electronic.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.lylj.electronicDocFol.model.ElectronicDocFolService;
import com.it.lylj.electronicDocFol.model.ElectronicDocFolVO;
import com.it.lylj.electronicDocSty.model.ElectronicDocStyService;
import com.it.lylj.electronicDocSty.model.ElectronicDocStyVO;
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

	@GetMapping("/electronicDefaultList")
	public void electronicWait(Model model) {
		logger.info("결재 리스트 보여주기 기본값 수정중!!!");
		model.addAttribute("navNo", 1);
	}

	@GetMapping("/myDocument")
	public void myDocument(Model model) {
		logger.info("자주쓰는 양식 페이지 보여주기 ");
		model.addAttribute("navNo", 1);
	}

	@GetMapping("/electronicDetail")
	public void electronicDetail(Model model) {
		logger.info("문서 선택시 디테일 화면 보여주기 수정중!!!");
		model.addAttribute("navNo", 1);
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

	@ResponseBody
	@RequestMapping("/selectstamp")
	public Map<String, Object> selectstamp(@RequestParam String userNo) {
		logger.info("유저 번호로 유저 도장 정보 조회 파라미터 userNo = {}", userNo);

		Map<String, Object> stampInfo = empService.selectstamp(userNo);
		// {"EMP_NAME":"관명","STAMP_NAME":"아이유1.jpg","POSITION_NO":2,"STAMP_NO":1,"EMP_NO":101,"POSITION_NAME":"부장"}
		return stampInfo;

	}

	@ResponseBody
	@RequestMapping("/selectstampList")
	public List<Map<String, Object>> selectstampList(@RequestParam(value="empNo[]") List<String> empNo) {
		logger.info("empNo={}", empNo);
		 
		List<Map<String, Object>> listmap = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < empNo.size(); i++) {
			String emp = empNo.get(i);
			logger.info("emp = {}", emp);
			Map<String, Object> stampInfo = empService.selectstampList(emp);
			listmap.add(stampInfo);
			logger.info("추가 하는중 allInfo={}", listmap);
		};
		logger.info("allInfo={}", listmap);
		
		return listmap;

	}
}
