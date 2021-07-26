package com.it.lylj.electronicAppStamp.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicAppStampServiceImpl implements ElectronicAppStampService{
	private final ElectronicAppStampDAO stampDao;

	@Override
	public int insertStamp(ElectronicAppStampVo stampVo) {
		
		int empNo = stampVo.getEmpNo();
		int result = 0;
		ElectronicAppStampVo vo = stampDao.selectByEmpNo(empNo);
		if(vo.getEmpNo() == empNo) {
			result = 0;
		}else {
			result = stampDao.insertStamp(stampVo);
		}
		
		return result;
	}

}
