package com.it.lylj.scFolder.model;

import java.util.List;

public interface ScFolderService {
    public int insertScFolder(ScFolderVO vo);
    public List<ScFolderVO> selectAllScFolderByEmpNo(int empNo);
}
