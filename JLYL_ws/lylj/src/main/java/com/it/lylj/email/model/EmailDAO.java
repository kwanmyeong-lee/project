package com.it.lylj.email.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.common.SearchVO;

@Mapper
public interface EmailDAO {
	int sendEmail(EmailVO vo);
	//메일 항복별 리스트 선택
	List<Map<String, Object>> selectTakeMailList(SearchVO searchVo);
	List<Map<String, Object>> selectSendMailList(SearchVO searchVo);
	List<Map<String, Object>> selectTempsaveMailList(SearchVO searchVo);
	List<Map<String, Object>> selectReservMailList(SearchVO searchVo);
	List<Map<String, Object>> selectTrashMailList(SearchVO searchVo);
	List<Map<String, Object>> selectNotReadMailList(SearchVO searchVo);
	List<Map<String, Object>> selectImportantMailList(SearchVO searchVo);
	//메일 항목별 size()
	int totalRecordByEmailTake(SearchVO searchVo);
	int totalRecordByEmailSend(SearchVO searchVo);
	int totalRecordByTempsave(SearchVO searchVo);
	int totalRecordByReserv(SearchVO searchVo);
	int totalRecordByTrash(SearchVO searchVo);
	int totalCountByReadDate(SearchVO searchVo);
	int totalCountByImportant(SearchVO searchVo);
	
	
	int deleteCheckMail(int mailNo);
	EmailVO selectByMailNo(int mailNo);
	int deleteCompleteMail(int mailNo);
	int updateReadDate(int mailNo);
	int updateNotReadDate(int mailNo);
	int updateInportant(int mailNo);
	int updateNotInportant(int mailNo);
	
	// 메인에 뿌려주기
	List<EmailVO> selectNotRead(String empNo);
	List<EmailVO> selectImportant(String empNo);
	List<EmailVO> selectTempSave(String empNo);
	List<EmailVO> selectReserve(String empNo);
	
}
