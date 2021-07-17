package com.it.lylj.common;

public interface ConstUtil {
	// 페이징 처리 관련 상수
	public static final int BLOCK_SIZE = 10; // 블럭 크기
	int RECORD_COUNT = 15; // 한 페이지에 보여줄 레코드 개수

	// 파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE = "emp";

	//사원사진파일저장경로(경로확인필요)-기성
	String EMP_UPLOAD_PATH = "emp_images";
	String EMP_FILE_UPLOAD_PATH_TEST = "E:\\gicording\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\emp_images";
	
	//자료실 - 파일 저장 경로
	String BOARD_UPLOAD_PATH = "pds_upload";
	String BOARD_UPLOAD_PATH_TEST = "E:\\gicording\\project\\JLYL_ws\\lylj\\src\\main\\webapp\\resources\\emp_images";
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_EMP_FLAG=1;		//사원등록시 사원이미지 
	int UPLOAD_BOARD_FLAG=2;	//자료실 없로드
}
