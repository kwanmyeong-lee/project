package com.it.lylj.electronic.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.it.lylj.index.model.OriVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/electronic")
@RequiredArgsConstructor
public class ElectronicController {
	private static final Logger logger = LoggerFactory.getLogger(ElectronicController.class);
	private final ElectronicDocFolService electronicDocFolService;
	private final ElectronicDocStyService electronicDocStyService;

	@GetMapping("/electronicMain")
	public void electronicMain(Model model) {
		logger.info("전자결재 화면 보여주기");
		model.addAttribute("navNo", 1);

	}

	@GetMapping("/documentSelect")
	public void documentSty() {
		logger.info("양식 선택 보여주기");
	}

	@GetMapping("/documentWrite")
	public void documentWrite(@RequestParam String styleNo, Model model) {
		logger.info("양식 작성 페이지 보여주기 파라미터 문서 번호 ={}", styleNo);
		ElectronicDocStyVO vo = electronicDocStyService.selectByStyleNo(styleNo);
		model.addAttribute("vo", vo);
	}

	@GetMapping("/electronicDefaultDoc")
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
}












