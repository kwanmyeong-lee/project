package com.it.lylj.email.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmailDAO {
	int sendEmail(EmailVO vo);
	List<Map<String, Object>> selectMailList(String taker);
	EmailVO selectByMailNo(int mailNo);
	int totalRecordByEmailTake(String taker);
}
