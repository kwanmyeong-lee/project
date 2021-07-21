package com.it.lylj.booking.model;

import java.util.List;

public interface BookingService {
	List<BookingVO> selectAllBookingByEmpNo(int empNo);
	int insertBooking(BookingVO vo);
}
