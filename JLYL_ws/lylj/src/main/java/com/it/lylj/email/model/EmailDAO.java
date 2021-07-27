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
	int totalRecordByEmailTake(String empNo);
	int totalRecordByEmailSend(String empNo);
	int totalRecordByTempsave(String empNo);
	int totalRecordByReserv(String empNo);
	int totalRecordByTrash(String empNo);
	int totalCountByReadDate(String empNo);
	int totalCountByImportant(String empNo);
	
	
	int deleteCheckMail(int mailNo);
	EmailVO selectByMailNo(int mailNo);
	int deleteCompleteMail(int mailNo);
	int updateReadDate(int mailNo);
	
}
