package com.it.lylj.electronicFile.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ElectronicFileServiceImpl implements ElectronicFileService{
	private final ElectronicFileDAO electronicFileDao;

	@Override
	public int insertFile(ElectronicFileVo vo) {
		return electronicFileDao.insertFile(vo);
	}

	@Override
	public List<ElectronicFileVo> selectFileByEleNo(int electronicNo) {
		return electronicFileDao.selectFileByEleNo(electronicNo);
	}

	@Override
	public ElectronicFileVo selectFileByFileNo(int fileNo) {
		return electronicFileDao.selectFileByFileNo(fileNo);
	}
	
	
}
