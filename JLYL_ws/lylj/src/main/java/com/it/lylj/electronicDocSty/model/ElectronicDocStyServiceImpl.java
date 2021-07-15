package com.it.lylj.electronicDocSty.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicDocStyServiceImpl implements ElectronicDocStyService {
	private final ElectronicDocStyDAO eleDao;

	@Override
	public List<ElectronicDocStyVO> selectAll() {
		return eleDao.selectAll();
	}

	@Override
	public ElectronicDocStyVO selectByStyleNo(String styleNo) {
		return eleDao.selectByStyleNo(styleNo);
	}

}
