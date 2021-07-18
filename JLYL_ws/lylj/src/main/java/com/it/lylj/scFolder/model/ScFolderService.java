package com.it.lylj.scFolder.model;

import java.util.List;

public interface ScFolderService {
    public int insertDefaultScFolder(int empNo);
    public int insertScFolder(ScFolderVO vo);
    public List<ScFolderVO> selectAllScFolderByEmpNo(int empNo);
    public ScFolderVO selectScFolderByScFolderNo(int scheduleFolderNo);
    public int deleteScFolderByScFolderNo(int scheduleFolderNo);

}
