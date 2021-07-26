package com.it.lylj.email.model;

import java.util.List;
import java.util.Map;

public interface EmailService {
	int sendEmail(EmailVO vo);
	String splitName(String taker);
	List<Map<String, Object>> selectMailList(String taker);
	EmailVO selectByMailNo(int mailNo);
}
