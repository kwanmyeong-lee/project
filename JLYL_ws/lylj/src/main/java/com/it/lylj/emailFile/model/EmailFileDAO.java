package com.it.lylj.emailFile.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmailFileDAO {
	int uploadEmailFile(EmailFileVO emailFileVo);
	List<EmailFileVO> selectFileByMailNo(int mailNo);
}
