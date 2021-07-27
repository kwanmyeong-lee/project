package com.it.lylj.booking.model;

import java.util.HashMap;
import java.util.List;

public interface BookingService {
	List<BookingVO> selectAllBookingByEmpNo(int empNo);
	List<BookingVO> selectAllBookingByAppFlag(int currentPage);
	int insertBooking(BookingVO vo);
	int updateBokkingByBookingNo(HashMap<String, Object> map);
	int selectCntAllByAppFlag();
	List<BookingVO> selectAllBookingViewByEmpNo(int emoNo);


}
