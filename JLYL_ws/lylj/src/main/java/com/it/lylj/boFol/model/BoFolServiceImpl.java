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

	@Override
	public int insertBoFol(BoFolVO vo) {
		return dao.insertBoFol(vo);
	}

	@Override
	public int updateBoFol(BoFolVO vo) {
		return dao.updateBoFol(vo);
	}

	@Override
	public int deleteBoFol(int bookingFolderNo) {
		return dao.deleteBoFol(bookingFolderNo);
	}
}
