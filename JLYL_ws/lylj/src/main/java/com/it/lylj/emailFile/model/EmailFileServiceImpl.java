package com.it.lylj.emailFile.model;

import java.util.List;

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

	@Override
	public EmailFileVO selectFileByFileNo(int fileNo) {
		return emailFileDao.selectFileByFileNo(fileNo);
	}

}
