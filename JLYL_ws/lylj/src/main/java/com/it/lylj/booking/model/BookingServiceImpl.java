package com.it.lylj.booking.model;

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

}
