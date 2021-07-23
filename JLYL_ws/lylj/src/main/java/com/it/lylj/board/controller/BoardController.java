package com.it.lylj.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.it.lylj.board.model.BoardService;
import com.it.lylj.board.model.BoardVO;
import com.it.lylj.boardComment.model.BoardCommentService;
import com.it.lylj.boardComment.model.BoardCommentVO;
import com.it.lylj.boardFile.model.BoardFileService;
import com.it.lylj.boardFile.model.BoardFileVO;
import com.it.lylj.boardFol.model.BoardFolService;
import com.it.lylj.boardFol.model.BoardFolVO;
import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.FileUploadUtil;
import com.it.lylj.common.PaginationInfo;
import com.it.lylj.common.SearchVO;
import com.it.lylj.common.Utility;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger=LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	private final BoardFolService boardFolService;
	private final BoardFileService boardFileService;
	private final BoardCommentService boardCommentService;
	
	/*        메인        */
	@RequestMapping("/boardMain")
	public String main(Model model) {
		logger.info("게시판 메인 페이지");
    
		List<BoardVO> noticeList = boardService.selectBoardMain(1);
		List<BoardVO> referenceList = boardService.selectBoardMain(2);
		List<BoardVO> communityList = boardService.selectBoardMain(3);
		
		logger.info("noticeList.size={}, referenceList.size={}, communityList.size={}", 
				noticeList.size(), referenceList.size(), communityList.size());
		
		/* top 게시판 폴더 list 처리 */
		List<BoardFolVO> otherFolder=boardFolService.otherFolder();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("referenceList", referenceList);
		model.addAttribute("communityList", communityList);
		model.addAttribute("otherFolder", otherFolder);
		
		model.addAttribute("navNo",6);

		return "board/boardMain";
	}
	
	/*        게시글 등록        */
	@RequestMapping("/boardWrite")
	public void write(Model model) {
		logger.info("게시판 등록 페이지");
		
		/* 게시판 폴더 처리 */
		List<BoardFolVO> boFol = boardFolService.selectBoardFol();
		logger.info("게시판 폴더 조회, boFol.size={}", boFol.size());
		

		/* top 게시판 폴더 list 처리 */
		List<BoardFolVO> otherFolder=boardFolService.otherFolder();
		
		model.addAttribute("boFol", boFol);
		model.addAttribute("otherFolder", otherFolder);
		model.addAttribute("navNo",6);
	}
	
	@PostMapping("/boardWrite")
	public String write_post(@ModelAttribute BoardVO vo, @ModelAttribute BoardFileVO fileVo,
			MultipartHttpServletRequest request, Model model) {
		logger.info("게시판 등록 처리, 파라미터 vo={}", vo);
		
		/* 글등록 처리 */
		int cnt=boardService.insertBoard(vo);
		logger.info("게시판 등록 결과, cnt={}", cnt);
		
		/* 파일 업로드 처리*/
		String fileName="", originalFileName="";
		long fileSize=0;
		
		List<MultipartFile> fileList = request.getFiles("upfile");
		logger.info("fileList={}", fileList);
		for(MultipartFile mf : fileList) {
			if(mf.getOriginalFilename() != "") {
				originalFileName = mf.getOriginalFilename();
				fileSize = mf.getSize();
				fileName = FileUploadUtil.getUniqueFileName(mf.getOriginalFilename());
				
				try {
					mf.transferTo(new File(ConstUtil.BOARD_UPLOAD_PATH_TEST+"\\"+fileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				logger.info("파일 업로드 성공, fileName={}, originalFileName={}, fileSize={}", fileName, originalFileName, fileSize);
				fileVo.setBoardNo(vo.getBoardNo());
				fileVo.setFileName(fileName);
				fileVo.setOriginalFileName(originalFileName);
				fileVo.setFileSize(fileSize);
				logger.info("fileVo={}", fileVo);
				
				int file = boardFileService.insertFile(fileVo);
				logger.info("file={}", file);
			}//if
		}//fot

		String msg="등록을 실패하였습니다.", url="/board/boardMain";
		if(cnt==0) {
			model.addAttribute("msg", "등록을 실패하였습니다.");
			model.addAttribute("url", "/board/boardMain");
			
			return "common/message";
		}
		
		return "redirect:/board/boardDetail?boardNo="+vo.getBoardNo();
	}

	/*        게시글 목록        */
	@RequestMapping("/boardList")
	public String list(@ModelAttribute SearchVO searchVo,
			@RequestParam(defaultValue = "0")int boardFolderNo,
			 Model model) {
		//1
		logger.info("게시판 목록 페이지, 파라미터 boardFolderNo={}", boardFolderNo);
		
		if(boardFolderNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/board/boardMain");
			
			return "common/message";
		}
		
		/* 페이징 처리 */
		PaginationInfo pagingInfo = new PaginationInfo();
	    pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	    pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
	    pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	      
	    searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	    searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	    searchVo.setBoardFolderNo(boardFolderNo);
	    logger.info("페이지 번호 관련 셋팅 후 serachVo={}", searchVo);
	      
	    /* 게시판 종류 */
		BoardFolVO boFol = boardFolService.selectByNo(boardFolderNo);
		logger.info("게시판 종류 조회, boFol={}", boFol);
		
		/* top 게시판 폴더 list 처리 */
		List<BoardFolVO> otherFolder=boardFolService.otherFolder();
		
		//2
		List<BoardVO> list = boardService.selectBoard(searchVo);
		logger.info("게시판 목록 조회, list.size={}", list.size());
		
		int totalRecord = boardService.selectTotalRecord(searchVo);
	    logger.info("totalRecord="+totalRecord);
	    pagingInfo.setTotalRecord(totalRecord);
	    
	    //3
		model.addAttribute("boFol", boFol);
		model.addAttribute("list", list);
		model.addAttribute("otherFolder", otherFolder);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("navNo", 6);

		return "board/boardList";
	}
	
	/*        게시글 상세보기        */
	@RequestMapping("/countUpdate")
	public String hitsUpdate(@RequestParam(defaultValue = "0")int boardNo, Model model) {
		logger.info("조회수 증가, 파라미터 boardNo={}", boardNo);
		
		if(boardNo==0) {
			model.addAttribute("msg", "잘못된 url 입니다.");
			model.addAttribute("url", "/board/boardMain");
			
			return "common/message";
		}
		
		int cnt = boardService.updateReadCount(boardNo);
		logger.info("조회수 증가 처리, cnt={}", cnt);
		
		return "redirect:/board/boardDetail?boardNo="+boardNo;
	}
	
	@RequestMapping("/boardDetail")
	public String detail(@RequestParam(defaultValue = "0")int boardNo,
			HttpServletRequest request ,Model model) {
		logger.info("게시판 상세보기 페이지, 파라미터 boardNo={}", boardNo);
		
		BoardVO vo = boardService.selectByNo(boardNo);
		logger.info("글 상세보기 조회, vo={}", vo);
		
		List<BoardFileVO> fileVo = boardFileService.selectByNo(boardNo);
		logger.info("fileVo={}", fileVo);
		
		List<BoardCommentVO> commList = boardCommentService.selectByNo(boardNo);
		logger.info("댓글 목록 조회, commList={}", commList);
		

		/* top 게시판 폴더 list 처리 */
		List<BoardFolVO> otherFolder=boardFolService.otherFolder();
		
		model.addAttribute("vo", vo);
		model.addAttribute("fileVo", fileVo);
		model.addAttribute("commList", commList);
		model.addAttribute("otherFolder", otherFolder);
		model.addAttribute("navNo",6);

		return "board/boardDetail";
	}
	
	/* 상세보기 다운로드 처리 */
	@RequestMapping("/download")
	public void download(@RequestParam(defaultValue = "0")int boardFileNo,
			HttpServletResponse response) throws Exception {
		//1
		logger.info("다운로드 처리, 파라미터 boardFileNo={}", boardFileNo);
		
		//2
		BoardFileVO fileVO = boardFileService.selectByFileNo(boardFileNo);
		logger.info("originalFileName={}", fileVO.getOriginalFileName());
		
		//3
		String fileName = fileVO.getOriginalFileName();
		String fileSaveName = fileVO.getFileName();
		String filePath = ConstUtil.BOARD_UPLOAD_PATH_TEST+"\\";

		response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName,"UTF-8") + "\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(filePath + fileSaveName);
		
		int readCount = 0;
		byte[] buffer = new byte[1024];

		while((readCount = fis.read(buffer)) != -1) {
		  	os.write(buffer, 0, readCount);
	    }
		fis.close();
		os.close();
	}


	/*        게시글 수정        */
	@RequestMapping("/boardEdit")
	public String eidt(@RequestParam(defaultValue = "0")int boardNo, Model model) {
		logger.info("게시판 글 수정 페이지");
		
		/* 게시판 폴더 처리 */
		List<BoardFolVO> boFol = boardFolService.selectBoardFol();
		logger.info("게시판 폴더 조회, boFol.size={}", boFol.size());
		
		/* 수정페이지 값 받아오기 */
		BoardVO vo = boardService.selectByNo(boardNo);
		
		/* top 게시판 폴더 list 처리 */
		List<BoardFolVO> otherFolder=boardFolService.otherFolder();
		
		model.addAttribute("boFol", boFol);
		model.addAttribute("vo", vo);
		model.addAttribute("otherFolder", otherFolder);
		model.addAttribute("navNo",6);

		return "board/boardEdit";
	}
	
	@PostMapping("/boardEdit")
	public String edit_post(@ModelAttribute BoardVO vo,Model model) {
		logger.info("게시판 글 수정 처리, 파라미터 vo={}", vo);
		
		int cnt = boardService.updateBoard(vo);
		logger.info("게시판 글 수정 처리 결과, cnt={}", cnt);
		
		if(cnt<0) {
			String msg="글 수정 처리를 실패하였습니다.";
			String url="/board/boardDetail?boardNo="+vo.getBoardNo();

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
		
		return "redirect:/board/boardDetail?boardNo=" + vo.getBoardNo();
	}
	
	/*        게시글 삭제        */
	@RequestMapping("/boardDelete")
	public String delete(@RequestParam(defaultValue = "0")int boardNo,
						 @RequestParam(defaultValue = "0")int boardFolderNo,
						 Model model) {
		logger.info("게시판 글 삭제 처리");
		
		int cnt = boardService.deleteBoard(boardNo);
		logger.info("게시판 글 삭제 결과, cnt={}", cnt);
		
		String msg="글 삭제 처리를 실패하였습니다.", url="/board/boardDetail?boardNo="+boardNo;
		if(cnt>0) {
			msg="글 삭제 처리를 완료하였습니다.";
			url="/board/boardList?boardFolderNo="+boardFolderNo;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	
}


