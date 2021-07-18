package com.it.lylj.electronic.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicServiceImpl implements ElectronicService{
	private final ElectronicDAO eletronicDao;
	
	
	@Override
	public int insertEle(ElectronicVo vo) {
		return eletronicDao.insertEle(vo);
	}

}
