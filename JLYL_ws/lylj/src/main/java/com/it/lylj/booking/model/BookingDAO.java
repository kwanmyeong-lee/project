package com.it.lylj.booking.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingDAO {
	List<BookingVO> selectAllBookingByEmpNo(int empNo);
	int insertBooking(BookingVO vo);
}
