package com.it.lylj.emp.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpVO {
	private int EMP_NO; /* 사원 번호 */
	private String EMP_NAME; /* 사원 이름 */
	private String EMP_PWD; /* 비밀번호 */
	private String EMP_TEL; /* 전화번호 */
	private String EMP_EMAIL; /* 이메일 */
	private String EMP_ZIPCODE; /* 우편번호 */
	private String EMP_ADDRESS; /* 주소 */
	private String EMP_ADDRESSDETAIL;  /* 상세주소 */
	private Timestamp EMP_REGDATE;  /* 입사일 */
	private Timestamp EMP_RESDATE; /* 퇴사일 */
	private String EMP_PHOTO; /* 사원사진 */
	private int EMP_SALARY; /* 봉급 */
	private String EMP_ACCOUNT; /* 계좌 */
	private int EMP_ADMIN_LEV;  /* 관리자 레벨번호 */
	private Timestamp EMP_BIRTH; /* 생일 */
	private int MAIL_NO; /* 메일 번호 */
	private int DEPARTMENT_NO; /* 부서번호 */
	private int POSITION_NO; /* 직급 번호 */
}
