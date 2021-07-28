package com.it.lylj.email.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.it.lylj.common.ConstUtil;
import com.it.lylj.common.FileUploadUtil;
import com.it.lylj.common.PaginationInfo;
import com.it.lylj.common.SearchVO;
import com.it.lylj.email.model.EmailListVO;
import com.it.lylj.email.model.EmailService;
import com.it.lylj.email.model.EmailVO;
import com.it.lylj.emailFile.model.EmailFileService;
import com.it.lylj.emailFile.model.EmailFileVO;
import com.it.lylj.emp.model.EmpService;
import com.it.lylj.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/email")
@RequiredArgsConstructor
public class EmailController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	private final EmailService emailService;
	private final EmpService empService;
	private final EmailFileService emailFileService;
	
	/* 이메일메인페이지 */
	@RequestMapping("/emailMain")
	public void emailMain(Model model) {
		logger.info("이메일메인페이지");
		model.addAttribute("navNo", 2);
	}
	
	/* 메일함 */
	@RequestMapping("/emailList")
	public void emailList(@RequestParam int empNo, @ModelAttribute SearchVO searchVo, @RequestParam(defaultValue = "0")int type, Model model) {
		logger.info("이메일 페이지, 파라미터 empNo={}",empNo);
		searchVo.setEmpNo(Integer.toString(empNo));
		//페이징처리
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(ConstUtil.EMAIL_BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.EMAIL_RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.EMAIL_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("이메일페이징, searchVo={}",searchVo);
		
		//리스트 
		List<Map<String, Object>> list = emailService.selectListByType(searchVo,type);
		logger.info("이메일목록, list.size()={}", list.size());
		
		int totalRecord = emailService.totalRecordByType(Integer.toString(empNo),type);
		logger.info("empNo={} ,totalRecord={}",empNo,totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("navNo", 2);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	
	
	/* 이메일쓰기 페이지 */
	@GetMapping("/emailWrite")
	public void emailWrite(@RequestParam(defaultValue = "0", required = false)int mailNo, @RequestParam(defaultValue = "0", required = false) int empNo, 
			@RequestParam(defaultValue = "0", required = false) String type, Model model) {
		logger.info("이메일쓰기 페이지");
		
		//답장,전달 확인 파라미터(메일번호)가 있는경우 처리
		if(type.equals("re")) {
		   EmailVO reEmailVo = emailService.selectByMailNo(mailNo);
		   model.addAttribute("reEmailVo", reEmailVo);
		}else if(type.equals("fw")) {
			EmailVO fwEmailVo= emailService.selectByMailNo(mailNo);
			model.addAttribute("fwEmailVo", fwEmailVo);
		}
		
		if(empNo!=0) {
			EmpVO empVo = empService.selectByEmpNo(empNo);
			model.addAttribute("empVo", empVo);
		}
		
		model.addAttribute("navNo", 2);
	}
	
	/* 이메일쓰기 처리 */
	@PostMapping("/emailWrite")
	public String emailWrite_post(@ModelAttribute EmailVO emailVo, @ModelAttribute EmailFileVO emailFileVo,
		    MultipartHttpServletRequest request, Model model) {
		logger.info("이메일 전송, emailVo={}", emailVo);
		//1 파라미터처리
		//사원번호 이름 분리작업
		String emailTaker = emailService.splitName(emailVo.getMailTake());
		logger.info("받는사람, emailTaker={}", emailTaker);
		//받는사람 존재여부체크
		int chkTaker = empService.selectCountByEmpNo(Integer.parseInt(emailTaker));
		logger.info("받는사람 존재여부, chkTaker={}", chkTaker);
		
		String msg="",url="/email/emailWrite";
		if(chkTaker==0) {
			msg="받으시는분을 확인해주세요";
			url="/email/emailWrite";
			
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			
			return "common/message";
		}
		emailVo.setMailTake(emailTaker);
		//메일 전송처리
		int cnt = emailService.sendEmail(emailVo);
		logger.info("전송결과, ent={},emailVo={}",cnt,emailVo);
		
		//파일업로드처리
		String fileName ="", originalFileName="";
		long fileSize = 0;
		
		List<MultipartFile> fileList = request.getFiles("upfile");
		logger.info("fileList={}",fileList);
		
		for(MultipartFile mf : fileList) {
			if(mf.getOriginalFilename() != "") {
				originalFileName = mf.getOriginalFilename();
				fileSize = mf.getSize();
				fileName = FileUploadUtil.getUniqueFileName(mf.getOriginalFilename());
				
				try {
					mf.transferTo(new File(ConstUtil.EMAIL_UPLOAD_PATH_REAL+"\\"+fileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				logger.info("파일 업로드 성공, fileName={}, originalFileName={}, fileSize={}", fileName, originalFileName, fileSize);
				emailFileVo.setMailNo(emailVo.getMailNo());
				emailFileVo.setFileName(fileName);
				emailFileVo.setFileOriginName(originalFileName);
				emailFileVo.setFileSize(fileSize);
				
				logger.info("emailFileVo={}",emailFileVo);
				
				int result = emailFileService.uploadEmailFile(emailFileVo);
				logger.info("result={}", result);
			}//if
		}//for
		
		//처리
		if(emailVo.getMailTempsave().equals("T")) {
			msg="임시저장되었습니다.";
			url="/email/emailList?empNo="+emailVo.getMailEmpno()+"&type=3";
		}else {
			if(cnt>0) {
				msg="메일이발송되었습니다";
				url="/email/emailMain";
			}else {
				msg="메일전송실패";
			}
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	
	/* 이메일 상세보기 */
	@RequestMapping("/emailDetail")
	public String emailDetail(@RequestParam(defaultValue = "0") int mailNo ,Model model) {
		logger.info("이메일 상세보기, 파라미터 mailNo={}",mailNo);
		
		//메일내용선택
		EmailVO emailVo = emailService.selectByMailNo(mailNo);
		//메일에 저장된 파일선택
		List<EmailFileVO> emailFileVo =emailFileService.selectFileByMailNo(mailNo);
		
		model.addAttribute("emailVo", emailVo);
		model.addAttribute("emailVo", emailFileVo);
		model.addAttribute("navNo", 2);
		
		return "email/emailDetail";
	}
	
	/* 미리보기 페이지 */
	@RequestMapping("/emailPreview")
	public String emailPreview(@ModelAttribute EmailVO vo
			, Model model) {
		logger.info("vo={}",vo);
		model.addAttribute("vo", vo);
		return "email/emailPreview";
	}
	
	/* 메일 다중 삭제 */
	@RequestMapping("/emailMultiDelete")
	public String emailMultiDelete(@ModelAttribute EmailListVO listVo, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("메일 선택 삭제, listVo={}",listVo);
		String empNo = (String)session.getAttribute("empNo");
		List<EmailVO> list = listVo.getSelectedEmail();
		
		for(int i=0; i<list.size(); i++) {
			EmailVO emailVo = list.get(i);
			int mailNo = emailVo.getMailNo();
			logger.info("i={},mailNo={}", i, mailNo);
		}
		
		String msg ="휴지통으로 이동하지 못했습니다", url = "/email/emailList?type=5&empNo="+empNo; 
		int cnt = emailService.deleteCheckMulti(list);
		
		if(cnt>0) {
			msg ="휴지통으로 이동시켰습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	/* 메일 다중 완전 삭제 */
	@RequestMapping("/emailMultiCompleteDel")
	public String emailMultiCompleteDel(@ModelAttribute EmailListVO listVo, HttpServletRequest request, HttpSession session, Model model) {
		logger.info("메일 선택 삭제, listVo={}",listVo);
		String empNo = (String)session.getAttribute("empNo");
		List<EmailVO> list = listVo.getSelectedEmail();
		
		for(int i=0; i<list.size(); i++) {
			EmailVO emailVo = list.get(i);
			int mailNo = emailVo.getMailNo();
			logger.info("i={},mailNo={}", i, mailNo);
		}
		
		String msg ="삭제 실패", url = "/email/emailMain"; 
		int cnt = emailService.deleteCompleteMail(list);
		
		if(cnt>0) {
			msg ="삭제 성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/* 이메일 읽음처리 */
	@RequestMapping("/emailRead")
	public String emailRead(@RequestParam(defaultValue = "0") int mailNo, Model model) {
		logger.info("읽음처리, mailNo={}",mailNo);
		
		int cnt = emailService.updateReadDate(mailNo);
		logger.info("읽음처리 결과 cnt={}",cnt);
		
		return "redirect:/email/emailDetail?mailNo="+mailNo;
		
	}
	@RequestMapping("/importantEmail")
	public String updateInportantMail(@RequestParam(defaultValue = "0") int mailNo, int type, HttpSession session, Model model ) {
		logger.info("중요메일, mailNo={}",mailNo);
		String empNo = (String)session.getAttribute("empNo");
		
		int cnt = emailService.updateInportant(mailNo);
		logger.info("중요처리 결과 cnt={}",cnt);
		
		return "redirect:/email/emailList?empNo="+empNo+"&type="+type;
	}
	
	@RequestMapping("/notImportantEmail")
	public String updateNotInportantMail(@RequestParam(defaultValue = "0") int mailNo, int type, HttpSession session, Model model ) {
		logger.info("중요메일, mailNo={}",mailNo);
		String empNo = (String)session.getAttribute("empNo");
		
		int cnt = emailService.updateNotInportant(mailNo);
		logger.info("중요처리 결과 cnt={}",cnt);
		
		return "redirect:/email/emailList?empNo="+empNo+"&type="+type;
	}
	
	@RequestMapping("/readMail")
	public String readMail(@RequestParam(defaultValue = "0") int mailNo, int type, HttpSession session, Model model ) {
		logger.info("메일읽음처리, mailNo={}",mailNo);
		String empNo = (String)session.getAttribute("empNo");
		
		int cnt = emailService.updateReadDate(mailNo);
		logger.info("메일읽음 결과 cnt={}",cnt);
		
		return "redirect:/email/emailList?empNo="+empNo+"&type="+type;
	}
	
	@RequestMapping("/notReadMail")
	public String notReadMail(@RequestParam(defaultValue = "0") int mailNo, int type, HttpSession session, Model model ) {
		logger.info("메일안읽음처리, mailNo={}",mailNo);
		String empNo = (String)session.getAttribute("empNo");
		
		int cnt = emailService.updateNotReadDate(mailNo);
		logger.info("메일안읽음 결과 cnt={}",cnt);
		
		return "redirect:/email/emailList?empNo="+empNo+"&type="+type;
	}
	
}
