package com.it.lylj.email.model;

import java.util.List;
import java.util.Map;

import com.it.lylj.common.SearchVO;

public interface EmailService {
	int sendEmail(EmailVO vo);
	String splitName(String taker);
	List<Map<String, Object>> selectMailList(SearchVO searchVo);
	EmailVO selectByMailNo(int mailNo);
	int totalRecordByEmailTake(String taker);
	List<Map<String, Object>> selectSendMailList(SearchVO searchVo);
}
