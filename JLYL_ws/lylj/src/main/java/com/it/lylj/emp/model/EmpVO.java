package com.it.lylj.emp.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class EmpVO {
	private int empNo; /* 사원 번호 */
	private String empName; /* 사원 이름 */
	private String empPwd; /* 비밀번호 */
	private String empTel; /* 전화번호 */
	private String empEmail; /* 이메일 */
	private String empZipcode; /* 우편번호 */
	private String empAddress; /* 주소 */
	private String empAddressdetail;  /* 상세주소 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empRegdate;  /* 입사일 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empResdate; /* 퇴사일 */
	private String empPhoto; /* 사원사진 */
	private int empSalary; /* 봉급 */
	private String empAccount; /* 계좌 */
	private int empAdminLev;  /* 관리자 레벨번호 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empBirth; /* 생일 */
	private int departmentNo; /* 부서번호 */
	private int positionNo; /* 직급 번호 */ 
	
}
