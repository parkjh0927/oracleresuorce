--scott

--emp(employee) 테이블 구성 보기
--필드명(열이름) 제약조건 데이터타입
--NUMBER : 소수점 자릿수를포함해서 지정 가능
--NUMBER(4) : 4자리 숫자까지 허용, NUMBER(8,2) : 전체 자릿수는 8 자리이고 소수점 2자리를 포함한다.
--VARCHAR2 : 가변형 문자열 저장
--VARCHAR2(10) : 10byte 문자까지 저장 가능
--DATE : 날짜 데이터

select *
from emp;

select empno, ename, sal
from emp;

DESC emp;
DESC dept;

select *
from dept;

select deptno, loc
from dept;

select deptno from emp;

--DISTINCT : 중복 제거
select distinct job, deptno
from emp;

select empno, ename, sal*12+comm as ANNSAL
from emp;

select empno, ename 사원명,job "직 책", sal*12+comm ANNSAL
from emp;
