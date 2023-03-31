--대소문자 구별 하지 않음(단 비밀번호는 구별함)
--CREATE : 생성 / ALTER : 수정 / DROP : 삭제, DELETE : 삭제

--오라클 버전이 변경되면서 사용자 생성 시 C## 문자를 넣어서 만들도록 변경 됨
--JAVADB => C##JAVADB 이런 방식을 C## 사용하지 않겠음


--사용자 : scott, hr => 데이터베이스 접속하여 데이터를 관리하는 계정
--       테이블, 인덱스, 뷰 등 여러 객체가 사용자별로 생성됨
--       업무에 따라 사용자들을 나눠서 관리


--스키마 : 데이터간 관계, 데이터 구조, 제약조건 등 데이터를 관리 저장하기 위해 정의한 데이터베이스 구조의 범위
--스키마 == 사용자(오라클 데이터베이스 경우)

--사용자 생성 : 사용자 생성 권한이 필요함 ==> sys, system

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

--user 생성은 sys, ststem 만 가능
--user 생성 ( 공간 할당 )
-- CREATE USER 사용자이름 IDENTIFIED BY 비밀번호
CREATE USER JAVADB IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

ALTER USER javadb QUOTA 2M ON USERS;

--GRANT : 권한 부여(사용자 생성만 해서는 아무것도 할 수 없음)
GRANT CONNECT, RESOURSE TO JAJADB;


CREATE USER SCOTT IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURSE TO SCOTT;

GRANT CREATE VIEW TO SCOTT;
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

select * from all_users;


GRANT UNLIMITED TABLESPACE TO SCOTT;


GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;

-- test 사용자 생성 / 비번 12345
CREATE USER test IDENTIFIED BY 12345;

--접속권한 부여하지 않으면 안됨

--1) 시스템 권한
--   사용자 생성(CREATE USER) / 수정(ALTER USER) / 삭제(DROP USER)
--   데이터베이스 접근 (CREATE SESSION) / 수정 (ALTER SESSION)
--   여러 객체 생성(view, synoym) 및 관리 권한

--2) 객체 권한
--   테이블 수정, 삭제, 인덱스 생성, 삽입, 참조, 조회, 수정
--   뷰 삭제, 삽입, 생성, 조회, 수정
--   시퀀스 수정, 조회
--   프로시저, 함수, 패키지 권한


-- 권한 부여

-- create session 을 test 에게 부여
GRANT CREATE SESSION TO test;

GRANT RESOURCE, CREATE TABLE TO test;

ALTER USER test DEFAULT TABLESPACE USERS;
ALTER USER test TEMPORARY  TABLESPACE TEMP;
ALTER USER test QUOTA 2M ON USERS;

-- scott 에게 test 생성한 member 테이블 조회 권한 부여
--GRANT SELECT ON member TO scott;

--권한 취소
--REVOKE SELECT, INSERT ON member FROM scott;

--룰 : 여러 권한들의 모임
--CONNECT 룰 : CREATE SESSION
--RESOURCE 롤 : CREATE TRIGGER, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TABLE...




--사용자 삭제
DROP USER test;
DROP USER test CASCADE; --test와 관련된 모든 객체 같이 삭제

-- 사용자 생성 + 테이블 스페이스 권한 부여
CREATE USER test2 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
--권한부여
GRANT CONNECT, RESOURCE TO test2;




