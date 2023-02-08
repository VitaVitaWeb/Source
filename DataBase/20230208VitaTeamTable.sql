
-- 회원
DROP TABLE IF EXISTS vita_member;

-- 영양제
DROP TABLE IF EXISTS vita_vita;

-- 후기
DROP TABLE IF EXISTS vita_review;

-- QA
DROP TABLE IF EXISTS vita_QA;

-- 댓글
DROP TABLE IF EXISTS vita_comment;

-- 커뮤니티
DROP TABLE IF EXISTS TABLE6;

-- 신고
DROP TABLE IF EXISTS vita_singo;

-- 첨부파일
DROP TABLE IF EXISTS vita_file;

-- 방문히스토리
DROP TABLE IF EXISTS TABLE9;

-- 공지사항
DROP TABLE IF EXISTS vita_notice;

-- 검색
DROP TABLE IF EXISTS TABLE11;

-- 검색키워드
DROP TABLE IF EXISTS vita_search;

-- 방문히스토리
DROP TABLE IF EXISTS vita_history;

-- 새 테이블
DROP TABLE IF EXISTS TABLE12;

-- 기능성
DROP TABLE IF EXISTS vita_function;

-- 제형
DROP TABLE IF EXISTS vita_formulation;

-- 섭취방법
DROP TABLE IF EXISTS TABLE15;

-- 영양소
DROP TABLE IF EXISTS vita_vitamin;

-- 설문조사
DROP TABLE IF EXISTS vita_survey;

-- 선호
DROP TABLE IF EXISTS vita_prefer;

-- 설문조사_제형
DROP TABLE IF EXISTS vita_sur_formulation;

-- 설문조사_기능성
DROP TABLE IF EXISTS vita_sur_function;

-- 설문조사_선호
DROP TABLE IF EXISTS vita_sur_prefer;

-- 설문조사_영양소
DROP TABLE IF EXISTS vita_sur_vitamin;

-- 회원
CREATE TABLE vita_member (
	mno VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(40) NOT NULL,
	pwd VARCHAR(100) NOT NULL,
	jdate DATE NOT NULL,
	phn VARCHAR(30) NOT NULL,
	bth DATE NOT NULL,
	gen INTEGER NOT NULL,
	rcnt INTEGER NOT NULL
);

-- 회원
ALTER TABLE vita_member
	ADD CONSTRAINT PK_vita_member -- 회원 기본키
	PRIMARY KEY (
	mno -- 아이디
	);

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_vita_member
	ON vita_member ( -- 회원
				email ASC -- 이메일
	);

-- 회원 인덱스
CREATE INDEX IX_vita_member
	ON vita_member( -- 회원
				name ASC -- 이름
	);

-- 영양제
CREATE TABLE vita_vita (
	vno INTEGER NOT NULL,
	name VARCHAR(50) NOT NULL,
	link VARCHAR(255) NOT NULL
);

-- 영양제
ALTER TABLE vita_vita
	ADD CONSTRAINT PK_vita_vita -- 영양제 기본키
	PRIMARY KEY (
	vno -- 영양제번호
	);

ALTER TABLE vita_vita
	MODIFY COLUMN vno INTEGER NOT NULL AUTO_INCREMENT;

-- 후기
CREATE TABLE vita_review (
	rno INTEGER NOT NULL,
	cont MEDIUMTEXT NOT NULL,
	wdate DATE NOT NULL,
	vlike BOOLEAN NOT NULL,
	mno VARCHAR(50) NULL
);

-- 후기
ALTER TABLE vita_review
	ADD CONSTRAINT PK_vita_review -- 후기 기본키
	PRIMARY KEY (
	rno -- 후기번호
	);

ALTER TABLE vita_review
	MODIFY COLUMN rno INTEGER NOT NULL AUTO_INCREMENT;

-- QA
CREATE TABLE vita_QA (
	qno INTEGER NOT NULL,
	open BOOLEAN NOT NULL,
	title VARCHAR(255) NOT NULL,
	cont MEDIUMTEXT NOT NULL,
	qdate DATE NULL,
	ans MEDIUMTEXT NULL,
	adate DATE NULL,
	mno VARCHAR(50) NULL
);

-- QA
ALTER TABLE vita_QA
	ADD CONSTRAINT PK_vita_QA -- QA 기본키
	PRIMARY KEY (
	qno -- QA번호
	);

ALTER TABLE vita_QA
	MODIFY COLUMN qno INTEGER NOT NULL AUTO_INCREMENT;

-- 댓글
CREATE TABLE vita_comment (
	cno INTEGER NOT NULL,
	cont MEDIUMTEXT NULL,
	date DATE NOT NULL
);

-- 댓글
ALTER TABLE vita_comment
	ADD CONSTRAINT PK_vita_comment -- 댓글 기본키
	PRIMARY KEY (
	cno -- 댓글번호
	);

ALTER TABLE vita_comment
	MODIFY COLUMN cno INTEGER NOT NULL AUTO_INCREMENT ;


-- 신고
CREATE TABLE vita_singo (
	sno INTEGER NOT NULL,
	reason MEDIUMTEXT NOT NULL,
	cont MEDIUMTEXT NOT NULL,
	date DATE NOT NULL,
	rno INTEGER NULL
);

-- 신고
ALTER TABLE vita_singo
	ADD CONSTRAINT PK_vita_singo -- 신고 기본키
	PRIMARY KEY (
	sno -- 신고번호
	);

ALTER TABLE vita_singo
	MODIFY COLUMN sno INTEGER NOT NULL AUTO_INCREMENT;

-- 첨부파일
CREATE TABLE vita_file (
	fno INTEGER NOT NULL,
	path VARCHAR(255) NOT NULL,
	vno INTEGER NULL
);

-- 첨부파일
ALTER TABLE vita_file
	ADD CONSTRAINT PK_vita_file -- 첨부파일 기본키
	PRIMARY KEY (
	fno -- 첨부파일번호
	);

ALTER TABLE vita_file
	MODIFY COLUMN fno INTEGER NOT NULL AUTO_INCREMENT;

-- 공지사항
CREATE TABLE vita_notice (
	nno INTEGER NOT NULL,
	title VARCHAR(255) NULL,
	cont MEDIUMTEXT NOT NULL,
	date DATE NOT NULL
);

-- 공지사항
ALTER TABLE vita_notice
	ADD CONSTRAINT PK_vita_notice -- 공지사항 기본키
	PRIMARY KEY (
	nno -- 공지사항번호
	);

ALTER TABLE vita_notice
	MODIFY COLUMN nno INTEGER NOT NULL AUTO_INCREMENT;


-- 검색키워드
CREATE TABLE vita_search (
	SKNO INTEGER NOT NULL,
	KWD VARCHAR(50) NOT NULL,
	SCDATE DATE NOT NULL
);

-- 검색키워드
ALTER TABLE vita_search
	ADD CONSTRAINT PK_vita_search -- 검색키워드 기본키
	PRIMARY KEY (
	SKNO -- 검색키워드번호
	);

ALTER TABLE vita_search
	MODIFY COLUMN SKNO INTEGER NOT NULL AUTO_INCREMENT;

-- 방문히스토리
CREATE TABLE vita_history (
	HNO INTEGER NOT NULL,
	HDATE DATE NOT NULL,
	mno VARCHAR(50) NULL
);

-- 방문히스토리
ALTER TABLE vita_history
	ADD CONSTRAINT PK_vita_history -- 방문히스토리 기본키
	PRIMARY KEY (
	HNO -- 방문히스토리번호
	);

ALTER TABLE vita_history
	MODIFY COLUMN HNO INTEGER NOT NULL AUTO_INCREMENT;


-- 기능성
CREATE TABLE vita_function (
	vno INTEGER NOT NULL,
	sc BOOLEAN DEFAULT 0,
	act BOOLEAN DEFAULT 0,
	eye BOOLEAN DEFAULT 0,
	joint BOOLEAN DEFAULT 0,
	oxy BOOLEAN DEFAULT 0,
	sight BOOLEAN DEFAULT 0,
	skin BOOLEAN DEFAULT 0,
	weight BOOLEAN DEFAULT 0,
	imn BOOLEAN DEFAULT 0,
	jang BOOLEAN DEFAULT 0,
	gan BOOLEAN DEFAULT 0,
	prs BOOLEAN DEFAULT 0,
	bspd BOOLEAN DEFAULT 0,
	bone BOOLEAN DEFAULT 0,
	col BOOLEAN DEFAULT 0,
	vmid BOOLEAN DEFAULT 0,
	dang BOOLEAN DEFAULT 0
);

-- 기능성
ALTER TABLE vita_function
	ADD CONSTRAINT PK_vita_function -- 기능성 기본키
	PRIMARY KEY (
	vno -- 영양제번호
	);

ALTER TABLE vita_function
	MODIFY COLUMN vno INTEGER NOT NULL AUTO_INCREMENT;

-- 제형
CREATE TABLE vita_formulation (
	vno INTEGER NOT NULL,
	cap BOOLEAN DEFAULT 0,
	pill BOOLEAN DEFAULT 0,
	pow BOOLEAN DEFAULT 0,
	liq BOOLEAN DEFAULT 0,
	chew BOOLEAN DEFAULT 0,
	jell BOOLEAN DEFAULT 0,
	pho BOOLEAN DEFAULT 0,
	ball BOOLEAN DEFAULT 0
);

-- 제형
ALTER TABLE vita_formulation
	ADD CONSTRAINT PK_vita_formulation -- 제형 기본키
	PRIMARY KEY (
	vno -- 영양제번호
	);

ALTER TABLE vita_formulation
	MODIFY COLUMN vno INTEGER NOT NULL AUTO_INCREMENT;


-- 영양소
CREATE TABLE vita_vitamin (
	vno INTEGER NOT NULL,
	e DECIMAL(5,1) DEFAULT 0,
	d DECIMAL(5,1) DEFAULT 0,
	a DECIMAL(5,1) DEFAULT 0,
	b1 DECIMAL(5,1) DEFAULT 0,
	b2 DECIMAL(5,1) DEFAULT 0,
	b3 DECIMAL(5,1) DEFAULT 0,
	b5 DECIMAL(5,1) DEFAULT 0,
	b4 DECIMAL(5,1) DEFAULT 0,
	b9 DECIMAL(5,1) DEFAULT 0,
	b12 DECIMAL(5,1) DEFAULT 0,
	b7 DECIMAL(5,1) DEFAULT 0,
	c DECIMAL(5,1) DEFAULT 0,
	cr DECIMAL(5,1) DEFAULT 0,
	mo DECIMAL(5,1) DEFAULT 0,
	i DECIMAL(5,1) DEFAULT 0,
	mn DECIMAL(5,1) DEFAULT 0,
	se DECIMAL(5,1) DEFAULT 0,
	cu DECIMAL(5,1) DEFAULT 0,
	zn DECIMAL(5,1) DEFAULT 0,
	fe DECIMAL(5,1) DEFAULT 0,
	mg DECIMAL(5,1) DEFAULT 0,
	ca DECIMAL(5,1) DEFAULT 0,
	lacto DECIMAL(5,1) DEFAULT 0
);

-- 영양소
ALTER TABLE vita_vitamin
	ADD CONSTRAINT PK_vita_vitamin -- 영양소 기본키
	PRIMARY KEY (
	vno -- 영양제번호
	);

ALTER TABLE vita_vitamin
	MODIFY COLUMN vno INTEGER NOT NULL AUTO_INCREMENT;

-- 설문조사
CREATE TABLE vita_survey (
	mno VARCHAR(50) NOT NULL,
	preno INTEGER NULL,
	forno INTEGER NULL,
	funno INTEGER NULL,
	vino INTEGER NULL
);

-- 설문조사
ALTER TABLE vita_survey
	ADD CONSTRAINT PK_vita_survey -- 설문조사 기본키
	PRIMARY KEY (
	mno -- 아이디
	);

-- 선호
CREATE TABLE vita_prefer (
	vno INTEGER NOT NULL,
	mny BOOLEAN DEFAULT 0,
	src BOOLEAN DEFAULT 0,
	mtr BOOLEAN DEFAULT 0,
	mult BOOLEAN DEFAULT 0,
	pakg BOOLEAN DEFAULT 0,
	high BOOLEAN DEFAULT 0,
	fit BOOLEAN DEFAULT 0,
	abrd BOOLEAN DEFAULT 0,
	vday BOOLEAN DEFAULT 0
);

-- 선호
ALTER TABLE vita_prefer
	ADD CONSTRAINT PK_vita_prefer -- 선호 기본키
	PRIMARY KEY (
	vno -- 영양제번호
	);

ALTER TABLE vita_prefer
	MODIFY COLUMN vno INTEGER NOT NULL AUTO_INCREMENT;

-- 설문조사_제형
CREATE TABLE vita_sur_formulation (
	forno INTEGER NOT NULL,
	cap BOOLEAN DEFAULT 0,
	pill BOOLEAN DEFAULT 0,
	pow BOOLEAN DEFAULT 0,
	liq BOOLEAN DEFAULT 0,
	chew BOOLEAN DEFAULT 0,
	jell BOOLEAN DEFAULT 0,
	pho BOOLEAN DEFAULT 0,
	ball BOOLEAN DEFAULT 0
);

-- 설문조사_제형
ALTER TABLE vita_sur_formulation
	ADD CONSTRAINT PK_vita_sur_formulation -- 설문조사_제형 기본키
	PRIMARY KEY (
	forno -- 제형번호
	);

ALTER TABLE vita_sur_formulation
	MODIFY COLUMN forno INTEGER NOT NULL AUTO_INCREMENT;

-- 설문조사_기능성
CREATE TABLE vita_sur_function (
	funno INTEGER NOT NULL,
	sc BOOLEAN DEFAULT 0,
	act BOOLEAN DEFAULT 0,
	eye BOOLEAN DEFAULT 0,
	joint BOOLEAN DEFAULT 0,
	oxy BOOLEAN DEFAULT 0,
	sight BOOLEAN DEFAULT 0,
	skin BOOLEAN DEFAULT 0,
	weight BOOLEAN DEFAULT 0,
	imn BOOLEAN DEFAULT 0,
	jang BOOLEAN NOT NULL,
	gan BOOLEAN DEFAULT 0,
	prs BOOLEAN DEFAULT 0,
	bspd BOOLEAN DEFAULT 0,
	bone BOOLEAN DEFAULT 0,
	col BOOLEAN DEFAULT 0,
	vmid BOOLEAN DEFAULT 0,
	dang BOOLEAN DEFAULT 0
);

-- 설문조사_기능성
ALTER TABLE vita_sur_function
	ADD CONSTRAINT PK_vita_sur_function -- 설문조사_기능성 기본키
	PRIMARY KEY (
	funno -- 기능성번호
	);

ALTER TABLE vita_sur_function
	MODIFY COLUMN funno INTEGER NOT NULL AUTO_INCREMENT;

-- 설문조사_선호
CREATE TABLE vita_sur_prefer (
	preno INTEGER NOT NULL,
	mny BOOLEAN DEFAULT 0,
	src BOOLEAN DEFAULT 0,
	mtr BOOLEAN DEFAULT 0,
	mult BOOLEAN DEFAULT 0,
	pakg BOOLEAN DEFAULT 0,
	high BOOLEAN DEFAULT 0,
	fit BOOLEAN DEFAULT 0,
	abrd BOOLEAN DEFAULT 0,
	vday BOOLEAN DEFAULT 0
);

-- 설문조사_선호
ALTER TABLE vita_sur_prefer
	ADD CONSTRAINT PK_vita_sur_prefer -- 설문조사_선호 기본키
	PRIMARY KEY (
	preno -- 선호번호
	);

ALTER TABLE vita_sur_prefer
	MODIFY COLUMN preno INTEGER NOT NULL AUTO_INCREMENT;

-- 설문조사_영양소
CREATE TABLE vita_sur_vitamin (
	vino INTEGER NOT NULL,
	e DECIMAL(5,1) DEFAULT 0,
	d DECIMAL(5,1) DEFAULT 0,
	a DECIMAL(5,1) DEFAULT 0,
	b1 DECIMAL(5,1) DEFAULT 0,
	b2 DECIMAL(5,1) DEFAULT 0,
	b3 DECIMAL(5,1) DEFAULT 0,
	b5 DECIMAL(5,1) DEFAULT 0,
	b4 DECIMAL(5,1) DEFAULT 0,
	b9 DECIMAL(5,1) DEFAULT 0,
	b12 DECIMAL(5,1) DEFAULT 0,
	b7 DECIMAL(5,1) DEFAULT 0,
	c DECIMAL(5,1) DEFAULT 0,
	cr DECIMAL(5,1) DEFAULT 0,
	mo DECIMAL(5,1) DEFAULT 0,
	i DECIMAL(5,1) DEFAULT 0,
	mn DECIMAL(5,1) DEFAULT 0,
	se DECIMAL(5,1) DEFAULT 0,
	cu DECIMAL(5,1) DEFAULT 0,
	zn DECIMAL(5,1) DEFAULT 0,
	fe DECIMAL(5,1) DEFAULT 0,
	mg DECIMAL(5,1) DEFAULT 0,
	ca DECIMAL(5,1) DEFAULT 0,
	lacto DECIMAL(5,1) DEFAULT 0
);

-- 설문조사_영양소
ALTER TABLE vita_sur_vitamin
	ADD CONSTRAINT PK_vita_sur_vitamin -- 설문조사_영양소 기본키
	PRIMARY KEY (
	vino -- 영양소번호
	);

ALTER TABLE vita_sur_vitamin
	MODIFY COLUMN vino INTEGER NOT NULL AUTO_INCREMENT;

-- 후기
ALTER TABLE vita_review
	ADD CONSTRAINT FK_vita_member_TO_vita_review -- 회원 -> 후기
	FOREIGN KEY (
	mno -- 아이디
	)
	REFERENCES vita_member ( -- 회원
	mno -- 아이디
	);

-- QA
ALTER TABLE vita_QA
	ADD CONSTRAINT FK_vita_member_TO_vita_QA -- 회원 -> QA
	FOREIGN KEY (
	mno -- 아이디
	)
	REFERENCES vita_member ( -- 회원
	mno -- 아이디
	);

-- 신고
ALTER TABLE vita_singo
	ADD CONSTRAINT FK_vita_review_TO_vita_singo -- 후기 -> 신고
	FOREIGN KEY (
	rno -- 후기번호
	)
	REFERENCES vita_review ( -- 후기
	rno -- 후기번호
	);

-- 첨부파일
ALTER TABLE vita_file
	ADD CONSTRAINT FK_vita_vita_TO_vita_file -- 영양제 -> 첨부파일
	FOREIGN KEY (
	vno -- 영양제번호
	)
	REFERENCES vita_vita ( -- 영양제
	vno -- 영양제번호
	);

-- 방문히스토리
ALTER TABLE vita_history
	ADD CONSTRAINT FK_vita_member_TO_vita_history -- 회원 -> 방문히스토리
	FOREIGN KEY (
	mno -- 아이디
	)
	REFERENCES vita_member ( -- 회원
	mno -- 아이디
	);

-- 기능성
ALTER TABLE vita_function
	ADD CONSTRAINT FK_vita_vita_TO_vita_function -- 영양제 -> 기능성
	FOREIGN KEY (
	vno -- 영양제번호
	)
	REFERENCES vita_vita ( -- 영양제
	vno -- 영양제번호
	);

-- 제형
ALTER TABLE vita_formulation
	ADD CONSTRAINT FK_vita_vita_TO_vita_formulation -- 영양제 -> 제형
	FOREIGN KEY (
	vno -- 영양제번호
	)
	REFERENCES vita_vita ( -- 영양제
	vno -- 영양제번호
	);

-- 영양소
ALTER TABLE vita_vitamin
	ADD CONSTRAINT FK_vita_vita_TO_vita_vitamin -- 영양제 -> 영양소
	FOREIGN KEY (
	vno -- 영양제번호
	)
	REFERENCES vita_vita ( -- 영양제
	vno -- 영양제번호
	);

-- 설문조사
ALTER TABLE vita_survey
	ADD CONSTRAINT FK_vita_member_TO_vita_survey -- 회원 -> 설문조사
	FOREIGN KEY (
	mno -- 아이디
	)
	REFERENCES vita_member ( -- 회원
	mno -- 아이디
	);

-- 설문조사
ALTER TABLE vita_survey
	ADD CONSTRAINT FK_vita_sur_prefer_TO_vita_survey -- 설문조사_선호 -> 설문조사
	FOREIGN KEY (
	preno -- 선호번호
	)
	REFERENCES vita_sur_prefer ( -- 설문조사_선호
	preno -- 선호번호
	);

-- 설문조사
ALTER TABLE vita_survey
	ADD CONSTRAINT FK_vita_sur_formulation_TO_vita_survey -- 설문조사_제형 -> 설문조사
	FOREIGN KEY (
	forno -- 제형번호
	)
	REFERENCES vita_sur_formulation ( -- 설문조사_제형
	forno -- 제형번호
	);

-- 설문조사
ALTER TABLE vita_survey
	ADD CONSTRAINT FK_vita_sur_function_TO_vita_survey -- 설문조사_기능성 -> 설문조사
	FOREIGN KEY (
	funno -- 기능성번호
	)
	REFERENCES vita_sur_function ( -- 설문조사_기능성
	funno -- 기능성번호
	);

-- 설문조사
ALTER TABLE vita_survey
	ADD CONSTRAINT FK_vita_sur_vitamin_TO_vita_survey -- 설문조사_영양소 -> 설문조사
	FOREIGN KEY (
	vino -- 영양소번호
	)
	REFERENCES vita_sur_vitamin ( -- 설문조사_영양소
	vino -- 영양소번호
	);

-- 선호
ALTER TABLE vita_prefer
	ADD CONSTRAINT FK_vita_vita_TO_vita_prefer -- 영양제 -> 선호
	FOREIGN KEY (
	vno -- 영양제번호
	)
	REFERENCES vita_vita ( -- 영양제
	vno -- 영양제번호
	);