package com.it.lylj.booking.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingDAO {
	List<BookingVO> selectAllBookingByEmpNo(int empNo);
	List<BookingVO> selectAllBookingByAppFlag(int currentPage);
	int insertBooking(BookingVO vo);
	int updateBokkingByBookingNo(HashMap<String, Object> map);
	int selectCntAllByAppFlag();
}
