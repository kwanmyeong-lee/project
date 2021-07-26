package com.it.lylj.electronicAppStamp.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicAppStampServiceImpl implements ElectronicAppStampService{
	private final ElectronicAppStampDAO stampDao;

	@Override
	public int insertStamp(ElectronicAppStampVo stampVo) {
		return stampDao.insertStamp(stampVo);
	}

}
