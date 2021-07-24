------------------------- DROP ---------------------------------
DROP TABLE EMP CASCADE CONSTRAINTS ;
DROP TABLE BOOKING CASCADE CONSTRAINTS ;
DROP TABLE BOTARGET CASCADE  CONSTRAINTS ;
DROP TABLE BOFOL CASCADE CONSTRAINTS ;
DROP TABLE CALENDAR CASCADE CONSTRAINTS ;
DROP TABLE SCTHEME CASCADE CONSTRAINTS ;
DROP TABLE SCFOLDER CASCADE CONSTRAINTS ;
DROP TABLE OFBOARDCOM CASCADE CONSTRAINTS ;
DROP TABLE OFBOARD CASCADE CONSTRAINTS ;
DROP TABLE OFBOARDFOL CASCADE CONSTRAINTS ;
DROP TABLE OFBOARDFILE CASCADE CONSTRAINTS ;
DROP TABLE OFBOARDLIKE CASCADE CONSTRAINTS ;
DROP TABLE ATTENDDAY CASCADE CONSTRAINTS ;
DROP TABLE ATTEND CASCADE CONSTRAINTS ;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS ;
DROP TABLE POSITION CASCADE CONSTRAINTS ;
DROP TABLE RELINE CASCADE CONSTRAINTS ;
DROP TABLE ELFILE CASCADE CONSTRAINTS ;
DROP TABLE DOCFOL CASCADE CONSTRAINTS ;
DROP TABLE DOCSTY CASCADE CONSTRAINTS ;
DROP TABLE ELIMP CASCADE CONSTRAINTS ;
DROP TABLE APPLINE CASCADE CONSTRAINTS ;
DROP TABLE APPSTAMP CASCADE CONSTRAINTS ;
DROP TABLE ADDFOL CASCADE CONSTRAINTS ;
DROP TABLE ADDBOOK CASCADE CONSTRAINTS ;
DROP TABLE MAIL CASCADE CONSTRAINTS ;
DROP TABLE MAILFILE CASCADE CONSTRAINTS ;
DROP TABLE BREAKDAY CASCADE CONSTRAINTS ;
DROP TABLE BREAKTHEME CASCADE CONSTRAINTS ;

DROP SEQUENCE EMP_SEQ;
DROP SEQUENCE SCHEDULE_SEQ;
DROP SEQUENCE DOCSTY_SEQ;
DROP SEQUENCE DOCFOL_SEQ;
DROP SEQUENCE APPSTAMP_SEQ;
DROP SEQUENCE OFBOARD_SEQ;
DROP SEQUENCE OFBOARDFOL_SEQ;
DROP SEQUENCE ELIMP_SEQ;
DROP SEQUENCE OFBOARDFILE_SEQ;
DROP SEQUENCE OFBOARDCOM_SEQ;
DROP SEQUENCE APPLINE_SEQ;
DROP SEQUENCE RELINE_SEQ;
DROP SEQUENCE SCFOLDER_SEQ;
DROP SEQUENCE BOFOL_SEQ;
DROP SEQUENCE BOTARGET_SEQ;
DROP SEQUENCE BOOKING_SEQ;
DROP SEQUENCE BREAKDAY_SEQ;
DROP SEQUENCE ATTEND_SEQ;
DROP SEQUENCE ATTENDDAY_SEQ;
DROP SEQUENCE BREAKTHEME_SEQ;
DROP SEQUENCE ELFILE_SEQ;
DROP SEQUENCE ADDBOOK_SEQ;
DROP SEQUENCE ADDFOL_SEQ;
DROP SEQUENCE MAIL_SEQ;

DROP VIEW selectstamp;
DROP VIEW apEleList;
DROP VIEW reEleList;
DROP VIEW breakDayView;
DROP VIEW empView;
DROP VIEW emailView;

------------------------- DROP ---------------------------------

------------------------- SEQ ----------------------------------

CREATE SEQUENCE EMP_SEQ
MINVALUE 100 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 100 
NOCACHE;

CREATE SEQUENCE SCFOLDER_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE SCHEDULE_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE BOFOL_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE BOTARGET_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE BOOKING_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE ATTENDDAY_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
NOCACHE;

CREATE SEQUENCE ATTEND_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
NOCACHE;

CREATE SEQUENCE BREAKTHEME_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
NOCACHE;

CREATE SEQUENCE BREAKDAY_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
NOCACHE;

CREATE SEQUENCE DOCSTY_SEQ
MINVALUE 100
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 100
NOCACHE;

CREATE SEQUENCE DOCFOL_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE APPSTAMP_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE OFBOARDFOL_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 4 
NOCACHE;

CREATE SEQUENCE OFBOARD_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE ELIMP_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE OFBOARDFILE_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
NOCACHE;

CREATE SEQUENCE OFBOARDCOM_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE APPLINE_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
NOCACHE;

CREATE SEQUENCE RELINE_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1
NOCACHE;


CREATE SEQUENCE ELFILE_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1;

CREATE SEQUENCE ADDFOL_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE ADDBOOK_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;

CREATE SEQUENCE MAIL_SEQ
MINVALUE 1 
MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE;
------------------------- SEQ -----------------------------------------
-----------------------CREATE TABLE----------------------------------

/* 사용자 */
CREATE TABLE EMP (
	EMP_NO NUMBER NOT NULL, /* 사원 번호 */
	EMP_NAME VARCHAR2(255), /* 사원 이름 */
	EMP_PWD VARCHAR2(255), /* 비밀번호 */
	EMP_TEL VARCHAR2(255), /* 전화번호 */
	EMP_EMAIL VARCHAR2(255), /* 이메일 */
	EMP_ZIPCODE NUMBER, /* 우편번호 */
	EMP_ADDRESS VARCHAR2(255), /* 주소 */
	EMP_ADDRESSDETAIL VARCHAR2(255), /* 상세주소 */
	EMP_REGDATE DATE, /* 입사일 */
	EMP_RESDATE DATE, /* 퇴사일 */
	EMP_PHOTO VARCHAR2(255), /* 사원사진 */
	EMP_SALARY NUMBER, /* 봉급 */
	EMP_ACCOUNT VARCHAR2(255), /* 계좌 */
	EMP_ADMIN_LEV NUMBER, /* 관리자 레벨번호 */
	EMP_BIRTH DATE, /* 생일 */
	DEPARTMENT_NO NUMBER, /* 부서번호 */
	POSITION_NO NUMBER /* 직급 번호 */
);

CREATE UNIQUE INDEX PK_EMP
	ON EMP (
		EMP_NO ASC
	);

ALTER TABLE EMP
	ADD
		CONSTRAINT PK_EMP
		PRIMARY KEY (
			EMP_NO
		);

/* 전자결재정보 */
CREATE TABLE ELIMP (
	ELECTRONIC_NO NUMBER NOT NULL, /* 문서번호 */
	ELECTRONIC_DATE DATE DEFAULT SYSDATE, /* 기안일자 */
	ELECTRONIC_TITLE VARCHAR2(255) NOT NULL, /* 기안제목 */
	ELECTRONIC_CONTENT CLOB NOT NULL, /* 기안내용 */
	ELECTRONIC_FILE_FLAG VARCHAR2(255), /* 첨부파일여부 */
	ELECTRONIC_COMPLET_FLAG VARCHAR2(255) DEFAULT '0', /* 완료여부 */
	ELECTRONIC_EMERGENCY_FLAG VARCHAR2(255) DEFAULT '0', /* 긴급 여부 */
	EMP_NO NUMBER, /* 기안자 */
	STYLE_NO NUMBER, /* 양식번호 */
	ELECTRONIC_DRAFT VARCHAR2(255) DEFAULT '0' /* 임시저장 여부 */
);

CREATE UNIQUE INDEX PK_ELIMP
	ON ELIMP (
		ELECTRONIC_NO ASC
	);

ALTER TABLE ELIMP
	ADD
		CONSTRAINT PK_ELIMP
		PRIMARY KEY (
			ELECTRONIC_NO
		);

/* 메일 */
CREATE TABLE MAIL (
	MAIL_NO NUMBER NOT NULL, /* 메일 번호 */
	MAIL_TITLE VARCHAR2(255) NOT NULL, /* 제목 */
	MAIL_CONTENT CLOB NOT NULL, /* 내용 */
	MAIL_SEND VARCHAR2(255) NOT NULL, /* 보낸사람 */
	MAIL_TAKE VARCHAR2(255) NOT NULL, /* 받는사람 */
	MAIL_SENDDATE DATE DEFAULT SYSDATE, /* 보낸 날짜 */
	MAIL_READDATE DATE, /* 읽은 날짜 */
	MAIL_RESERVE DATE, /* 예약 날짜 */
	MAIL_DEL_CHECK VARCHAR2(255) DEFAULT 0, /* 삭제 여부 */
	MAIL_EMPNO NUMBER NOT NULL /* 사원번호 */
);

CREATE UNIQUE INDEX PK_MAIL
	ON MAIL (
		MAIL_NO ASC
	);

ALTER TABLE MAIL
	ADD
		CONSTRAINT PK_MAIL
		PRIMARY KEY (
			MAIL_NO
		);

/* 근태 */
CREATE TABLE ATTEND (
	ATTENDANCE_NO NUMBER NOT NULL, /* 근태 번호 */
	EMP_NO NUMBER, /* 사원 번호 */
	ATTENDANCE_ANNUAL_COUNT NUMBER DEFAULT 21, /* 연차 갯수 */
	ATTENDANCE_ANNUAL_USE NUMBER DEFAULT 0, /* 연차 사용일 */
	ATTENDANCE_LATE_COUNT NUMBER DEFAULT 0, /* 지각 일수 */
	ATTENDANCE_REWARD_COUNT NUMBER DEFAULT 0, /* 보상 휴가 일수 */
	ATTENDANCE_REWARD_USE NUMBER DEFAULT 0 /* 보상휴가 사용일 */
);

CREATE UNIQUE INDEX PK_ATTEND
	ON ATTEND (
		ATTENDANCE_NO ASC
	);

ALTER TABLE ATTEND
	ADD
		CONSTRAINT PK_ATTEND
		PRIMARY KEY (
			ATTENDANCE_NO
		);

/* 게시판 */
CREATE TABLE OFBOARD (
	BOARD_NO NUMBER NOT NULL, /* 게시판 번호 */
	EMP_NO NUMBER, /* 사원 번호 */
	BOARD_TITLE VARCHAR2(255) NOT NULL, /* 제목 */
	BOARD_CONTENT CLOB, /* 내용 */
	BOARD_WRITER VARCHAR2(255) NOT NULL, /* 글쓴이 */
	BOARD_HITS NUMBER DEFAULT 1, /* 조회수 */
	BOARD_DATE DATE DEFAULT SYSDATE, /* 작성일 */
	BOARD_FOLDER_NO NUMBER, /* 게시판 폴더 번호 */
    commentCnt NUMBER default 0 /* 댓글 수 */
);

CREATE UNIQUE INDEX PK_OFBOARD
	ON OFBOARD (
		BOARD_NO ASC
	);

ALTER TABLE OFBOARD
	ADD
		CONSTRAINT PK_OFBOARD
		PRIMARY KEY (
			BOARD_NO
		);

/* 예약 */
CREATE TABLE BOOKING (
	BOOKING_NO NUMBER NOT NULL, /* 예약 번호 */
	EMP_NO NUMBER, /* 사원 번호 */
	BOOKING_CURRENT DATE DEFAULT SYSDATE, /* 신청 시간 */
	BOOKING_START VARCHAR2(255), /* 예약 시간 */
	BOOKING_END VARCHAR2(255), /* 예약 종료 시간 */
	BOOKING_APP_FLAG VARCHAR2(255) DEFAULT '0', /* 승인 여부 */
	BOOKING_DEL_FLAG VARCHAR2(255) DEFAULT '0', /* 취소 여부 */
	BOOKING_TARGET_NO NUMBER, /* 예약 대상 번호 */
	BOOKING_CONTENT CLOB, /* 예약 내용 */
	SCHEDULE_NO NUMBER DEFAULT 0 /* 달력 번호 */
);

CREATE UNIQUE INDEX PK_BOOKING
	ON BOOKING (
		BOOKING_NO ASC
	);

ALTER TABLE BOOKING
	ADD
		CONSTRAINT PK_BOOKING
		PRIMARY KEY (
			BOOKING_NO
		);

/* 결제라인 */
CREATE TABLE APPLINE (
	APPROVAL_LINE_NO NUMBER NOT NULL, /* 결제라인번호 */
	ELECTRONIC_NO NUMBER, /* 문서번호 */
	EMP_NO NUMBER, /* 결제자 */
	APPROVAL_LINE_COMPLETE_FLAG VARCHAR2(255) DEFAULT '0', /* 대기예정승인여부 */
	APPROVAL_LINE_ORDER NUMBER DEFAULT 0 /* 결재순서 */
);

CREATE UNIQUE INDEX PK_APPLINE
	ON APPLINE (
		APPROVAL_LINE_NO ASC
	);

ALTER TABLE APPLINE
	ADD
		CONSTRAINT PK_APPLINE
		PRIMARY KEY (
			APPROVAL_LINE_NO
		);

/* 파일 */
CREATE TABLE ELFILE (
	FILE_NO NUMBER NOT NULL, /* 파일번호 */
	FILE_NAME VARCHAR2(255) NOT NULL, /* 파일이름 */
	FILE_ORIGINALNAME VARCHAR2(255) NOT NULL, /* 원래파일이름 */
	FILE_SIZE NUMBER NOT NULL, /* 파일용량 */
	ELECTRONIC_NO NUMBER /* 문서번호 */	
);

CREATE UNIQUE INDEX PK_ELFILE
	ON ELFILE (
		FILE_NO ASC
	);

ALTER TABLE ELFILE
	ADD
		CONSTRAINT PK_ELFILE
		PRIMARY KEY (
			FILE_NO
		);

/* 문서양식 */
CREATE TABLE DOCSTY (
	STYLE_NO NUMBER NOT NULL, /* 양식번호 */
	STYLE_NAME VARCHAR2(255) NOT NULL, /* 양식이름 */
	STYLE_CONTENT CLOB, /* 양식내용 */
	FOLDER_NO NUMBER /* 문서 폴더 번호 */
);

CREATE UNIQUE INDEX PK_DOCSTY
	ON DOCSTY (
		STYLE_NO ASC
	);

ALTER TABLE DOCSTY
	ADD
		CONSTRAINT PK_DOCSTY
		PRIMARY KEY (
			STYLE_NO
		);

/* 결제도장등록 */
CREATE TABLE APPSTAMP (
	STAMP_NO NUMBER NOT NULL, /* 도장번호 */
	EMP_NO NUMBER, /* 사원 번호 */
	STAMP_NAME VARCHAR2(255) NOT NULL /* 파일이름 */
);

CREATE UNIQUE INDEX PK_APPSTAMP
	ON APPSTAMP (
		STAMP_NO ASC
	);

ALTER TABLE APPSTAMP
	ADD
		CONSTRAINT PK_APPSTAMP
		PRIMARY KEY (
			STAMP_NO
		);

/* 부서 */
CREATE TABLE DEPARTMENT (
	DEPARTMENT_NO NUMBER NOT NULL, /* 부서번호 */
	DEPARTMENT_NAME VARCHAR2(255) NOT NULL /* 부서이름 */
);

CREATE UNIQUE INDEX PK_DEPARTMENT
	ON DEPARTMENT (
		DEPARTMENT_NO ASC
	);

ALTER TABLE DEPARTMENT
	ADD
		CONSTRAINT PK_DEPARTMENT
		PRIMARY KEY (
			DEPARTMENT_NO
		);

/* 직급 */
CREATE TABLE POSITION (
	POSITION_NO NUMBER NOT NULL, /* 직급 번호 */
	POSITION_NAME VARCHAR2(255) NOT NULL /* 직급 이름 */
);

CREATE UNIQUE INDEX PK_POSITION
	ON POSITION (
		POSITION_NO ASC
	);

ALTER TABLE POSITION
	ADD
		CONSTRAINT PK_POSITION
		PRIMARY KEY (
			POSITION_NO
		);

/* 메일 첨부파일 */
CREATE TABLE MAILFILE (
	FILENO NUMBER NOT NULL, /* 파일번호 */
	MAIL_NO NUMBER, /* 메일 번호 */
	FILENAME VARCHAR2(255) NOT NULL, /* 파일이름 */
	FILEORIGINNAME VARCHAR2(255) NOT NULL, /* 원래파일이름 */
	FILESIZE NUMBER NOT NULL /* 파일용량 */
);

CREATE UNIQUE INDEX PK_MAILFILE
	ON MAILFILE (
		FILENO ASC
	);

ALTER TABLE MAILFILE
	ADD
		CONSTRAINT PK_MAILFILE
		PRIMARY KEY (
			FILENO
		);

/* 날짜별 근태 정보 */
CREATE TABLE ATTENDDAY (
	ATTENDANCE_DAY_NO NUMBER NOT NULL, /* 날짜 근태 번호 */
	EMP_NO NUMBER, /* 사원 번호 */
	ATTENDANCE_DAY_ON_HOUR DATE, /* 출근 시간 */
	ATTENDANCE_DAY_OFF_HOUR DATE, /* 퇴근 시간 */
	ATTENDANCE_DAY_WORK_HOUR DATE, /* 근무 시간 */
	ATTENDANCE_DAY_HOLIDAY_FLAG VARCHAR2(255) DEFAULT 0, /* 휴일 여부 */
	ATTENDANCE_DAY_REGDATE DATE NOT NULL /* 등록 날짜 */
);

CREATE UNIQUE INDEX PK_ATTENDDAY
	ON ATTENDDAY (
		ATTENDANCE_DAY_NO ASC
	);

ALTER TABLE ATTENDDAY
	ADD
		CONSTRAINT PK_ATTENDDAY
		PRIMARY KEY (
			ATTENDANCE_DAY_NO
		);

/* 게시판 첨부파일 */
CREATE TABLE OFBOARDFILE (
	BOARD_FILE_NO NUMBER NOT NULL, /* 파일번호 */
	BOARD_NO NUMBER NOT NULL, /* 게시판 번호 */
	FILENAME VARCHAR2(255), /* 파일이름 */
	ORIGINALFILENAME VARCHAR2(255), /* 원래파일이름 */
	FILESIZE NUMBER /* 파일용량 */
);

CREATE UNIQUE INDEX PK_OFBOARDFILE
	ON OFBOARDFILE (
		BOARD_FILE_NO ASC
	);

ALTER TABLE OFBOARDFILE
	ADD
		CONSTRAINT PK_OFBOARDFILE
		PRIMARY KEY (
			BOARD_FILE_NO
		);

/* 게시판 댓글 */
CREATE TABLE OFBOARDCOM (
	BOARD_COMMENT_NO NUMBER NOT NULL, /* 댓글 번호 */
	BOARD_NO NUMBER, /* 게시판 번호 */
	BOARD_COMMENT_CONTENT VARCHAR2(255) NOT NULL, /* 내용 */
	BOARD_COMMENT_WRITER VARCHAR2(255) NOT NULL, /* 글쓴이 */
	BOARD_COMMENT_DATE DATE DEFAULT SYSDATE, /* 작성일 */
	BOARD_COMMENT_DEL_FLAG VARCHAR2(255) DEFAULT '0', /* 삭제 여부 */
	BOARD_COMMENT_GROUP_NO NUMBER, /* 그룹 번호 */
    BOARD_COMMENT_STEP_NO NUMBER DEFAULT '0'/* 단계 번호 */
);

CREATE UNIQUE INDEX PK_OFBOARDCOM
	ON OFBOARDCOM (
		BOARD_COMMENT_NO ASC
	);

ALTER TABLE OFBOARDCOM
	ADD
		CONSTRAINT PK_OFBOARDCOM
		PRIMARY KEY (
			BOARD_COMMENT_NO
		);

/* 좋아요 */
CREATE TABLE OFBOARDLIKE (
	BOARD_NO NUMBER, /* 게시판 번호 */
	EMP_NO NUMBER /* 사원 번호 */
);

/* 주소록 정보 */
CREATE TABLE ADDBOOK (
	ADDRESSBOOK_NO NUMBER NOT NULL, /* 주소록 정보 번호 */
	EMP_NO NUMBER, /* 사원 번호 */
	ADDRESSBOOK_NAME VARCHAR2(255) NOT NULL, /* 이름 */
	ADDRESSBOOK_TEL VARCHAR2(255) NOT NULL, /* 전화번호 */
	ADDRESSBOOK_MAILE VARCHAR2(255), /* 이메일 */
	ADDRESSBOOK_POSITION VARCHAR2(255), /* 직급 */
	ADDRESS_FOLDER_NO NUMBER NOT NULL/* 주소록 폴더 번호 */
);

CREATE UNIQUE INDEX ADDRESSBOOK
	ON ADDBOOK (
		ADDRESSBOOK_NO ASC
	);

ALTER TABLE ADDBOOK
	ADD
		CONSTRAINT ADDRESSBOOK
		PRIMARY KEY (
			ADDRESSBOOK_NO
		);

/* 달력 */
CREATE TABLE CALENDAR (
	SCHEDULE_NO NUMBER NOT NULL, /* 달력 번호 */
	SCHEDULE_TITLE VARCHAR2(255) NOT NULL, /* 달력 제목 */
	SCHEDULE_START VARCHAR2(255), /* 달력 시작날짜 */
	SCHEDULE_END VARCHAR2(255), /* 달력 종료날짜 */
	SCHEDULE_ALLDAY VARCHAR2(255), /* 달력 종일 여부 */
	SCHEDULE_COLOR VARCHAR2(255), /* 달력 색 */
	SCHEDULE_FOLDER_NO NUMBER DEFAULT 0, /* 예약 폴더 번호 */
	SCHEDULE_THEME_NO NUMBER, /* 스케줄 구분 번호 */
	EMP_NO NUMBER, /* 사원 번호 */
	BOOKING_TARGET_NO NUMBER DEFAULT 0, /* 예약 대상 번호 */
	SCHEDULE_CONTENT CLOB /* 달력 내용 */
);

CREATE UNIQUE INDEX PK_CALENDAR
	ON CALENDAR (
		SCHEDULE_NO ASC
	);

ALTER TABLE CALENDAR
	ADD
		CONSTRAINT PK_CALENDAR
		PRIMARY KEY (
			SCHEDULE_NO
		);

/* 주소록 폴더 */
CREATE TABLE ADDFOL (
	ADDRESS_FOLDER_NO NUMBER NOT NULL, /* 주소록 폴더 번호 */
	EMP_NO NUMBER NOT NULL, /* 사원 번호 */
	ADDRESS_FOLDER_NAME VARCHAR2(255) /* 폴더 이름 */
);

CREATE UNIQUE INDEX PK_ADDFOL
	ON ADDFOL (
		ADDRESS_FOLDER_NO ASC
	);

ALTER TABLE ADDFOL
	ADD
		CONSTRAINT PK_ADDFOL
		PRIMARY KEY (
			ADDRESS_FOLDER_NO
		);

/* 일정 폴더 */
CREATE TABLE SCFOLDER (
	SCHEDULE_FOLDER_NO NUMBER NOT NULL, /* 일정 폴더 번호 */
	SCHEDULE_FOLDER_NAME VARCHAR2(255), /* 일정 폴더 이름 */
	SCHEDULE_FOLDER_COLOR VARCHAR2(255), /* 색 */
	EMP_NO NUMBER /* 사원 번호 */
);

CREATE UNIQUE INDEX PK_SCFOLDER
	ON SCFOLDER (
		SCHEDULE_FOLDER_NO ASC
	);

ALTER TABLE SCFOLDER
	ADD
		CONSTRAINT PK_SCFOLDER
		PRIMARY KEY (
			SCHEDULE_FOLDER_NO
		);

/* 스케줄 구분 */
CREATE TABLE SCTHEME (
	SCHEDULE_THEME_NO NUMBER NOT NULL, /* 구분 번호 */
	SCHEDULE_THEME_NAME VARCHAR2(255) /* 구분 이름 */
);

CREATE UNIQUE INDEX PK_SCTHEME
	ON SCTHEME (
		SCHEDULE_THEME_NO ASC
	);

ALTER TABLE SCTHEME
	ADD
		CONSTRAINT PK_SCTHEME
		PRIMARY KEY (
			SCHEDULE_THEME_NO
		);

/* 예약 폴더 */
CREATE TABLE BOFOL (
	BOOKING_FOLDER_NO NUMBER NOT NULL, /* 예약 폴더 번호 */
	BOOKING_FOLDER_NAME VARCHAR2(255) /* 예약 폴더 이름 */
);

CREATE UNIQUE INDEX PK_BOFOL
	ON BOFOL (
		BOOKING_FOLDER_NO ASC
	);

ALTER TABLE BOFOL
	ADD
		CONSTRAINT PK_BOFOL
		PRIMARY KEY (
			BOOKING_FOLDER_NO
		);

/* 게시판 폴더 */
CREATE TABLE OFBOARDFOL (
	BOARD_FOLDER_NO NUMBER NOT NULL, /* 게시판 폴더 번호 */
	BOARD_FOLDER__NAME VARCHAR2(255) /* 게시판 폴더 이름 */
);

CREATE UNIQUE INDEX PK_OFBOARDFOL
	ON OFBOARDFOL (
		BOARD_FOLDER_NO ASC
	);

ALTER TABLE OFBOARDFOL
	ADD
		CONSTRAINT PK_OFBOARDFOL
		PRIMARY KEY (
			BOARD_FOLDER_NO
		);

/* 예약 대상 */
CREATE TABLE BOTARGET (
	BOOKING_TARGET_NO NUMBER NOT NULL, /* 예약 대상 번호 */
	BOOKING_TARGET_NAME VARCHAR2(255), /* 예약 대상 이름 */
	BOOKING_FOLDER_NO NUMBER /* 예약 폴더 번호 */
);

CREATE UNIQUE INDEX PK_BOTARGET
	ON BOTARGET (
		BOOKING_TARGET_NO ASC
	);

ALTER TABLE BOTARGET
	ADD
		CONSTRAINT PK_BOTARGET
		PRIMARY KEY (
			BOOKING_TARGET_NO
		);

/* 문서폴더 */
CREATE TABLE DOCFOL (
	FOLDER_NO NUMBER NOT NULL, /* 문서 폴더 번호 */
	FOLDER_NAME VARCHAR(255) DEFAULT '기본' /* 문서 폴더 이름 */
);

CREATE UNIQUE INDEX PK_DOCFOL
	ON DOCFOL (
		FOLDER_NO ASC
	);

ALTER TABLE DOCFOL
	ADD
		CONSTRAINT PK_DOCFOL
		PRIMARY KEY (
			FOLDER_NO
		);

/* 수신라인 */
CREATE TABLE RELINE (
	RECEIVE_LINE_NO NUMBER NOT NULL, /* 수신라인번호 */
	ELECTRONIC_NO NUMBER, /* 문서번호 */
	EMP_NO NUMBER, /* 수신자 */
	RECEIVE_LINE_FLAG VARCHAR2(255) DEFAULT '0' /* 수신확인여부 */
);

CREATE UNIQUE INDEX PK_RELINE
	ON RELINE (
		RECEIVE_LINE_NO ASC
	);

ALTER TABLE RELINE
	ADD
		CONSTRAINT PK_RELINE
		PRIMARY KEY (
			RECEIVE_LINE_NO
		);

/* 휴가 정보 */
CREATE TABLE BREAKDAY (
	BREAKDAY_NO NUMBER NOT NULL, /* 휴가 번호 */
	BREAKDAY_START DATE, /* 시작일 */
	BREAKDAY_END DATE, /* 마지막일 */
	EMP_NO NUMBER, /* 사원 번호 */
	BREAKTHEME_NO NUMBER /* 휴가 종류 번호 */
);

CREATE UNIQUE INDEX PK_BREAKDAY
	ON BREAKDAY (
		BREAKDAY_NO ASC
	);

ALTER TABLE BREAKDAY
	ADD
		CONSTRAINT PK_BREAKDAY
		PRIMARY KEY (
			BREAKDAY_NO
		);

/* 휴가 종류 */
CREATE TABLE BREAKTHEME (
	BREAKTHEME_NO NUMBER NOT NULL, /* 휴가 종류 번호 */
	BREAKTHEME_NAME VARCHAR2(255) /* 휴가 종류 이름 */
);

CREATE UNIQUE INDEX PK_BREAKTHEME
	ON BREAKTHEME (
		BREAKTHEME_NO ASC
	);

ALTER TABLE BREAKTHEME
	ADD
		CONSTRAINT PK_BREAKTHEME
		PRIMARY KEY (
			BREAKTHEME_NO
		);

ALTER TABLE EMP
	ADD
		CONSTRAINT FK_DEPARTMENT_TO_EMP
		FOREIGN KEY (
			DEPARTMENT_NO
		)
		REFERENCES DEPARTMENT (
			DEPARTMENT_NO
		);

ALTER TABLE EMP
	ADD
		CONSTRAINT FK_POSITION_TO_EMP
		FOREIGN KEY (
			POSITION_NO
		)
		REFERENCES POSITION (
			POSITION_NO
		);

ALTER TABLE ELIMP
	ADD
		CONSTRAINT FK_EMP_TO_ELIMP
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE ELIMP
	ADD
		CONSTRAINT FK_DOCSTY_TO_ELIMP
		FOREIGN KEY (
			STYLE_NO
		)
		REFERENCES DOCSTY (
			STYLE_NO
		);

ALTER TABLE ATTEND
	ADD
		CONSTRAINT FK_EMP_TO_ATTEND
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE OFBOARD
	ADD
		CONSTRAINT FK_EMP_TO_OFBOARD
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE OFBOARD
	ADD
		CONSTRAINT FK_OFBOARDFOL_TO_OFBOARD
		FOREIGN KEY (
			BOARD_FOLDER_NO
		)
		REFERENCES OFBOARDFOL (
			BOARD_FOLDER_NO
		)
		ON DELETE CASCADE;

ALTER TABLE BOOKING
	ADD
		CONSTRAINT FK_EMP_TO_BOOKING
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE BOOKING
	ADD
		CONSTRAINT FK_BOTARGET_TO_BOOKING
		FOREIGN KEY (
			BOOKING_TARGET_NO
		)
		REFERENCES BOTARGET (
			BOOKING_TARGET_NO
		);

ALTER TABLE APPLINE
	ADD
		CONSTRAINT FK_EMP_TO_APPLINE
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE APPLINE
	ADD
		CONSTRAINT FK_ELIMP_TO_APPLINE
		FOREIGN KEY (
			ELECTRONIC_NO
		)
		REFERENCES ELIMP (
			ELECTRONIC_NO
		);

ALTER TABLE ELFILE
	ADD
		CONSTRAINT FK_ELIMP_TO_ELFILE
		FOREIGN KEY (
			ELECTRONIC_NO
		)
		REFERENCES ELIMP (
			ELECTRONIC_NO
		);


ALTER TABLE DOCSTY
	ADD
		CONSTRAINT FK_DOCFOL_TO_DOCSTY
		FOREIGN KEY (
			FOLDER_NO
		)
		REFERENCES DOCFOL (
			FOLDER_NO
		);

ALTER TABLE APPSTAMP
	ADD
		CONSTRAINT FK_EMP_TO_APPSTAMP
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE MAILFILE
	ADD
		CONSTRAINT FK_MAIL_TO_MAILFILE
		FOREIGN KEY (
			MAIL_NO
		)
		REFERENCES MAIL (
			MAIL_NO
		);

ALTER TABLE ATTENDDAY
	ADD
		CONSTRAINT FK_EMP_TO_ATTENDDAY
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE OFBOARDFILE
	ADD
		CONSTRAINT FK_OFBOARD_TO_OFBOARDFILE
		FOREIGN KEY (
			BOARD_NO
		)
		REFERENCES OFBOARD (
			BOARD_NO
		)
		ON DELETE CASCADE;

ALTER TABLE OFBOARDCOM
	ADD
		CONSTRAINT FK_OFBOARD_TO_OFBOARDCOM
		FOREIGN KEY (
			BOARD_NO
		)
		REFERENCES OFBOARD (
			BOARD_NO
		)
		ON DELETE CASCADE;

ALTER TABLE OFBOARDLIKE
	ADD
		CONSTRAINT FK_OFBOARD_TO_OFBOARDLIKE
		FOREIGN KEY (
			BOARD_NO
		)
		REFERENCES OFBOARD (
			BOARD_NO
		)
		ON DELETE CASCADE;

ALTER TABLE OFBOARDLIKE
	ADD
		CONSTRAINT FK_EMP_TO_OFBOARDLIKE
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE ADDBOOK
	ADD
		CONSTRAINT FK_EMP_TO_ADDBOOK
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);
        
ALTER TABLE ADDBOOK
	ADD
		CONSTRAINT FK_ADDFOL_TO_ADDBOOK
		FOREIGN KEY (
			ADDRESS_FOLDER_NO
		)
		REFERENCES ADDFOL (
			ADDRESS_FOLDER_NO
		)
        ON DELETE CASCADE;
        
ALTER TABLE CALENDAR
	ADD
		CONSTRAINT FK_EMP_TO_CALENDAR
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE CALENDAR
	ADD
		CONSTRAINT FK_SCTHEME_TO_CALENDAR
		FOREIGN KEY (
			SCHEDULE_THEME_NO
		)
		REFERENCES SCTHEME (
			SCHEDULE_THEME_NO
		);

ALTER TABLE ADDFOL
	ADD
		CONSTRAINT FK_EMP_TO_ADDFOL
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE SCFOLDER
	ADD
		CONSTRAINT FK_EMP_TO_SCFOLDER
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE BOTARGET
	ADD
		CONSTRAINT FK_BOFOL_TO_BOTARGET
		FOREIGN KEY (
			BOOKING_FOLDER_NO
		)
		REFERENCES BOFOL (
			BOOKING_FOLDER_NO
		);

ALTER TABLE RELINE
	ADD
		CONSTRAINT FK_ELIMP_TO_RELINE
		FOREIGN KEY (
			ELECTRONIC_NO
		)
		REFERENCES ELIMP (
			ELECTRONIC_NO
		);

ALTER TABLE RELINE
	ADD
		CONSTRAINT FK_EMP_TO_RELINE
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE BREAKDAY
	ADD
		CONSTRAINT FK_EMP_TO_BREAKDAY
		FOREIGN KEY (
			EMP_NO
		)
		REFERENCES EMP (
			EMP_NO
		);

ALTER TABLE BREAKDAY
	ADD
		CONSTRAINT FK_BREAKTHEME_TO_BREAKDAY
		FOREIGN KEY (
			BREAKTHEME_NO
		)
		REFERENCES BREAKTHEME (
			BREAKTHEME_NO
		);





------------------------- view ---------------------------------

--유저 번호로 도장 찾기
create or replace view selectstamp AS 
select a.*, b.position_name
from 
(
select a.emp_Name, a.position_no , b.* 
from emp a join appstamp b
on a.emp_No = b.emp_no
) a join
position b
on a.position_no = b.position_no;


create or replace view apEleList AS
select a.*, b.APPROVAL_LINE_COMPLETE_FLAG, b.emp_No as emp_No_ap from 
elimp a join appline b 
on a.electronic_no = b.electronic_no;

create or replace view reEleList AS
select a.*, b.RECEIVE_LINE_FLAG, b.emp_No as emp_No_re from 
elimp a join reline b 
on a.electronic_no = b.electronic_no;

select * from apEleList;

create or replace view mailView
as
select m.* , e.emp_name
from mail m join emp e
on m.mail_empno = e.emp_no;

------------------------- view ----------------------------------
create or replace view empView
as
select e.*,d.department_name, p.position_name
from emp e left join department d
on e.department_no=d.department_no
left join position p
on e.position_no = p.position_no;

--------------------------view----------------------------------
create or replace view breakDayView
as
select e.*,d.BREAKTHEME_NAME , p.EMP_NAME, (e.BREAKDAY_END -e.BREAKDAY_START)+1 as breakday_use 
from BREAKDAY  e left join BREAKTHEME  d
on e.BREAKTHEME_NO =d.BREAKTHEME_NO 
left join emp p
on e.EMP_NO  = p.EMP_NO;

select * from breakDayView;

-------------------------------------------------------------------------------------------


select * from emp;
----직급
insert into POSITION values(1, '사장');
insert into POSITION values(2, '부장');
insert into POSITION values(3, '과장');
insert into POSITION values(4, '대리');
insert into POSITION values(5, '주임');
insert into POSITION values(6, '사원');
--
---- 부서
insert into DEPARTMENT values(1,'전략기획팀');
insert into DEPARTMENT values(2,'영업팀');
insert into DEPARTMENT values(3,'마케팅팀');
insert into DEPARTMENT values(4,'개발팀');
insert into DEPARTMENT values(5,'인사팀');
insert into DEPARTMENT values(6,'총무회계팀');

--EMP
insert into EMP values(EMP_SEQ.nextval, '사장님', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', null, null);
insert into EMP values(EMP_SEQ.nextval, '관명', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 1, 2);
insert into EMP values(EMP_SEQ.nextval, '혁', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 1, 3);
insert into EMP values(EMP_SEQ.nextval, '준경', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 1, 4);
insert into EMP values(EMP_SEQ.nextval, '기성', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 2, 2);
insert into EMP values(EMP_SEQ.nextval, '아람', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 2, 3);
insert into EMP values(EMP_SEQ.nextval, '재민', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 2, 4);
insert into EMP values(EMP_SEQ.nextval, '영림', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 3, 2);
insert into EMP values(EMP_SEQ.nextval, '수정', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 3, 3);
insert into EMP values(EMP_SEQ.nextval, '예린', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 3, 4);
insert into EMP values(EMP_SEQ.nextval, '기쁨', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 4, 2);
insert into EMP values(EMP_SEQ.nextval, '소연', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 4, 3);
insert into EMP values(EMP_SEQ.nextval, '호윤', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 4, 4);
insert into EMP values(EMP_SEQ.nextval, '영원', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 5, 2);
insert into EMP values(EMP_SEQ.nextval, '우진', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 5, 3);
insert into EMP values(EMP_SEQ.nextval, '가윤', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 5, 4);
insert into EMP values(EMP_SEQ.nextval, '유림', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 6, 2);
insert into EMP values(EMP_SEQ.nextval, '민지', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 6, 3);
insert into EMP values(EMP_SEQ.nextval, '준휘', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 6, 4);

insert into EMP values(EMP_SEQ.nextval, '민기', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 6, 4);
insert into EMP values(EMP_SEQ.nextval, '지예', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 6, 4);
insert into EMP values(EMP_SEQ.nextval, '수진', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 6, 4);
insert into EMP values(EMP_SEQ.nextval, '지은', '$2a$10$50mL18dBG6mblQkrPe34h.KGev0eKnDDbVwX5HXE59RLNEovaBHeu', '010-3225-4091', 'admin@gmail.com', '12345', '서울특별시 강남구 역삼동', '111-123', '2020-01-01', null, null, 3000, '1234-1234-1234', 1, '1993-06-14', 6, 4);

select * from emp;

--달력테마
insert into sctheme values(1, '일정');
insert into sctheme values(2, '예약');

--일정폴더
insert into scfolder values(scfolder_seq.nextval, '(기본)일정', '#4ea0ec', 119);

--일정정보
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',1,1,119,null,'asd');
select * from calendar where SCHEDULE_THEME_NO=2;

select * from calendar
		where EMP_NO=119 and SCHEDULE_THEME_NO=2;
--예약폴더
insert into BOFOL  values(bofol_seq.nextval, '본사1층회의실');
insert into BOFOL  values(bofol_seq.nextval, '본사5층회의실');
insert into BOFOL  values(bofol_seq.nextval, '차량');
insert into BOFOL  values(bofol_seq.nextval, '빔프로젝터');

--예약대상
insert into BOTARGET  values(botarget_seq.nextval, '대회의실',1);
insert into BOTARGET  values(botarget_seq.nextval, '소회의실',1);
insert into BOTARGET  values(botarget_seq.nextval, '대회의실',2);
insert into BOTARGET  values(botarget_seq.nextval, '소회의실',2);
insert into BOTARGET  values(botarget_seq.nextval, '7498아반떼',3);
insert into BOTARGET  values(botarget_seq.nextval, '3929아반떼',3);
insert into BOTARGET  values(botarget_seq.nextval, '빔프로젝터1',4);
insert into BOTARGET  values(botarget_seq.nextval, '빔프로텍터2',4);

--예약정보
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',1,2,119,1,'asd');
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',1,2,119,2,'asd');
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',2,2,119,3,'asd');
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',2,2,119,4,'asd');
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',3,2,119,5,'asd');
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',3,2,119,6,'asd');
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',4,2,119,7,'asd');
insert into calendar values(schedule_seq.nextval, 'test', '2021-07-17', '2021-07-20', 'true','#183754',4,2,119,8,'asd');

--예약정보
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,1,'asd', 2);
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,2,'asd', 3);
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,3,'asd', 4);
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,4,'asd', 5);
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,5,'asd', 6);
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,6,'asd', 7);
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,7,'asd', 8);
insert into BOOKING values(booking_seq.nextval,119, sysdate ,'2021-07-17', '2021-07-20',0,0,8,'asd', 9);

--전자 결재 문서 폴더 
select * from docfol;
insert into DOCFOL
values(DOCFOL_SEQ.nextval, '문서폴더1');
insert into DOCFOL
values(DOCFOL_SEQ.nextval, '문서폴더2');
insert into DOCFOL
values(DOCFOL_SEQ.nextval, '문서폴더3');
insert into DOCFOL
values(DOCFOL_SEQ.nextval, '문서폴더4');
insert into DOCFOL
values(DOCFOL_SEQ.nextval, '문서폴더5');
insert into DOCFOL
values(DOCFOL_SEQ.nextval, '문서폴더6');

--전자 결재 문서 양식 (no, 이름 내용 폴더번호)
--SEQ strat 100
select * from docsty;
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호100', '	
				<br>
				<h2>휴가신청서</h2>

				<table class="doc-table">
					<tr>
						<td class="doc-td" colspan="3">문서번호</td>
						<td class="doc-td2"><input type="text"></td>
						<td class="doc-td">작성일자</td>
						<td class="doc-td2"><input type="text"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">이 름</td>
						<td class="doc-td2"><input type="text"></td>
						<td class="doc-td">직 책</td>
						<td class="doc-td2"><input type="text"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">소속</td>
						<td class="doc-td2"><input type="text"></td>
						<td class="doc-td">부서</td>
						<td class="doc-td2"><input type="text"></td>
					</tr>
					<tr>
						<td class="doc-td" rowspan="6">신청 내용</td>
						<td class="doc-td" rowspan="4">휴가신청서</td>
						<td class="doc-td">종류</td>
						<td class="doc-td2" colspan="3"><input type="text"
							class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td">일정</td>
						<td class="doc-td2" colspan="3"><input type="text"
							class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td">주요행선지</td>
						<td class="doc-td2" colspan="3"><input type="text"
							class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td">대체근무자</td>
						<td class="doc-td2" colspan="3"><input type="text"
							class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="2">신청사유<br> (자세히)
						</td>
						<td class="doc-td2" colspan="3"><input type="text"
							class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="2">긴급연락처</td>
						<td class="doc-td2" colspan="3"><input type="text"
							class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">참고사항</td>
						<td class="doc-td2" colspan="3"><input type="text"
							class="doc-input2"></td>
					</tr>

				</table>
				<br>', 1);
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호100', '', 1);
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호101', '', 2);
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호102', '', 2);
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호103', '', 3);
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호104', '', 3);
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호105', '', 4);
insert into DOCSTY
values(DOCSTY_SEQ.nextval, '양식번호106', '', 4);

-- 결재 도장 등록
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 101, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 102, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 103, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 104, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 105, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 106, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 107, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 108, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 119, '아이유1.jpg');
insert into APPSTAMP
values (APPSTAMP_SEQ.nextval, 120, '아이유1.jpg');

--전자 결재 정보 

insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트1', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트2', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트3', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트4', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트5', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트6', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트7', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트8', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트9', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트10', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트12', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트13', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트14', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트15', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트16', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, default);



insert into APPLINE
values (APPLINE_SEQ.nextval, 1, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 2, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 3, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 4, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 5, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 6, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 7, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 8, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 9, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 10, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 11, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 12, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 13, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 14, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 15, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 16, 101, '0', 0);
insert into APPLINE
values (APPLINE_SEQ.nextval, 17, 101, '0', 0);


insert into RELINE
values (RELINE_SEQ.nextval, 1, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 2, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 3, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 4, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 5, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 6, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 7, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 8, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 9, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 10, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 11, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 12, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 13, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 14, 101, '0');
insert into RELINE
values (RELINE_SEQ.nextval, 15, 101, '0');

insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트18', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트19', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트20', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트21', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트22', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트23', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트24', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트25', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트26', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트27', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트28', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트29', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트30', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트31', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '1', '0', 120, 100, default);

insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트32', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트33', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트34', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트35', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트36', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트37', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트38', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트39', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트40', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트41', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트42', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트43', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트44', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트45', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '2', '0', 120, 100, default);


insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트1', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트2', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트3', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트4', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트5', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트6', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트7', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트8', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트9', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트10', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트12', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트13', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트14', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트15', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트16', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');
insert into ELIMP
values (ELIMP_SEQ.nextval, sysdate, '기안서테스트17', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');

insert into ELIMP
values (ELIMP_SEQ.nextval, to_date('2021-07-24 09:12:12', 'yyyy-mm-dd hh24:mi:ss'), '날짜 테스트', '["양식1에대한 내용입니다","","","","","","","","","","123","","내용입니다 끝"]', 'N', '0', '0', 120, 100, '1');

select * from elimp
order by ELECTRONIC_DATE DESC, ELECTRONIC_NO DESC;

-- 결재 라인 

select * from appline;

-- 수신 라인

select * from reline;

--전자 결재 파일 
 
select * from ELFILE;



-- 게시판 폴더
INSERT INTO OFBOARDFOL VALUES(1, '공지사항');
INSERT INTO OFBOARDFOL VALUES(2, '자료실');
INSERT INTO OFBOARDFOL VALUES(3, '커뮤니티');
INSERT INTO OFBOARDFOL VALUES(OFBOARDFOL_SEQ.nextval, '영업 본부');


--날짜별 근태 정보

insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-20 09:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-20 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-20 06:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-20');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-19 09:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-19 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-19 06:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-19');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-16 09:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-16 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-16 06:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-16');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-15 09:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-15 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-15 06:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-15');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-14 09:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-14 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-14 06:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-14');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-13 10:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-13 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-13 05:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-13');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-12 08:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-12 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-12 07:00:00', 'yyyy-mm-dd hh24:mi:ss'),2,'2021-07-12');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-09 09:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-09 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-09');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-08 11:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-08 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-08 04:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-08');
insert into attendday values(attendday_seq.nextval,122, to_date('2021-07-07 09:12:12', 'yyyy-mm-dd hh24:mi:ss') ,
to_date('2021-07-07 15:12:12', 'yyyy-mm-dd hh24:mi:ss'),to_date('2021-07-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'),0,'2021-07-07');




--휴가 종류
insert into BREAKTHEME values(BREAKTHEME_seq.nextval,'연차');
insert into BREAKTHEME values(BREAKTHEME_seq.nextval,'보상휴가');

--휴가 정보
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-01', '2021-06-02','122','2');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-05', '2021-06-06','122','2');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-08', '2021-06-09','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-11', '2021-06-12','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-13', '2021-06-13','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-15', '2021-06-16','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-18', '2021-06-19','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-21', '2021-06-22','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-23', '2021-06-24','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-06-27', '2021-06-29','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-07-01', '2021-07-03','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-07-05', '2021-07-06','122','1');
insert into BREAKDAY values(BREAKDAY_seq.nextval, '2021-07-10', '2021-07-12','122','1');
--근태 정보
insert into ATTEND values(ATTEND_seq.nextval, 122,default,12,2,30,7);
insert into ATTEND values(ATTEND_seq.nextval, 101,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 102,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 103,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 104,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 105,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 106,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 107,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 108,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 109,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 110,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 111,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 112,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 113,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 114,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 115,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 116,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 117,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 118,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 119,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 120,default,default,default,default,default);
insert into ATTEND values(ATTEND_seq.nextval, 121,default,default,default,default,default);












commit;


drop procedure updateAttendDay;


create or replace procedure updateAttendDay 
(

	p_EMP_NO NUMBER, /* 사원 번호 */
	p_ATTENDANCE_DAY_ON_HOUR DATE, /* 출근 시간 */
	p_ATTENDANCE_DAY_OFF_HOUR DATE, /* 퇴근 시간 */
	p_ATTENDANCE_DAY_WORK_HOUR DATE, /* 근무 시간 */
	p_ATTENDANCE_DAY_REGDATE DATE
)
is

    cnt number;
begin
    
    IF p_ATTENDANCE_DAY_ON_HOUR < TO_DATE(TO_CHAR(p_ATTENDANCE_DAY_OFF_HOUR,'yyyy-mm-dd')||' 9:00:00','yyyy-mm-dd hh24:mi:ss') 
        or p_ATTENDANCE_DAY_OFF_HOUR > TO_DATE(TO_CHAR(p_ATTENDANCE_DAY_OFF_HOUR,'yyyy-mm-dd')||' 18:00:00','yyyy-mm-dd hh24:mi:ss') 
    THEN
        update ATTENDDAY set ATTENDANCE_DAY_OFF_HOUR=p_ATTENDANCE_DAY_OFF_HOUR,
		ATTENDANCE_DAY_WORK_HOUR=p_ATTENDANCE_DAY_WORK_HOUR, ATTENDANCE_DAY_HOLIDAY_FLAG = 1
		where EMP_NO=p_EMP_NO and ATTENDANCE_DAY_REGDATE =p_ATTENDANCE_DAY_REGDATE;
    
    ELSE
        update ATTENDDAY set ATTENDANCE_DAY_OFF_HOUR=p_ATTENDANCE_DAY_OFF_HOUR,
		ATTENDANCE_DAY_WORK_HOUR=p_ATTENDANCE_DAY_WORK_HOUR, ATTENDANCE_DAY_HOLIDAY_FLAG = 0
		where EMP_NO=p_EMP_NO and ATTENDANCE_DAY_REGDATE =p_ATTENDANCE_DAY_REGDATE;
    END IF;
    

    commit;

EXCEPTION
    WHEN OTHERS THEN
    raise_application_error(-20001, '근태 날짜 정보 업데이트 실패!');
        ROLLBACK;
end;
















