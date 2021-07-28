package com.it.lylj.emailFile.model;

import java.util.List;

public interface EmailFileService {
	int uploadEmailFile(EmailFileVO emailFileVo);
	List<EmailFileVO> selectFileByMailNo(int mailNo);
}
