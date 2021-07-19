package com.it.lylj.scFolder.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScFolderServiceImpl implements ScFolderService{
    private final ScFolderDAO dao;

    @Override
    public int insertDefaultScFolder(int empNo) {
        return dao.insertDefaultScFolder(empNo);
    }

    @Override
    public List<ScFolderVO> selectAllScFolderByEmpNo(int empNo) {
        return dao.selectAllScFolderByEmpNo(empNo);
    }

	@Override
	public ScFolderVO selectScFolderByScFolderNo(int scheduleFolderNo) {
		return dao.selectScFolderByScFolderNo(scheduleFolderNo);
	}

	@Override
	public int insertScFolder(ScFolderVO vo) {
		return dao.insertScFolder(vo);
	}

	@Override
	public int deleteScFolderByScFolderNo(int scheduleFolderNo) {
		return dao.deleteScFolderByScFolderNo(scheduleFolderNo);
	}

	@Override
	public int updateScFolderByScFolderNo(ScFolderVO vo) {
		return dao.updateScFolderByScFolderNo(vo);
	}



    
    
}