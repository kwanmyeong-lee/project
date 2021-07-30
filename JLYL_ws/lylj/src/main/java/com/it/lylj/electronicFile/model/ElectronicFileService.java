package com.it.lylj.electronicFile.model;

import java.util.List;

public interface ElectronicFileService {

	int insertFile(ElectronicFileVo vo);
	List<ElectronicFileVo> selectFileByEleNo(int electronicNo);
	ElectronicFileVo selectFileByFileNo(int fileNo);
	int deleteFile(int electronicNo);
}
