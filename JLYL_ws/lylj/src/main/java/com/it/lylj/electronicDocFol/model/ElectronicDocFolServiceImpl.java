package com.it.lylj.electronicDocFol.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicDocFolServiceImpl implements ElectronicDocFolService{
	private final ElectronicDocFolDAO eleDao;

	@Override
	public List<ElectronicDocFolVO> selectAll() {
		return eleDao.selectAll();
	}

}
