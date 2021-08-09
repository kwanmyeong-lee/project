package com.it.lylj.common;

public interface ConstUtil {
	// 페이징 처리 관련 상수
	public static final int BLOCK_SIZE = 10; // 블럭 크기
	int RECORD_COUNT = 15; // 한 페이지에 보여줄 레코드 개수
	
	// 전자 결재 
	int RECORD_COUNT_ELE = 5; // 한 페이지에 보여줄 레코드 개수
	int BLOCK_SIZE_ELE = 4; // 블럭크기
	
	// 휴가 목록 
	int RECORD_COUNT_ANN = 12; // 한 페이지에 보여줄 레코드 개수
	int BLOCK_SIZE_ANN = 5; // 블럭크기
	
	//사원리스트
	int EMP_RECORD_COUNT = 10;
	int EMP_BLOCK_SIZE = 5;
	
	//이메일목록
	int EMAIL_RECORD_COUNT = 12;
	int EMAIL_BLOCK_SIZE = 5;
	
	
	// 파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE = "emp";

	//사원사진파일저장경로(경로확인필요)-기성
	String EMP_UPLOAD_PATH = "emp_images";
	//String EMP_FILE_UPLOAD_PATH_TEST = "E:\\gicording\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\emp_images";
	//String EMP_FILE_UPLOAD_PATH_TEST = "C:\\Users\\93061\\OneDrive\\Desktop\\GitHub\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\emp_images";
	String EMP_FILE_UPLOAD_PATH_TEST = "E:\\[FINAL]\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\emp_images";
	
	
	//자료실 - 파일 저장 경로
	String BOARD_UPLOAD_PATH = "board_upFile";
	String BOARD_UPLOAD_PATH_TEST = "E:\\[FINAL]\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\board_upFile";
	//String BOARD_UPLOAD_PATH_TEST = "C:\\Users\\yooh0\\Documents\\GitHub\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\board_upFile";
	//String BOARD_UPLOAD_PATH_TEST = "C:\\Users\\93061\\OneDrive\\Desktop\\GitHub\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\board_upFile";
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_EMP_FLAG=1;		//사원등록시 사원이미지 
	int UPLOAD_BOARD_FLAG=2;	//자료실 없로드
	
	//예약 승인,대기,취소
	int BOOKING_APP_FLAG=2;
	int BOOKING_WAIT_FLAG=0;
	int BOOKING_RETURN_FLAG=1;
	
	
	
	
	//전자결재 파일 업로드 경로
	String ELECTRONIC_UPLOAD_PATH = "electronic_upFile";
	String ELECTRONIC_UPLOAD_PATH_REAL = "E:\\[FINAL]\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\electonic_stamp_upfile";
	//String ELECTRONIC_UPLOAD_PATH_REAL = "C:\\Users\\93061\\OneDrive\\Desktop\\GitHub\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\electonic_stamp_upfile";
	
	//전자결재 도장 업로드 경로
	String ELECTRONIC_STAMP_UPLOAD_PATH = "electronic_upFile";
	String ELECTRONIC_STAMPUP_LOAD_PATH_REAL = "E:\\[FINAL]\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\electonic_stamp_upfile";
	//String ELECTRONIC_STAMPUP_LOAD_PATH_REAL = "C:\\Users\\93061\\OneDrive\\Desktop\\GitHub\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\electonic_stamp_upfile";

	//이메일 파일 업로드 경로
	String EMAIL_UPLOAD_PATH = "email_upfile";
	String EMAIL_UPLOAD_PATH_REAL = "E:\\[FINAL]\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\email_upfile";
	//String EMAIL_UPLOAD_PATH_REAL = "E:\\gicording\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\email_upfile";
}
