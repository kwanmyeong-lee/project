package com.it.lylj.email.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.lylj.common.SearchVO;

@Mapper
public interface EmailDAO {
	int sendEmail(EmailVO vo);
	List<Map<String, Object>> selectMailList(SearchVO searchVo);
	List<Map<String, Object>> selectSendMailList(SearchVO searchVo);
	EmailVO selectByMailNo(int mailNo);
	int totalRecordByEmailTake(String taker);
	
}
