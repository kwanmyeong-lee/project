package com.it.lylj.email.model;

import java.util.List;
import java.util.Map;

import com.it.lylj.common.SearchVO;

public interface EmailService {
	// 항목별 메일함 상수
	int TAKE_MAIL = 1;
	int SEND_MAIL = 2;
	int TEMP_MAIL = 3;
	int BOOK_MAIL = 4;
	int TRASH_MAIL = 5;
	int NOTREAD_MAIL = 6;
	int IMPORTANT_MAIL = 7;

	int sendEmail(EmailVO vo);
	String splitName(String taker);
	List<Map<String, Object>> selectListByType(SearchVO searchVo, int type);
	EmailVO selectByMailNo(int mailNo);
	int totalRecordByType(String taker, int type);
	int deleteCheckMulti(List<EmailVO> list);
	int deleteCompleteMail(List<EmailVO> list);
	int updateReadDate(int mailNo);
	int updateInportant(int mailNo);
	int updateNotInportant(int mailNo);
	int updateNotReadDate(int mailNo);
}
