/*회원 테이블 */
CREATE TABLE MEMBERBOARD(
  MB_NO NUMBER PRIMARY KEY,
  MB_ID VARCHAR2(20) NOT NULL,
  MB_PW VARCHAR2(20) NOT NULL,
  MB_NAME VARCHAR2(20) NOT NULL,
  MB_EMAIL VARCHAR2(100),
  MB_PHONE VARCHAR2(20),
  MB_ADDR VARCHAR2(500),
  MB_ADDR_LATITUDE VARCHAR2(1000),
  MB_ADDR_LONGITUDE VARCHAR2(1000),
  MB_ABLE VARCHAR2(4) DEFAULT 'Y' CHECK(MB_ABLE IN ('Y','N')),
  MB_ROLE VARCHAR2(10) DEFAULT 'USER' CHECK(MB_ROLE IN ('ADMIN','USER')),
  MB_SCORE NUMBER
);

/*등급 테이블*/
CREATE TABLE GRADE(
	GRADE_NO NUMBER PRIMARY KEY,
	GRADE_NAME VARCHAR2(100) NOT NULL,
	GRADE_MIN NUMBER NOT NULL,
	GRADE_MAX NUMBER NOT NULL
);

/*등급 테이블 값 추가*/
INSERT INTO GRADE VALUES(0, '등급 없음', 0, 1);
INSERT INTO GRADE VALUES(1, '브론즈', 2, 4);
INSERT INTO GRADE VALUES(2, '실버', 5, 8);
INSERT INTO GRADE VALUES(3, '골드', 9, 100);

SELECT * FROM GRADE;

/* 계좌번호 테이블 */
CREATE TABLE BANKBOARD(
  BANK_NO NUMBER PRIMARY KEY,
  BANK_ID NUMBER NOT NULL,
  BANK_NAME VARCHAR2(100) NOT NULL,
  BANK_ACCOUNT VARCHAR2(20) NOT NULL,
  BANK_MEMNAME VARCHAR(100) NOT NULL,
  CONSTRAINT member_account FOREIGN KEY (BANK_ID) REFERENCES MEMBERBOARD(MB_NO) ON DELETE CASCADE
);

CREATE SEQUENCE BANKSQ;


/*공지사항 테이블 */
CREATE TABLE NOTICEBOARD(
  NOTICE_NO NUMBER PRIMARY KEY,
  NOTICE_TITLE VARCHAR2(1000) NOT NULL,
  NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
  NOTICE_ID VARCHAR2(20) NOT NULL,
  NOTICE_DATE DATE DEFAULT SYSDATE,
  NOTICE_CNT NUMBER DEFAULT 0
);

/*신고테이블 */
CREATE TABLE REPORTBOARD(
  REPORT_NO NUMBER PRIMARY KEY,
  REPORT_TID VARCHAR2(20) NOT NULL,
  REPORT_ID VARCHAR2(20) NOT NULL,
  REPORT_TITLE VARCHAR2(200) NOT NULL,
  REPORT_CONTENT VARCHAR2(1000),
  REPORT_SDATE DATE DEFAULT SYSDATE,
  REPORT_EDATE DATE
);


/* 채팅테이블*/
CREATE TABLE CHATBOARD(
  CHAT_NO NUMBER PRIMARY KEY,
  CHAT_USER1 VARCHAR2(20) NOT NULL,
  CHAT_USER2 VARCHAR2(20) NOT NULL,
  CHAT_SDATE DATE DEFAULT SYSDATE,
  CHAT_EDATE DATE
);


/* 채팅내용 테이블 */
CREATE TABLE CHATCONTENTBOARD(
  CCB_NO NUMBER PRIMARY KEY,
  CCB_CHATNO NUMBER NOT NULL,
  CCB_ID VARCHAR2(20) NOT NULL,
  CCB_CONTENT VARCHAR2(1000) NOT NULL,
  CCB_DATE DATE DEFAULT SYSDATE,
  CONSTRAINT fk_ccb_no FOREIGN KEY (CCB_CHATNO) REFERENCES CHATBOARD(CHAT_NO) ON DELETE CASCADE
);


/*커뮤니티 테이블 */
CREATE TABLE COMMUBOARD(
  CMB_NO NUMBER PRIMARY KEY,
  CMB_CONTENT VARCHAR(4000) NOT NULL,
  CMB_ID VARCHAR2(20) NOT NULL,
  CMB_DATE DATE DEFAULT SYSDATE,
  CMB_LIKE NUMBER DEFAULT 0,
  CMB_CNT NUMBER DEFAULT 0
);

/*커뮤니티 이미지 테이블 */
CREATE TABLE CMBIMGBOARD(
  CIMG_NO NUMBER PRIMARY KEY,
  CIMG_CMBNO NUMBER NOT NULL,
  CIMG_SRC VARCHAR2(500) NOT NULL,
  CIMG_NAME VARCHAR2(100) NOT NULL,
  CIMG_TYPE VARCHAR2(10),
  CIMG_SIZE NUMBER,
  CONSTRAINT fk_cmbimg_cmbno FOREIGN KEY (CIMG_CMBNO) REFERENCES COMMUBOARD(CMB_NO) ON DELETE CASCADE
);

/*커뮤니티 댓글 테이블 */
CREATE TABLE CMBCOMMENTBOARD(
  CCOM_NO NUMBER PRIMARY KEY,
  CCOM_CMBNO NUMBER NOT NULL,
  CCOM_ID VARCHAR2(20) NOT NULL,
  CCOM_CONTENT VARCHAR2(500) NOT NULL,
  CCOM_DATE DATE,
  CONSTRAINT fk_ccom_cmbno FOREIGN KEY (CCOM_CMBNO) REFERENCES COMMUBOARD(CMB_NO) ON DELETE CASCADE
);

/*상품 테이블 */
CREATE TABLE PRODUCTBOARD(
  PRODUCT_NO NUMBER PRIMARY KEY,
  PRODUCT_TITLE VARCHAR2(1000) NOT NULL,
  PRODUCT_CATEGORY VARCHAR2(100) NOT NULL,
  PRODUCT_PRICE NUMBER,
  PRODUCT_BRAND VARCHAR2(100) NOT NULL,
  PRODUCT_ADDR VARCHAR2(500) NOT NULL,
  PRODUCT_ADDR_LATITUDE VARCHAR2(1000) NOT NULL,
  PRODUCT_ADDR_LONGITUDE VARCHAR2(1000) NOT NULL,
  PRODUCT_NEW VARCHAR2(4) CHECK(PRODUCT_NEW IN ('Y','N')),
  PRODUCT_CONTENT VARCHAR2(4000) NOT NULL,
  PRODUCT_ID VARCHAR2(20) NOT NULL,
  PRODUCT_DATE DATE DEFAULT SYSDATE,
  PRODUCT_STATUS VARCHAR2(100)  
);

/*상품 이미지 테이블*/
CREATE TABLE PTIMGBOARD(
  PTIMG_NO NUMBER PRIMARY KEY,
  PTIMG_PRODUCTNO NUMBER NOT NULL,
  PTIMG_SRC VARCHAR2(500) NOT NULL,
  PTIMG_NAME VARCHAR2(100) NOT NULL,
  PTIMG_TYPE VARCHAR2(10),
  PTIMG_SIZE NUMBER,
  CONSTRAINT fk_ptimg_productno FOREIGN KEY (PTIMG_PRODUCTNO) REFERENCES PRODUCTBOARD(PRODUCT_NO) ON DELETE CASCADE
);

/*거래 테이블*/
CREATE TABLE DEALBOARD(
  DEAL_NO NUMBER PRIMARY KEY,
  DEAL_PRODUCTNO NUMBER NOT NULL,
  DEAL_SID VARCHAR2(20) NOT NULL,
  DEAL_BID VARCHAR2(20) NOT NULL,
  DEAL_PRICE NUMBER,
  CONSTRAINT fk_deal_productno FOREIGN KEY (DEAL_PRODUCTNO) REFERENCES PRODUCTBOARD(PRODUCT_NO) ON DELETE CASCADE
);

/*거래 일정 테이블*/
CREATE TABLE DEALSCHEDULEBOARD(
  SCHEDULE_NO NUMBER PRIMARY KEY,
  SCHEDULE_DEALNO NUMBER NOT NULL,
  SCHEDULE_STATUS VARCHAR2(100),
  SCHEDULE_SDATE DATE DEFAULT SYSDATE,
  SCHEDULE_EDATE DATE,
  CONSTRAINT fk_schedule_dealno FOREIGN KEY (SCHEDULE_DEALNO) REFERENCES DEALBOARD(DEAL_NO) ON DELETE CASCADE
);

/*검수 내역 테이블 */
CREATE TABLE CHECKBOARD(
  CHECK_NO NUMBER PRIMARY KEY,
  CHECK_DEALNO NUMBER NOT NULL,
  CHECK_ID VARCHAR2(20) NOT NULL,
  CHECK_CONTENT VARCHAR2(4000),
  CONSTRAINT fk_check_dealno FOREIGN KEY (CHECK_DEALNO) REFERENCES DEALBOARD(DEAL_NO) ON DELETE CASCADE
);

/*검수 이미지 테이블 */
CREATE TABLE CHKIMGBOARD(
  CHKIMG_NO NUMBER PRIMARY KEY,
  CHKIMG_CHECKNO NUMBER NOT NULL,
  CHKIMG_SRC VARCHAR2(500) NOT NULL,
  CHKIMG_NAME VARCHAR2(100) NOT NULL,
  CHKIMG_TYPE VARCHAR2(10),
  CHKIMG_SIZE NUMBER,
  CONSTRAINT fk_chkimg_chkckno FOREIGN KEY (CHKIMG_CHECKNO) REFERENCES CHECKBOARD(CHECK_NO) ON DELETE CASCADE
);

/*관심상품 테이블*/
CREATE TABLE LIKEPRODUCTBOARD(
  LIKEPT_MEMBERNO NUMBER,
  LIKEPT_PRODUCTNO NUMBER,
  PRIMARY KEY(LIKEPT_MEMBERNO,LIKEPT_PRODUCTNO),
  CONSTRAINT fk_likept_memberno FOREIGN KEY(LIKEPT_MEMBERNO) REFERENCES MEMBERBOARD(MB_NO) ON DELETE CASCADE,
  CONSTRAINT fk_likept_productno FOREIGN KEY(LIKEPT_PRODUCTNO) REFERENCES PRODUCTBOARD(PRODUCT_NO) ON DELETE CASCADE
);


/*시퀸스 추가 */
CREATE SEQUENCE COMMENTSQ NOCACHE;
CREATE SEQUENCE COMMUIMGSQ NOCACHE;
CREATE SEQUENCE PTIMGSQ NOCACHE;
CREATE SEQUENCE REPORTSQ NOCACHE;
CREATE SEQUENCE MEMBERSQ NOCACHE;
CREATE SEQUENCE DEALSCHEDULESQ NOCACHE;
CREATE SEQUENCE CHECKBOARDSQ NOCACHE;

DROP SEQUENCE COMMENTSQ;
DROP SEQUENCE COMMUIMGSQ;
DROP SEQUENCE PTIMGSQ;
DROP SEQUENCE REPORTSQ;
DROP SEQUENCE MEMBERSQ;
DROP SEQUENCE DEALSCHEDULESQ;
DROP SEQUENCE CHECKBOARDSQ;

INSERT INTO noticeboard
VALUES(1,'TEST','TEST중입니다','ADMIN1',SYSDATE,0);

INSERT INTO reportboard
VALUES(1,'USER1','ADMIN1','사기','사기꾼',SYSDATE,NULL);

INSERT INTO chatboard
VALUES(1,'USER1','ADMIN',SYSDATE,NULL);

INSERT INTO chatcontentboard
VALUES(2,1,'USER2','HELLO2',SYSDATE);

/*관리자로 변경*/
UPDATE MEMBERBOARD SET MB_ROLE='ADMIN' WHERE MB_ID='admin';


/*검색*/
SELECT * FROM MEMBERBOARD;
SELECT * FROM BANKBOARD;
SELECT * FROM NOTICEBOARD;
SELECT * FROM REPORTBOARD;
SELECT * FROM CHATBOARD;
SELECT * FROM CHATCONTENTBOARD;
SELECT * FROM COMMUBOARD;
SELECT * FROM CMBIMGBOARD;
SELECT * FROM CMBCOMMENTBOARD;
SELECT * FROM PRODUCTBOARD;
SELECT * FROM PTIMGBOARD;
SELECT * FROM DEALBOARD;
SELECT * FROM DEALSCHEDULEBOARD;
SELECT * FROM CHECKBOARD;
SELECT * FROM CHKIMGBOARD;
SELECT * FROM LIKEPRODUCTBOARD;
SELECT * FROM USER_TABLES;				/*접속한 계정의 테이블 전체 조회*/



/* 행 삭제*/
DELETE FROM MEMBERBOARD WHERE mb_no = 1;
DELETE FROM BANKBOARD WHERE bank_no =1;
DELETE FROM NOTICEBOARD WHERE notice_no=2;
DELETE FROM REPORTBOARD WHERE report_no =1;
DELETE FROM CHATBOARD WHERE chat_no =1;
DELETE FROM CHATCONTENTBOARD WHERE ccb_no =1;
DELETE FROM COMMUBOARD WHERE cmb_no = 1;
DELETE FROM CMBIMGBOARD WHERE cimg_no =1;
DELETE FROM CMBCOMMENTBOARD WHERE ccom_no = 1;
DELETE FROM PRODUCTBOARD WHERE product_no = 1;
DELETE FROM PTIMGBOARD WHERE ptimg_no = 1;
DELETE FROM DEALBOARD WHERE deal_no = 1;
DELETE FROM DEALSCHEDULEBOARD WHERE schedule_no =1;
DELETE FROM CHECKBOARD WHERE check_no = 1;
DELETE FROM CHKIMGBOARD WHERE chkimg_no = 1;
DELETE FROM LIKEPRODUCTBOARD WHERE likept_memberno = 1;

/*테이블 삭제*/
DROP TABLE BANKBOARD;
DROP TABLE NOTICEBOARD;
DROP TABLE REPORTBOARD;
DROP TABLE CHATBOARD;
DROP TABLE PRODUCTBOARD;
DROP TABLE CHATCONTENTBOARD;
DROP TABLE MEMBERBOARD;
DROP TABLE CMBIMGBOARD;
DROP TABLE COMMUBOARD;
DROP TABLE CMBCOMMENTBOARD;
DROP TABLE PTIMGBOARD;
DROP TABLE DEALBOARD;
DROP TABLE DEALSCHEDULEBOARD;
DROP TABLE CHECKBOARD;
DROP TABLE CHKIMGBOARD;
DROP TABLE LIKEPRODUCTBOARD;

COMMIT;