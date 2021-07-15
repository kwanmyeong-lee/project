package com.it.lylj.scFolder.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScFolderDAO {
    public int insertScFolder(ScFolderVO vo);
    public List<ScFolderVO> selectAllScFolderByEmpNo(int empNo);
}
