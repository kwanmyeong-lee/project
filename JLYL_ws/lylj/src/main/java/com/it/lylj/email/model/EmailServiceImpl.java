package com.it.lylj.email.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.lylj.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService{
	private final EmailDAO emailDao;
	
	@Override
	public int sendEmail(EmailVO vo) {
		return emailDao.sendEmail(vo);
	}
	
	// 101(이름) 에서 이름 분리 
	@Override
	public String splitName(String taker) {
		String[] splitTaker = taker.split("@");
		String emailTake = "";
		for(int i=0;i<splitTaker.length;i++) {
			emailTake = splitTaker[0];
		}
		
		return emailTake;
	}


	@Override
	public EmailVO selectByMailNo(int mailNo) {
		return emailDao.selectByMailNo(mailNo);
	}

	@Override
	public int totalRecordByEmailTake(String taker) {
		return emailDao.totalRecordByEmailTake(taker);
	}

	@Override
	public List<Map<String, Object>> selectMailList(SearchVO searchVo) {
		return emailDao.selectMailList(searchVo);
	}

	@Override
	public List<Map<String, Object>> selectSendMailList(SearchVO searchVo) {
		return emailDao.selectSendMailList(searchVo);
	}
}
