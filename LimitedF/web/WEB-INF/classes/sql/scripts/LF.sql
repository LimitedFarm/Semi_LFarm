DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Admin CASCADE CONSTRAINTS;
DROP TABLE seller CASCADE CONSTRAINTS;
DROP TABLE PList CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE Notice CASCADE CONSTRAINTS;
DROP TABLE Answer CASCADE CONSTRAINTS;
DROP TABLE Question CASCADE CONSTRAINTS;
DROP TABLE CReportList CASCADE CONSTRAINTS;
DROP TABLE SReportList CASCADE CONSTRAINTS;
DROP TABLE dAddress CASCADE CONSTRAINTS;
DROP TABLE SList CASCADE CONSTRAINTS;
DROP TABLE Category CASCADE CONSTRAINTS;
DROP TABLE pAttachment CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;
DROP TABLE pInfo CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;

DROP SEQUENCE CID;
DROP SEQUENCE AID;
DROP SEQUENCE ANID;
DROP SEQUENCE QID;
DROP SEQUENCE NID;
DROP SEQUENCE FAQID;
DROP SEQUENCE SRID;
DROP SEQUENCE REID;
DROP SEQUENCE SALEID;
DROP SEQUENCE PID;
DROP SEQUENCE SID;
DROP SEQUENCE CATEID;
DROP SEQUENCE FID;
DROP SEQUENCE INFO;
DROP SEQUENCE CRID;
DROP SEQUENCE DAID;
DROP SEQUENCE PAYID;

CREATE SEQUENCE PAYID;
CREATE SEQUENCE CID;
CREATE SEQUENCE AID;
CREATE SEQUENCE ANID;
CREATE SEQUENCE QID;
CREATE SEQUENCE NID;
CREATE SEQUENCE FAQID;
CREATE SEQUENCE SRID;
CREATE SEQUENCE REID;
CREATE SEQUENCE SALEID;
CREATE SEQUENCE PID;
CREATE SEQUENCE SID;
CREATE SEQUENCE CATEID;
CREATE SEQUENCE FID;
CREATE SEQUENCE INFO;
CREATE SEQUENCE CRID;
CREATE SEQUENCE DAID;



CREATE TABLE FAQ (
	FAQId	NUMBER		NOT NULL,
	FAQTitle	NVARCHAR2(50)		NULL,
	FAQContent	NVARCHAR2(500)		NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	aId	NUMBER		NOT NULL
);

ALTER TABLE FAQ
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN FAQ.FAQId IS 'FAQ번호';

COMMENT ON COLUMN FAQ.FAQTitle IS 'FAQ 제목';

COMMENT ON COLUMN FAQ.FAQContent IS 'FAQ 내용';

COMMENT ON COLUMN FAQ.status IS 'FAQ 상태';

COMMENT ON COLUMN FAQ.aId IS '관리자번호';

CREATE TABLE Review (
	reId	NUMBER		NOT NULL,
	reContent	NVARCHAR2(500)		NOT NULL,
	grade	NUMBER	DEFAULT 5	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	sale_Id	NUMBER		NOT NULL,
	cId	NUMBER		NOT NULL,
	review_date	DATE	DEFAULT SYSDATE	NOT NULL
);

ALTER TABLE Review
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN Review.reId IS '리뷰 번호';

COMMENT ON COLUMN Review.reContent IS '리뷰내용';

COMMENT ON COLUMN Review.grade IS '상품 평점';

COMMENT ON COLUMN Review.status IS '리뷰 상태';

COMMENT ON COLUMN Review.sale_Id IS '판매 번호';

COMMENT ON COLUMN Review.cId IS '시퀀스를 통한 회원번호';

COMMENT ON COLUMN Review.review_date IS '리뷰 날짜';

CREATE TABLE seller (
	sId	NUMBER		NOT NULL,
	bStatus	CHAR(1) CHECK(bStatus in ('Y', 'N')),
	bName	NVARCHAR2(50)		NOT NULL,
	bNum	NVARCHAR2(20)		NOT NULL,
	cpNum	NVARCHAR2(20)		NOT NULL,
	acNum	NVARCHAR2(20)		NOT NULL,
	acName	NVARCHAR2(10)		NOT NULL,
	bankName	NVARCHAR2(30)		NOT NULL,
	cId	NUMBER		NOT NULL,
	fId	NUMBER		NOT NULL
);

ALTER TABLE seller
MODIFY bStatus DEFAULT 'N' NOT NULL;

COMMENT ON COLUMN seller.sId IS '판매자 회원번호';

COMMENT ON COLUMN seller.bStatus IS '물품판매 권한 승인여부';

COMMENT ON COLUMN seller.bName IS '사업자 이름';

COMMENT ON COLUMN seller.bNum IS '사업자 번호';

COMMENT ON COLUMN seller.cpNum IS '법인번호';

COMMENT ON COLUMN seller.acNum IS '계좌번호';

COMMENT ON COLUMN seller.acName IS '예금주';

COMMENT ON COLUMN seller.bankName IS '계좌 은행 이름';

COMMENT ON COLUMN seller.cId IS '시퀀스를 통한 회원번호';

COMMENT ON COLUMN seller.fId IS '파일 번호';

CREATE TABLE Notice (
	nId	NUMBER		NOT NULL,
	nTitle	NVARCHAR2(20)		NOT NULL,
	nContent	NVARCHAR2(500)		NOT NULL,
	nrgDate	DATE	DEFAULT SYSDATE	NOT NULL,
	nmodiDate	DATE	DEFAULT SYSDATE	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	aId	NUMBER		NOT NULL
);
ALTER TABLE Notice
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN Notice.nId IS '공지사항 인덱스번호';

COMMENT ON COLUMN Notice.nTitle IS '공지사항 제목';

COMMENT ON COLUMN Notice.nContent IS '공지사항 내용';

COMMENT ON COLUMN Notice.nrgDate IS '공지사항 작성일자';

COMMENT ON COLUMN Notice.nmodiDate IS '공지사항 수정일자';

COMMENT ON COLUMN Notice.status IS '공지사항 공개, 비공개 여부';

COMMENT ON COLUMN Notice.aId IS '관리자번호';

CREATE TABLE CReportList (
	crId	NUMBER		NOT NULL,
	cId	NUMBER		NOT NULL,
	noContent	NVARCHAR2(500)		NULL,
	report_date	DATE	DEFAULT SYSDATE	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	sale_Id	NUMBER		NOT NULL
);

ALTER TABLE CReportList
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN CReportList.crId IS '신고번호';

COMMENT ON COLUMN CReportList.cId IS '시퀀스를 통한 회원번호';

COMMENT ON COLUMN CReportList.noContent IS '신고내용';

COMMENT ON COLUMN CReportList.report_date IS '신고 접수 날짜';

COMMENT ON COLUMN CReportList.status IS '신고 내역 상태';

COMMENT ON COLUMN CReportList.sale_Id IS '판매 번호';

CREATE TABLE PList (
	pId	NUMBER		NOT NULL,
	sId	NUMBER		NOT NULL,
	pName	NVARCHAR2(20)		NULL,
	pPrice	NUMBER		NOT NULL,
	pCount	NUMBER		NOT NULL,
	pAddress	NVARCHAR2(50)		NOT NULL,
	pDay	DATE		NULL,
	pPreiode	DATE		NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	fId	NUMBER		NOT NULL,
	cateId	NUMBER		NOT NULL
);

ALTER TABLE PList
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN PList.pId IS '상품 번호';

COMMENT ON COLUMN PList.sId IS '판매자 회원번호';

COMMENT ON COLUMN PList.pName IS '상품명';

COMMENT ON COLUMN PList.pPrice IS '상품 가격';

COMMENT ON COLUMN PList.pCount IS '상품 재고량';

COMMENT ON COLUMN PList.pAddress IS '상품 원산지';

COMMENT ON COLUMN PList.pDay IS '상품 생산일자';

COMMENT ON COLUMN PList.pPreiode IS '상품 유통기한';

COMMENT ON COLUMN PList.status IS '상품 판매 유무';

COMMENT ON COLUMN PList.fId IS '파일 번호';

COMMENT ON COLUMN PList.cateId IS '카테고리 번호';

CREATE TABLE Answer (
	anId	NUMBER		NOT NULL,
	anContent	NVARCHAR2(500)		NULL,
	answer_date	DATE	DEFAULT SYSDATE	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	aId	NUMBER		NOT NULL,
	qId	NUMBER		NOT NULL,
	cId	NUMBER		NOT NULL
);

ALTER TABLE Answer
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN Answer.anId IS '답변번호';

COMMENT ON COLUMN Answer.anContent IS '답변내용';

COMMENT ON COLUMN Answer.answer_date IS '답변 날짜';

COMMENT ON COLUMN Answer.status IS '답변 상태';

COMMENT ON COLUMN Answer.aId IS '관리자번호';

COMMENT ON COLUMN Answer.qId IS '문의번호';

COMMENT ON COLUMN Answer.cId IS '시퀀스를 통한 회원번호';

CREATE TABLE SList (
	sale_Id	NUMBER		NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	sale_date	DATE	DEFAULT SYSDATE	NOT NULL,
	sCount	NUMBER		NOT NULL,
	pId	NUMBER		NOT NULL,
	sId	NUMBER		NOT NULL,
	cId	NUMBER		NOT NULL
);

ALTER TABLE SList
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN SList.sale_Id IS '판매 번호';

COMMENT ON COLUMN SList.status IS '판매 상태';

COMMENT ON COLUMN SList.sale_date IS '판매 날짜';

COMMENT ON COLUMN SList.sCount IS '판매 물품 수량';

COMMENT ON COLUMN SList.pId IS '상품 번호';

COMMENT ON COLUMN SList.sId IS '판매자 회원번호';

COMMENT ON COLUMN SList.cId IS '시퀀스를 통한 회원번호';

CREATE TABLE Customer (
	cId	NUMBER		NOT NULL,
	userId	NVARCHAR2(12)		NOT NULL,
	userPwd	NVARCHAR2(20)		NOT NULL,
	address	NVARCHAR2(50)		NOT NULL,
	phone	NVARCHAR2(11)		NOT NULL,
	email	NVARCHAR2(50)		NOT NULL,
	joinDate	DATE	DEFAULT SYSDATE	NOT NULL,
	modifyDate	DATE	DEFAULT SYSDATE	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N'))
);

ALTER TABLE Customer
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN Customer.cId IS '시퀀스를 통한 회원번호';

COMMENT ON COLUMN Customer.userId IS '회원아이디';

COMMENT ON COLUMN Customer.userPwd IS '회원비밀번호';

COMMENT ON COLUMN Customer.address IS '회원 주소';

COMMENT ON COLUMN Customer.phone IS '회원 전화번호';

COMMENT ON COLUMN Customer.email IS '회원 이메일';

COMMENT ON COLUMN Customer.joinDate IS '회원가입일자';

COMMENT ON COLUMN Customer.modifyDate IS '정보 수정일자';

COMMENT ON COLUMN Customer.status IS '회원 상태정보(탈퇴시 N)';

CREATE TABLE dAddress (
	daId	NUMBER		NOT NULL,
	cId	NUMBER		NOT NULL,
	daName	NVARCHAR2(50)		NOT NULL,
	daAddress	NVARCHAR2(50)		NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N'))
);

ALTER TABLE dAddress
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN dAddress.daId IS '배송지 번호';

COMMENT ON COLUMN dAddress.cId IS '시퀀스를 통한 회원번호';

COMMENT ON COLUMN dAddress.daName IS '배송지명';

COMMENT ON COLUMN dAddress.daAddress IS '배송지 주소';

COMMENT ON COLUMN dAddress.status IS '배송지 목록 상태';

CREATE TABLE Category (
	cateId	NUMBER		NOT NULL,
	category	NVARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN Category.cateId IS '카테고리 번호';

COMMENT ON COLUMN Category.category IS '카테고리 이름';

CREATE TABLE pAttachment (
	fId	NUMBER		NOT NULL,
	file_name	NVARCHAR2(20)		NOT NULL,
	change_name	NVARCHAR2(100)		NOT NULL,
	file_path	NVARCHAR2(100)		NOT NULL,
	upload_date	DATE	DEFAULT SYSDATE	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N'))
);

ALTER TABLE pAttachment
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN pAttachment.fId IS '파일 번호';

COMMENT ON COLUMN pAttachment.file_name IS '파일 이름';

COMMENT ON COLUMN pAttachment.change_name IS '수정된 파일 이름';

COMMENT ON COLUMN pAttachment.file_path IS '파일 경로';

COMMENT ON COLUMN pAttachment.upload_date IS '업로드 날짜';

COMMENT ON COLUMN pAttachment.status IS '파일 상태 여부';

CREATE TABLE Admin (
	aId	NUMBER		NOT NULL,
	admin_Level	NUMBER	DEFAULT 1	NOT NULL,
	cId	NUMBER		NOT NULL
);

COMMENT ON COLUMN Admin.aId IS '관리자번호';

COMMENT ON COLUMN Admin.admin_Level IS '관리자권한 0 또는 1';

COMMENT ON COLUMN Admin.cId IS '시퀀스를 통한 회원번호';

CREATE TABLE SReportList (
	srId	NUMBER		NOT NULL,
	reId	NUMBER		NOT NULL,
	noContent	NVARCHAR2(500)		NULL,
	report_date	DATE	DEFAULT SYSDATE	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N')),
	sale_Id	NUMBER		NOT NULL,
	sId	NUMBER		NOT NULL
);

ALTER TABLE SReportList
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN SReportList.srId IS '신고번호';

COMMENT ON COLUMN SReportList.reId IS '리뷰 번호';

COMMENT ON COLUMN SReportList.noContent IS '신고내용';

COMMENT ON COLUMN SReportList.report_date IS '신고 날짜';

COMMENT ON COLUMN SReportList.status IS '판매자 신고 상태';

COMMENT ON COLUMN SReportList.sale_Id IS '판매 번호';

COMMENT ON COLUMN SReportList.sId IS '판매자 회원번호';

CREATE TABLE Question (
	qId	NUMBER		NOT NULL,
	cId	NUMBER		NOT NULL,
	qTitle	NVARCHAR2(50)		NOT NULL,
	qContent	NVARCHAR2(500)		NULL,
	question_date	DATE	DEFAULT SYSDATE	NOT NULL,
	status	CHAR(1) CHECK(status in ('Y', 'N'))
);

ALTER TABLE Question
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN Question.qId IS '문의번호';

COMMENT ON COLUMN Question.cId IS '시퀀스를 통한 회원번호';

COMMENT ON COLUMN Question.qTitle IS '문의제목';

COMMENT ON COLUMN Question.qContent IS '문의내용';

COMMENT ON COLUMN Question.question_date IS '문의 날짜';

COMMENT ON COLUMN Question.status IS '문의 상태';

CREATE TABLE pInfo (
	infoNum	NUMBER		NOT NULL,
	pContent	NVARCHAR2(1500)		NULL,
	fId	NUMBER		NULL,
	pId	NUMBER		NOT NULL,
	sId	NUMBER		NOT NULL
);

COMMENT ON COLUMN pInfo.infoNum IS '저장된 정보의 순서';

COMMENT ON COLUMN pInfo.pContent IS '제품 상세 정보';

COMMENT ON COLUMN pInfo.fId IS '파일 번호';

COMMENT ON COLUMN pInfo.pId IS '상품 번호';

COMMENT ON COLUMN pInfo.sId IS '판매자 회원번호';

CREATE TABLE payment (
	payId	NUMBER		NOT NULL,
	cId	NUMBER		NOT NULL,
	bankName	NVARCHAR2(20)		NOT NULL,
	payWay	NVARCHAR2(20)		NOT NULL,
	money	NUMBER		NOT NULL,
	status	CHAR(1)	,
	pId	NUMBER		NOT NULL,
	sId	NUMBER		NOT NULL
);

ALTER TABLE payment
MODIFY status DEFAULT 'Y' NOT NULL;

COMMENT ON COLUMN payment.payId IS '결제번호';

COMMENT ON COLUMN payment.cId IS '시퀀스를 통한 회원번호';

COMMENT ON COLUMN payment.bankName IS '은행명';

COMMENT ON COLUMN payment.payWay IS '결제방식';

COMMENT ON COLUMN payment.money IS '결제금액';

COMMENT ON COLUMN payment.status IS '결제내역의 환불유무';

COMMENT ON COLUMN payment.pId IS '상품 번호';

COMMENT ON COLUMN payment.sId IS '판매자 회원번호';

ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (
	FAQId
);

ALTER TABLE Review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	reId
);

ALTER TABLE seller ADD CONSTRAINT PK_SELLER PRIMARY KEY (
	sId
);

ALTER TABLE Notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	nId
);

ALTER TABLE CReportList ADD CONSTRAINT PK_CREPORTLIST PRIMARY KEY (
	crId,
	cId
);

ALTER TABLE PList ADD CONSTRAINT PK_PLIST PRIMARY KEY (
	pId,
	sId
);

ALTER TABLE Answer ADD CONSTRAINT PK_ANSWER PRIMARY KEY (
	anId
);

ALTER TABLE SList ADD CONSTRAINT PK_SLIST PRIMARY KEY (
	sale_Id
);

ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (
	cId
);

ALTER TABLE dAddress ADD CONSTRAINT PK_DADDRESS PRIMARY KEY (
	daId,
	cId
);

ALTER TABLE Category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	cateId
);

ALTER TABLE pAttachment ADD CONSTRAINT PK_PATTACHMENT PRIMARY KEY (
	fId
);

ALTER TABLE Admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	aId
);

ALTER TABLE SReportList ADD CONSTRAINT PK_SREPORTLIST PRIMARY KEY (
	srId,
	reId
);

ALTER TABLE Question ADD CONSTRAINT PK_QUESTION PRIMARY KEY (
	qId,
	cId
);

ALTER TABLE pInfo ADD CONSTRAINT PK_PINFO PRIMARY KEY (
	infoNum
);

ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (
	payId,
	cId
);

ALTER TABLE FAQ ADD CONSTRAINT FK_Admin_TO_FAQ_1 FOREIGN KEY (
	aId
)
REFERENCES Admin (
	aId
);

ALTER TABLE Review ADD CONSTRAINT FK_SList_TO_Review_1 FOREIGN KEY (
	sale_Id
)
REFERENCES SList (
	sale_Id
);

ALTER TABLE Review ADD CONSTRAINT FK_Customer_TO_Review_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE seller ADD CONSTRAINT FK_Customer_TO_seller_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE seller ADD CONSTRAINT FK_pAttachment_TO_seller_1 FOREIGN KEY (
	fId
)
REFERENCES pAttachment (
	fId
);

ALTER TABLE Notice ADD CONSTRAINT FK_Admin_TO_Notice_1 FOREIGN KEY (
	aId
)
REFERENCES Admin (
	aId
);

ALTER TABLE CReportList ADD CONSTRAINT FK_Customer_TO_CReportList_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE CReportList ADD CONSTRAINT FK_SList_TO_CReportList_1 FOREIGN KEY (
	sale_Id
)
REFERENCES SList (
	sale_Id
);

ALTER TABLE PList ADD CONSTRAINT FK_seller_TO_PList_1 FOREIGN KEY (
	sId
)
REFERENCES seller (
	sId
);

ALTER TABLE PList ADD CONSTRAINT FK_pAttachment_TO_PList_1 FOREIGN KEY (
	fId
)
REFERENCES pAttachment (
	fId
);

ALTER TABLE PList ADD CONSTRAINT FK_Category_TO_PList_1 FOREIGN KEY (
	cateId
)
REFERENCES Category (
	cateId
);

ALTER TABLE Answer ADD CONSTRAINT FK_Admin_TO_Answer_1 FOREIGN KEY (
	aId
)
REFERENCES Admin (
	aId
);

ALTER TABLE Answer ADD CONSTRAINT FK_Question_TO_Answer_1 FOREIGN KEY (
	qId, cId
)
REFERENCES Question (
	qId, cId
);

ALTER TABLE SList ADD CONSTRAINT FK_PList_TO_SList_1 FOREIGN KEY (
	pId, sId
)
REFERENCES PList (
	pId, sId
);

ALTER TABLE SList ADD CONSTRAINT FK_Customer_TO_SList_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE dAddress ADD CONSTRAINT FK_Customer_TO_dAddress_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE Admin ADD CONSTRAINT FK_Customer_TO_Admin_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE SReportList ADD CONSTRAINT FK_Review_TO_SReportList_1 FOREIGN KEY (
	reId
)
REFERENCES Review (
	reId
);

ALTER TABLE SReportList ADD CONSTRAINT FK_SList_TO_SReportList_1 FOREIGN KEY (
	sale_Id
)
REFERENCES SList (
	sale_Id
);

ALTER TABLE SReportList ADD CONSTRAINT FK_seller_TO_SReportList_1 FOREIGN KEY (
	sId
)
REFERENCES seller (
	sId
);

ALTER TABLE Question ADD CONSTRAINT FK_Customer_TO_Question_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE pInfo ADD CONSTRAINT FK_pAttachment_TO_pInfo_1 FOREIGN KEY (
	fId
)
REFERENCES pAttachment (
	fId
);

ALTER TABLE pInfo ADD CONSTRAINT FK_PList_TO_pInfo_1 FOREIGN KEY (
	pId, sId
)
REFERENCES PList (
	pId, sId
);

ALTER TABLE payment ADD CONSTRAINT FK_Customer_TO_payment_1 FOREIGN KEY (
	cId
)
REFERENCES Customer (
	cId
);

ALTER TABLE payment ADD CONSTRAINT FK_PList_TO_payment_1 FOREIGN KEY (
	pId, sId
)
REFERENCES PList (
	pId, sId
);
