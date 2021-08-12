package com.it.lylj.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.it.lylj.addBook.model.AddBookService;
import com.it.lylj.addBook.model.AddBookVO;
import com.it.lylj.addBookFol.model.AddBookFolService;
import com.it.lylj.addBookFol.model.AddBookFolVO;
import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.ExcelReadOption;
import com.it.lylj.common.ExcelUtil;
import com.it.lylj.common.PaginationInfo;
import com.it.lylj.schedule.controller.ScheduleController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/upload")
@RequiredArgsConstructor
public class ExcelUploadController {
	private final AddBookService addBookService;
	private final AddBookFolService addBookFolService;
	private static final Logger logger
	=LoggerFactory.getLogger(ScheduleController.class);
	
	
	@PostMapping("/read")
	@ResponseBody
	public Map<String, Object> excelUploadRead(MultipartHttpServletRequest multiRequest){
		Map<String, Object> map = new HashMap<>();
		MultipartFile excelFile= multiRequest.getFile("excelFile");
		int currentPage = Integer.parseInt(multiRequest.getParameter("currentPage")); // 현재 페이지
		int btCheck = Integer.parseInt(multiRequest.getParameter("btCheck")); // 다음 또는 이전 목록 페이지
		int fileCheck = Integer.parseInt(multiRequest.getParameter("btCheck")); // 파일이 바꼈는지 체크
		
		
		if(btCheck==1) {
			int block =currentPage/ConstUtil.BLOCK_SIZE + 1;
			currentPage= block*ConstUtil.BLOCK_SIZE +1;
		}else if(btCheck == 2) {
			int block =currentPage/ConstUtil.BLOCK_SIZE - 1;
			currentPage= block*ConstUtil.BLOCK_SIZE +1;			
		}
		
		File destFile = new File(ConstUtil.EXCELFILE_UPLOAD_PATH_REAL+"\\"+excelFile.getOriginalFilename());
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		/* 페이징 처리 */
		PaginationInfo pagingInfo = new PaginationInfo();
	    pagingInfo.setCurrentPage(currentPage);
	    pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
	    pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	   
	    int startRow=(currentPage-1)*ConstUtil.RECORD_COUNT+2;

		
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H");
		excelReadOption.setStartRow(startRow);
		List<Map<String,String>> excelContent = ExcelUtil.excelRead(excelReadOption);
		
		if(fileCheck==0) { // 파일이 바뀌었다면 필수 칼럼이 널값이 아닌 모든 행의 수를 다시 셋팅
			ExcelUtil.excelReadCnt(excelReadOption);
		}
		pagingInfo.setTotalRecord(ExcelReadOption.getExcelRowCnt());
		
		int totalRowCnt =  excelReadOption.getTotalRow();
		map.put("excelContent", excelContent);
		map.put("pagingInfo", pagingInfo);
		map.put("totalRowCnt", totalRowCnt);
		return map;
	}
	
	
	/* 엑셀 양식 받아 주소록 입력 */
	@PostMapping("/insert")
	@ResponseBody
	@Transactional
	public int excelUploadInsert(MultipartHttpServletRequest multiRequest){
		MultipartFile excelFile= multiRequest.getFile("excelFile");
		int empNo = Integer.parseInt(multiRequest.getParameter("empNo"));
		int insertCnt=0;
		
		File destFile = new File(ConstUtil.EXCELFILE_UPLOAD_PATH_REAL+"\\"+excelFile.getOriginalFilename());
		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H");
		excelReadOption.setStartRow(-1);
		List<Map<String,String>> excelContent = ExcelUtil.excelRead(excelReadOption); // 엑셀의 정보 리스트
		List<AddBookFolVO> addBookFolList = addBookFolService.selectFol(empNo); // 주소록 목록 리스트
		int addBookFolNameDefaultCheck=0; // 주소록 목록명에 기본이 있는지 체크
		int addBookFolNameCheck=0;
		
		
		
		for(AddBookFolVO vo : addBookFolList) {
			if(vo.getAddressFolderName() != null && !vo.getAddressFolderName().isEmpty()) {
				if(vo.getAddressFolderName().equals("기본")) {
					addBookFolNameDefaultCheck++;
				}
			}
		}
		
		if(addBookFolNameDefaultCheck == 0) { // 0이면 주소록 목록에 기본 추가
			AddBookFolVO vo = new AddBookFolVO();
			vo.setEmpNo(empNo);
			vo.setAddressFolderName("기본");
			addBookFolService.insertFol(vo);
			addBookFolList = addBookFolService.selectFol(empNo); //리스트 다시 불러옴
		}
		
		
		logger.info("excelContent.size()={}",excelContent.size());
		for(int i=0; i<excelContent.size(); i++) { // 엑셀 정보 만큼 반복
			String addBookFolName = "기본";
			AddBookVO addBookVO = new AddBookVO();
			addBookVO.setEmpNo(empNo);
			if(excelContent.get(i).get("A") ==null && excelContent.get(i).get("B")==null 
					&& excelContent.get(i).get("A").isEmpty() && excelContent.get(i).get("B").isEmpty()) {
				continue;
			}
			addBookVO.setAddressBookName(excelContent.get(i).get("A"));
			addBookVO.setAddressBookTel(excelContent.get(i).get("B"));
			addBookVO.setAddressBookMaile(excelContent.get(i).get("C"));
			addBookVO.setAddressBookPosition(excelContent.get(i).get("D"));
			addBookVO.setAddressBookOfficeName(excelContent.get(i).get("E"));
			addBookVO.setAddressBookOfficeTel(excelContent.get(i).get("F"));
			
			if(excelContent.get(i).get("G")!=null && !excelContent.get(i).get("G").isEmpty()) { // 엑셀의 카테고리 명이 null이면 기본으로 셋팅
				addBookFolName = excelContent.get(i).get("G");
			}
			
			for(AddBookFolVO vo : addBookFolList) {// 주소록 목록만큼 반복
				if(vo.getAddressFolderName() != null && !vo.getAddressFolderName().isEmpty()) {
					if(vo.getAddressFolderName().equals(addBookFolName)) {// 만약 카테고리명이 같다면 카테고리넘버 셋팅, 네임체크 추가 후 탈출
						addBookVO.setAddressFolderNo(vo.getAddressFolderNo());
						addBookFolNameCheck++;
						break;
					}
				}
			}
			
			if(addBookFolNameCheck==0) {// 만약 0일경우 카테고리 추가 후 카테고리 넘버 셋팅
				AddBookFolVO folvo = new AddBookFolVO();
				folvo.setEmpNo(empNo);
				folvo.setAddressFolderName(addBookFolName);
				addBookFolService.insertFol(folvo);
				addBookFolList = addBookFolService.selectFol(empNo);
				
				for(AddBookFolVO vo : addBookFolList) {
					if(vo.getAddressFolderName() != null && !vo.getAddressFolderName().isEmpty()) {
						if(vo.getAddressFolderName().equals(addBookFolName)) {
							addBookVO.setAddressFolderNo(vo.getAddressFolderNo());
							break;
						}
					}
				}
			}
			if(excelContent.get(i).get("H") != null && !excelContent.get(i).get("H").isEmpty()) {
				if(excelContent.get(i).get("H").equals("1") || excelContent.get(i).get("H").equals("남") 
						|| excelContent.get(i).get("H").equals("남자") || excelContent.get(i).get("H").equalsIgnoreCase("m")) {
					addBookVO.setAddressBookGender("남자");
				}else if(excelContent.get(i).get("H").equals("2") || excelContent.get(i).get("H").equals("여") 
						|| excelContent.get(i).get("H").equals("여자") || excelContent.get(i).get("H").equalsIgnoreCase("f")) {
					
				}
			}
			
			
			addBookFolNameCheck=0;
			addBookService.insertAddBook(addBookVO);
			insertCnt++;
			
		}
		
		return insertCnt;
	}
}
