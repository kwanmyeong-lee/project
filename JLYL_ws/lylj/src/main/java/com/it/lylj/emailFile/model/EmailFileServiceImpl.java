package com.it.lylj.emailFile.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmailFileServiceImpl implements EmailFileService{
	
	private final EmailFileDAO emailFileDao;
	
	@Override
	public int uploadEmailFile(EmailFileVO emailFileVo) {
		return emailFileDao.uploadEmailFile(emailFileVo);
	}

	@Override
	public List<EmailFileVO> selectFileByMailNo(int mailNo) {
		return emailFileDao.selectFileByMailNo(mailNo);
	}

}
