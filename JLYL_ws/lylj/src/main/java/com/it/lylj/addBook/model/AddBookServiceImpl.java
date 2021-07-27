package com.it.lylj.addBook.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.lylj.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AddBookServiceImpl implements AddBookService{
	private final AddBookDAO addBookDao;

	@Override
	public int insertAddBook(AddBookVO vo) {
		return addBookDao.insertAddBook(vo);
	}

	@Override
	public 	List<Map<String, Object>> selectAllAddBook(SearchVO searchVo) {
		return addBookDao.selectAllAddBook(searchVo);
	}

	@Override
	public int selectAllTotalRecord(SearchVO searchVo) {
		return addBookDao.selectAllTotalRecord(searchVo);
	}

	@Override
	public AddBookVO selectByNo(int addressBookNo) {
		return addBookDao.selectByNo(addressBookNo);
	}
	
	@Override
	public int updateAddBook(AddBookVO vo) {
		return addBookDao.updateAddBook(vo);
	}

	@Override
	public int deleteAddBook(AddBookVO vo) {
		return addBookDao.deleteAddBook(vo);
	}

	@Override
	public List<Map<String, Object>> selectByFolNo(SearchVO searchVo) {
		return addBookDao.selectByFolNo(searchVo);
	}

	@Override
	public int selectByFolNoTotalRecord(SearchVO searchVo) {
		return addBookDao.selectByFolNoTotalRecord(searchVo);
	}

	

}
