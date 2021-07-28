package com.it.lylj.booking.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookingServiceImpl implements BookingService{
	private final BookingDAO dao;
	
	@Override
	public List<BookingVO> selectAllBookingByEmpNo(int empNo) {
		return dao.selectAllBookingByEmpNo(empNo);
	}

	@Override
	public int insertBooking(BookingVO vo) {
		return dao.insertBooking(vo);
	}

	@Override
	public int updateBokkingByBookingNo(HashMap<String, Object> map) {
		return dao.updateBokkingByBookingNo(map);
	}

	@Override
	public List<BookingVO> selectAllBookingByAppFlag(int currentPage) {
		return dao.selectAllBookingByAppFlag(currentPage);
	}

	@Override
	public int selectCntAllByAppFlag() {
		return dao.selectCntAllByAppFlag();
	}

	@Override
	public List<BookingVO> selectAllBookingViewByEmpNo(int emoNo) {
		return dao.selectAllBookingViewByEmpNo(emoNo);
	}

}
