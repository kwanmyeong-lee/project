package com.it.lylj.booking.model;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookingVO {
	private int bookingNo;  /* 예약 번호 */
	private int EMP_NO; /* 사원 번호 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp bookingCurrent; /* 신청 시간 */
	private String bookingStart; /* 예약 시간 */
	private String bookingEnd; /* 예약 종료 시간 */
	private String bookingAppFlag; /* 승인 여부 */
	private String bookingDelFlag; /* 취소 여부 */
	private int bookingTargetNo; /* 예약 대상 번호 */
	private String bookingContent; /* 예약 내용 */
}
