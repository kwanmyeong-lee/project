package com.it.lylj.boFol.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoFolServiceImpl implements BoFolService{
	private final BoFolDAO dao;
	
	@Override
	public List<BoFolVO> selectAllBoFol() {
		return dao.selectAllBoFol();
	}
}
