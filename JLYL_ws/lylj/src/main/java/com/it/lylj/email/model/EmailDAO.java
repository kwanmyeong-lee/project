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
	//메일 항목별 size()
	int totalRecordByEmailTake(String taker);
	int totalRecordByEmailSend(String empNo);
	
	EmailVO selectByMailNo(int mailNo);
}
