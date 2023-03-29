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

select ename, sal
from emp
order by sal;

select *
from emp
order by deptno, sal desc;

desc emp;

select empno employee_no, ename employee_name, job, mgr manager, hiredate, sal salary, comm commission, deptno department_no
from emp
order by deptno desc, ename;


select *
from emp
where deptno=30;

select *
from emp
where deptno=30 and job='SALESMAN';

select *
from emp
where empno=7499 and deptno=30;

select *
from emp
where deptno=30 or job='CLERK';

--산술연산자 : +, -, *, /, mod(나머지- 표준은 아님(오라클에서만 제공))
--비교연산자 : >, >=, <, <=
--등가비교연산자 : =, !=, <>, ^= (!=, <>, ^= : A값과 B값이 다를 경우 true, 같은 경우 false)
--논리부정연산자 : NOT
--IN 연산자
--BETWEEN A AND B 연산자
--LIKE연산자와 와일드 카드(_, %)
--IS NULL
--집합연산자 : UNION(합집합-중복제거), UNION ALL(합집합-중복포함), MINUS(차집합), INTERSECT(교집합)

select *
from emp
where sal*12=36000;

select *
from emp
where ename>='F';

select *
from emp
where ename <= 'FORZ';


select *
from emp
where JOB='MANAGER' or JOB='SALESMAN' or job='CLERK';

select * 
from emp
where sal!=3000;

select * 
from emp
where job IN('MANAGER', 'SALESMAN', 'CLERK');

select * 
from emp
where job NOT IN('MANAGER', 'SALESMAN', 'CLERK');

select *
from emp
where deptno in(10,20);

select *
from emp;

select *
from emp
where sal between 2000 and 3000;



select *
from emp
where ename like 'S%';

select *
from emp
where ename like '_L%';


select *
from emp
where ename not like '%AM%';

select empno, ename, sal, deptno
from emp
--where deptno = 10
intersect
select empno, ename, sal, deptno
from emp
where deptno = 20;

select *
from emp
where ename like '%S';

select empno, ename, sal
from emp
where deptno=30 and job = 'SALESMAN'
order by sal desc;

select empno, ename, sal, deptno
from emp
where deptno in(20,30)
intersect
select empno, ename, sal, deptno
from emp
where sal > 2000;

--upper: 모두 대문자, lower: 모두 소문자, initcap: 첫 글자만 대문자

--dual : sys가 소유하는 테이블(임시 연산이나 함수의 결과 값 확인하는 용도
--lengthb: byte 수
select length('한글'), lengthb('한글'), lengthb('ab')
from dual;

--substr(문자열데이터, 시작위치, 추출길이): 문자열 일부 추출, 추출길이 생략 가능

select job, substr(job,1,2), substr(job,3,2)
from emp;

--instr: 문자열 데이터 안에서 특정 문자 위치 찾기
--instr(대상문자열,위치를 찾으려는 문자열, 대상문자열에서 찾기를 시작할 위치(선택), 시작위치에서 찾으려는 문자가 몇번째인지 지정(선택))

select instr('hello, oracle!', 'l') in1, instr('hello, oracle!', 'l',5) in2,  instr('hello, oracle!', 'l',2,2) in3
from dual;

--replace: 특정 문자를 다른 문자로 변경
--replace(문자열데이터, 찾는문자, 변경문자)

select '010-1234-5678' 변경전, replace('010-1234-5678','-')
from dual;

--concat : 문자열 합치기

-- || : 문자열 연결 연산자
select empno || ename, empno || ':' || ename
from emp;

--trim, ltrim, rtrim : 공백제거
select '   이것이    이것이   ' from dual;
select trim('   이것이    이것이   ') from dual;


--round, trunc, ceil, floor, mod


--round: 반올림
--trunc: 버림
--ceil: 입력된 숫자와 가까운 큰 정수
--floor: 입력된 숫자와 가까운 작은 정수
--mod: 나머지
select
    round(1234.5678) as round,
    round(1234.5678, 0) as round,
    round(1234.5678, 1) as round,
    round(1234.5678, 2) as round,
    round(1234.5678, -1) as round,
    round(1234.5678, -2) as round
from dual;

select mod(15,6) from dual;


--날짜 함수
--날짜 데이터 + 숫자 : 날짜 데이터보다 숫자만큼 일수 이후의 날짜
--날짜 데이터 - 날짜 데이터 : 두 날짜 데이터 간의 일수 차이

--sysdate 함수
select 
    sysdate,
    sysdate -1 yesterday,
    sysdate +1 tomorrow
from dual;

--add_months(날짜, 더할 개월수)

select empno, ename, hiredate, add_months(hiredate, 50*12) 입사50주년날짜
from emp;

select empno, ename, hiredate
from emp
where months_between(sysdate, hiredate) < 540;

select sysdate, add_months(sysdate, 6)
from dual;

select sysdate, next_day(sysdate, '금요일'), last_day(sysdate)
from dual;

--cc : 네 자리 연도의 끝 두자리를 기준으로 사용
select 
    sysdate, 
    round(sysdate, 'CC') format_cc, 
    round(sysdate, 'YYYY') format_YYYY,
    round(sysdate, 'DDD') format_DDD,
    round(sysdate, 'HH') format_HH
from dual;


--형변환 함수 : 자료형을 형 변환
--NUMBER, VARCHAR2, DATE
select empno, ename, empno+'500'
from emp
where ename = 'FORD';

select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') 현재날짜시간
from dual;

--to_number(문자열데이터, 인식될 숫자형태)

select to_number('1,300','999,999') - to_number('1,500', '999,999')
from dual;

--L(local) 지역 화폐 단위 기호 붙여줌
select sal, to_char(sal, '$999,999') sal_$, to_char(sal, 'L999,999') sal_L
from emp;

--to_date(문자열데이터, '인식될 날짜 형태')
select to_date('2018-07-14', 'YYYY-MM-DD') TODATE1, to_date('20230320', 'YYYY-MM-DD') todate2
from dual;

--널처리 함수
--NULL + 300 => NULL

--NVL(데이터, 널일 경우 반환할 데이터)
select empno, ename, sal, comm, sal+comm, nvl(comm,0)
from emp;

--NVL2(데이터, 널이 아닐 경우, 널일 경우)
select empno, ename, sal, comm, sal+comm, nvl2(comm,1,0)
from emp;

--DECODE함수 / CASE 문

--DECODE(검사 대상이 될 데이터,
--       조건1, 조건1이 일치할때 실행할 구문
--       조건2, 조거2가 일치할때 실행할 구문)

select empno, ename,job, sal, decode(job, 'MANAGER',sal*1.1,'SALESMAN', sal*1.05, 'ANALYST', sal, sal*1.03) upsal
from emp;

select empno, ename, job, sal,
    case job
    when 'MANAGER' then sal*1.1
    when 'SALESMAN' then sal*1.05
    when 'ANAYLST' then sal
    else sal*1.03
    end upsal
from emp;


select empno, ename, sal, trunc(sal/21.5,2) DAY_PAY, round(trunc(sal/21.5,2)/8,1) TIME_PAY
from emp;

select empno, ename, hiredate, next_day(add_months(hiredate,3),'월요일'), nvl(to_char(comm), 'N/A')
from emp;

select *
from emp;

select empno, ename, mgr, decode(substr(to_char(mgr),1,2), null, '0000', '75', '5555', '76', '6666', '77', '7777',substr(to_char(mgr),1)) chg_mgr
from emp;

--다중행 함수 : sum, count, max, min, avg

select sum(sal)
from emp;

select sum(distinct sal), sum(all sal), sum(sal)
from emp;

-- group by : 결과 값을 원하는 열로 묶어 출력

select avg(sal) from emp where deptno=10;
select avg(sal) from emp where deptno=20;
select avg(sal) from emp where deptno=30;

select avg(sal), deptno from emp group by deptno;

select deptno, avg(comm) from emp group by deptno;

select deptno, job, avg(sal) from emp group by deptno, job having avg(sal) >= 2000 order by deptno, job;


select deptno, trunc(avg(sal)) avg_sal, max(sal) max_sal, min(sal) min_sal, count(deptno)
from emp
group by deptno
order by deptno desc;

select job, count(*)
from emp
group by job
having count(*) >=3;

select * from emp;

select TO_CHAR(HIREDATE, 'YYYY') hire_year, deptno, count(*) cnt
from emp
group by TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

--조인 : 여러 테이블을 하나의 테이블처럼 사용
-- 1) 내부조인(inner join) : 여러 개의 테이블에서 공통된 부분만 ㅜ출
-- 2) 외부조인(outer join
--  1. left outer join
--  2. right outer join
--  3. full outer join

select *
from emp, dept
order by empno;

select e.empno, e.ename, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal >=3000;

select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- left outer join
select *
from emp e1, emp e2
where e1.mgr=e2.empno(+);

-- right outer join
select *
from emp e1, emp e2
where e1.mgr(+)=e2.empno;

--SQL-99 표준
select *
from emp e join dept d on e.deptno = d.deptno;

select *
from emp e1 full outer join emp e2 on e1.mgr = e2.empno;

desc dept;
desc emp;

select e.deptno, d.dname, e.empno, e.ename, e.sal
from emp e, dept d
where e.deptno = d.deptno and e.sal>2000
order by deptno;

select d.deptno, d.dname, avg(sal) avg_sal, max(sal) max_sal, min(sal) min_sal
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno, d.dname;

select e.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e, dept d
where e.deptno(+) = d.deptno
order by e.deptno,e.empno;

--서브쿼리
-- sql 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql 문 내부에서 사용하는 select 문

select *
from emp
where sal>(select sal from emp where ename='JONES');

select e.empno, e.ename, e.job, e.sal, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno=d.deptno and e.deptno=20  and e.sal>(select avg(sal) from emp);

select * from emp where sal in (select max(sal) from emp group by deptno);

select * from emp where sal < any (select sal from emp where deptno=30);
select * from emp where sal < all (select sal from emp where deptno=30);

select * from emp where exists (select dname from dept where deptno=10);



select e.job, e.empno, e.ename, e.sal, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.job = (select job from emp where ename = 'ALLEN');

desc emp;
desc dept;
desc salgrade;

select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno=d.deptno and e.sal between losal and hisal and e.sal > (select avg(sal) from emp) 
order by sal desc, empno;

select * 
from emp
where (deptno, sal) in(select deptno, max(sal) from emp group by deptno);

-- from 절에 사용하는 서브쿼리(인라인 뷰)
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (select * from emp where deptno = 10) e10,
     (select * from dept) d
where e10.deptno = d.deptno;

--select 절에 사용하는 서브쿼리(스칼라 서브쿼리)
select empno, ename, job, sal, 
(select grade from salgrade where e.sal between losal and hisal) salgrade, deptno, 
(select dname from dept where e.deptno = dept.deptno) dname
from emp e;

select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and d.deptno = 10 and e.job not in (select job from emp where deptno=30); 


desc emp;
desc dept;
desc salgrade;



select empno ename, job, grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal and e.sal > (select max(sal) from emp where job='SALESMAN');



--DML(Data Manipulation Language) : 데이터 추가(INSERT), 수정(UPDATE), 삭제(DELETE)하는 데이터 조작어
--COMMIT : DML 작업을 데이터베이스에 최종 반영
--ROLLBACK : DML 작업을 취소
--select + DML ==> 자주 사용하는 sql 임

--연습용 테이블 생성
CREATE TABLE dept_temp AS SELECT * from dept;

DROP TABLE dept_temp;

insert into dept_temp(deptno, dname, loc)
values(50, 'DATABASE','SEOUL');


select * from dept_temp;

insert into dept_temp values(60, 'NETWORK','BUSAN');

--insert into dept_temp values(600, 'NETWORK','BUSAN');

create table emp_temp as select * from emp where 1<> 1;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

select * from emp_temp;


insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno from emp e ,salgrade s  where e.sal between s.losal and s.hisal and s.grade = 1;

commit;

-- update : 테이블에 있는 데이터 수정
--update 테이블명
--set 변경할열이름 = 데이터, 변경할열이름 = 데이터.....
--where 변경을 위한 대상 행을 선별하기 위한 조건
select * from dept_temp;

update  dept_temp
set loc = 'SEOUL'
where deptno = 40;

rollback;

update dept_temp
set (dname, loc) = (select dname, loc from dept where deptno = 40)
where deptno = 40;

commit;

-- delete : 테이블에 있는 데이터 삭제
-- delete 테이블명
-- from (선택)
-- where 삭제 데이터를  선별하기 위한 조건식


create table emp_temp2 as select * from emp;
drop table emp_temp2;

delete from emp_temp2
where empno in (select e.empno from emp_temp2 e, salgrade s where e.sal between s.losal and s.hisal and s.grade=3 and e.deptno = 30);
select * from emp_temp2;


select * from emp;

create table exam_emp as select * from emp where 1<>1;
drop table exam_emp;

select * from exam_emp;

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7201, 'TEST_USER1', 'manager', 7788, '2016-01-02', 4500 ,null, 50);

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7202, 'TEST_USER2', 'clerk', 7201, '2016-02-21', 1800 ,null, 50);

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7203, 'TEST_USER3', 'analyst', 7201, '2016-04-11', 3400 ,null, 60);

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7204, 'TEST_USER4', 'salesman', 7201, '2016-05-31', 2700 , 300, 60);

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7205, 'TEST_USER5', 'clerk', 7201, '2016-07-20', 2600 ,null, 70);

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7206, 'TEST_USER6', 'clerk', 7201, '2016-09-08', 2600 ,null, 70);

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7207, 'TEST_USER7', 'lecturer', 7201, '2016-10-28', 2300 ,null, 80);

insert into exam_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(7208, 'TEST_USER8', 'student', 7201, '2016-03-09', 1200 ,null, 80);

create table exam_dept as select * from dept where 1<> 1;
create table exam_salgrade as select * from salgrade where 1<>1;

update exam_emp 
set deptno=70
where sal > (select avg(sal) from exam_emp where deptno=50);

update exam_emp
set sal=sal*1.1, deptno=80
where hiredate > (select min(hiredate) from exam_emp where deptno=60);

delete from exam_emp
where empno in (select empno from exam_emp e, salgrade s where e.sal between s.losal and s.hisal and s.grade = 5);


--트랜잭션(transaction) : 최소 수행 단위
--트랜잭션 제어하는 구문 TCL(Transaction Control Language) : commit, rollback

create table dept_tcl as select * from dept;

insert into dept_tcl values(50, 'DATABASE','SEOOUL');

update dept_tcl set loc= 'BUSAN' where deptno=40;

delete from dept_tcl where dname = 'RESEARCH';

select * from dept_tcl;

--트랜잭션 취소
rollback;
 
--트랜잭션 최종 반영
commit;

--세션 : 어떤 활동을 위한 시간이나 기간
--데이터베이스 세션 : 데이터베이스 접속을 시작으로 관련작업 수행한 후 접속 완료
--LOCK : 잠금(수정 중인 데이터 접근 막기)

delete from dept_tcl where deptno=50;


select * from dept_temp;


--DDL : 데이터 정의어(데이터 베이스 객체 생성, 수정, 삭제)
--1. 테이블 생성
--create table 테이블명(
--    열이르1 자료형,
--    열이름2 자료형,
--    열이름3 자료형,
--);

--테이블 생성 규칙
-- 1) 테이블 이름은 문자로 시작
-- 2) 테이블 이름은 30BYTE 이하
-- 3) 같은 사용자 소유의 테이블 이름은 중복될 수 없음
-- 4) 테이블 명에 사용할 수 있는 특수문자는 $, #, _ 가능
-- 5) SQL 키워드(ex SELECT, FROM, WHERE...)는 테이블명에 사용할 수 없음

--자료형

--1.문자
--VARCHAR2(길이) : 가변 길이 문자열 데이터 저장(최대 4000BYTE)
--CHAR(길이) : 고정 길이 문자열 데이터 저장
--NVARCHAR2(길이) : 가변 길이(unicode) 데이터 저장
--      name varchar2(10) : 영어는 10자, 한글은 3자까지 입력
--      name nvarchar2(10) : 영어 10자, 한글 10자까지 입력

--2.숫자
-- NUMBER(전체자릿수,소수점이하자릿수)

--3.날짜
--DATE : 날짜, 시간 저장
--TIMESTAMP

--4.기타
--BLOB : 대용량 이진 데이터 저장
--CLOB : 대용량 텍스트 데이터 저장
--JSON : JSON 데이터 저장

create table emp_ddl(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

desc emp_ddl;

--2. 테이블 수정 : ALTER
--1) 열 추가 : ADD
alter table emp_temp2 add HP varchar2(20);

--2) 열 이름 변경 : RENAME
alter table emp_temp2 rename column hp to tel;

--3) 열 자료형(길이) 변경 : MODIFY
alter table emp_temp2 modify empno number(5);

--4) 특정 열을 삭제 : DROP
alter table emp_temp2 drop column tel;


--3. 테이블 삭제
drop table emp_rename;


-- 테이블 명 변경
rename emp_temp2 to emp_rename;

-- 테이블 데이터 전체 삭제
delete from emp_rename;
select * from emp_rename;
rollback;

-- rollback 안됨 : DDL 구문이기 때문
truncate table emp_rename;


create table member(
    id char(8),
    name varchar2(10),
    addr varchar2(50),
    nation char(4),
    email varchar2(50),
    age number(7,2)
);

drop table member;
desc member;

alter table member add BIGO varchar2(20);
alter table member modify BIGO varchar2(30);
alter table member rename column BIGO to REMARK;


-- 데이터 베이스 객체
-- 테이블, 인덱스, 뷰, 데이터 사전, 시퀀스, 시노님, 프로시저, 함수, 패키지, 트리거
-- 생성 : create, 수정 : alter, 삭제 : drop

-- 인덱스 : 더 빠른 검색을 도와줌
-- 인덱스 : 사용자가 직접 특정 테이블 열에 지정 가능
--         기본키(혹은 unique key) 를 생성하면 인덱스로 지정

-- create ndex 인덱스 이름 on 테이블명(인덱스로 사용할 열이름)

-- emp 테이블의 sal 열을 인덱스로 지정
create index IDX_EMP_SAL on EMP(sal);

-- select : 검색방식
-- full scan
-- index scan

select * from emp where empno = 7900;

-- 인덱스 삭제
drop index IDX_EMP_SAL;

-- View : 가상 테이블
-- 편리성 : select 문의 복잡도를 완화하기 위해
-- 보안성 : 테이블의 특정 열을 노출하고 싶지 않을 때

-- create[or replace] [force | noforce] view 뷰이름(열이름1, 열이름2...)
-- as (저장할 select 구문)
create view VM_EMP20
as (select empno, ename, job, deptno from emp where deptno=20);


--서브쿼리를 사용
select *
from (select empno, ename, job, deptno from emp where deptno=20);

--뷰 사용
select *
from vm_emp20;

--뷰 삭제
drop view vm_emp20;


create view VM_EMP_READ
as select empno, ename, job from emp with read only;

-- view 에 insert
insert into vm_emp20 values(8888,'KIM','SALES',20);
-- 원본 변경이 일어남
select * from emp;
--읽기 전용 뷰에서는 DML 작업 불가
insert into vm_emp_read values(8888,'KIM','SALES');

-- 인라인 뷰 : 일회성으로 만들어서 사용하는 뷰
-- rownum : 조회된 순서대로 일련번호 매김

select rownum, e.*
from emp e;

select rownum, e.*
from (select * from emp e order by sal desc) e;

-- 급여 높은 상위 세 사람 조회
select rownum, e.*
from (select * from emp e order by sal desc) e
where rownum <= 3;

-- 시퀀스 : 규칙에 따라 순번 생성
-- create sequence 시퀀스이름;(설정안하는 것들은 다 기본값으로 세팅)

--create sequence 시퀀스명
--[increment by 숫자] 기본값 1
--[start with 숫자]   기본값 1
--[maxvalue 숫자 | nomaxvalue]
--[minvalue 숫자 | nominvalue]
--[cycle | nocycle] cycle 인 경우 maxvalue에 값이 다다르면 시작값부터 다시 시작
--[cache 숫자 | nocache] 시퀀스가 생성할 번호를 미리 메모리에 할당해 놓음(기본 cache 20)

create table dept_sequence as select * from dept where 1<>1;

create sequence seq_dept_sequence
increment by 10
start with 10
maxvalue 90
minvalue 0
nocycle
cache 2;

-- 시퀀스 사용 : 시퀀스이름.currval(마지막으로 생성된 시퀀스 조회), 시퀀스이름.nextval(시퀀스 생성)
-- 부서번호 입력시 시퀀스 사용
insert into dept_sequence(deptno, dname, loc)
values(seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');

select * from dept_sequence;

--시퀀스 삭제
drop sequence seq_dept_sequence;

create sequence seq_dept_sequence
increment by 3
start with 10
maxvalue 99
minvalue 0
cycle
cache 2;

select seq_dept_sequence.currval from dual;

-- synonym(동의어) : 테이블, 뷰, 시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름을 부여하는 객체

-- emp 테이블의 별칭을 e로 지정
create synonym e for emp;

--public : 동의어를 데이터베이스 내 모든 사용자가 사용할 수 있도록 설정
--create [public] synonym e for emp;

select * from emp;
select * from e;

drop synonym e;

create table empidx as select * from emp where 1<>1;
create index idx_empidx_empno on empidx(empno);

select * from user_indexes;

create view empidx_over15k
as (select empno, ename, job, deptno, sal, comm from empidx where sal > 1500);

select * from empidx_over15k;

create table deptseq as select * from dept;

create sequence seq_dept
increment by 1
start with 1
maxvalue 99
minvalue 1
nocycle;

drop sequence deptsequence;
select * from user_sequences;

--제약조건 : 테이블의 특정 열에 지정
--         NULL 허용 / 불허용, 유일한 값, 조건식을 만족하는 데이터만 입력 가능...
--         데이터 무결성(데이터 정확성, 일관성 보장) 유지 ==> DML 작업 시 지켜야 함
--         영역 무결성, 개체 무결성, 참조 무결성
--         테이블 생성 시 제약조건 지정, or 생성 후에 alter 를 통해 추가, 변경 가능

-- 1) not null : 빈값 허용 불가


--제약조건 + 제약조건 명 지정
create table table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) constraint tblnn2_lgpwd_nn not null, --이름 지정
    tel varchar2(20)
);

insert into table_notnull(login_id, login_pwd) values('hong123','hong123');
select * from table_notnull;
select * from user_constraints;

--생성한 테이블에 제약조건 추가
--이미 삽입된 데이터도 체크 대상이 됨
alter table table_notnull modify(tel not null);
alter table table_notnull2 modify(tel constraint tblnn2_tel_nn not null);

update table_notnull
set tel = '010-1234-5678'
where login_id = 'hong123';

--제약조건 명 변경
alter table table_notnull2 rename constraint tblnn2_tel_nn to tblnn3_tel_nn;

--제약조건 명 삭제
alter table table_notnull2 drop constraint tblnn3_tel_nn;

--2) unique : 중복되지 않는 값(null 가능)
--            아이디, 전화번호

create table table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
); 
insert into table_unique(
    login_id, login_pwd, tel) values('hong123','hong123', '010-1234-5678');

-- 테이블 생성 제약조건 지정, 변경, 삭제 not null 형태와 동일함

--3) primary key(pk) : unique + not null
--primary key ==> index 자동 생성 됨

--4) 외래키 : Foreign key(fk) : 다른 테이블 간 관계를 정의하는데 사용
--           특정 테이블에서 primary key 제약조건을 지정한 열을 다른 테이블의 특정 열에서 참조

-- 사원 추가 시 부서 번호 입력을 해야 함 => dept 테이블의 deptno 만 삽임

--부모 테이블
create table dept_fk(
    deptno number(2) constraint deptfk_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13)
);
--자식 테이블
--references 참조할테이블명(참조할 열) : 외래키 지정
create table emp_fk(
    empno number(4) constraint empfk_empno_pk primary key,
    ename varchar2(10),
    job varchar2(9),
    deptno number(2) constraint empfk_deptno_fk references dept_fk(deptno));
--오류
insert into emp_fk values(1000, 'TEST', 'SALES', 10);

--외래키 제약 조건
--부모 테이블 데이터가 데이터 먼저 입력

--삭제 시
--자식 테이블데이터 먼저 삭제
--부모 테이블 데이터 삭제

--외래 키 제약조건 옵셜
--on delete cascade : 부모가 삭제되면 부모를 참조하는 자식 레코드도 같이 삭제
--on delete set null : 부모가 삭제되면 부모를 참조하는 자식 레코드 값을 null 변경

--5) check : 열에 지정할 수 있는 값의 범위 또는 패턴 지정
-- 비밀번호는 3 자리보다 커야 한다

create table table_check(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) check (length(login_pwd) > 3),
    tel varchar2(20)
);

--6) default : 기본값 지정
create table table_default (
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20)
);

insert into table_default values('TEST',NULL,'010-1234-5678');
insert into table_default(login_id, tel) values('TEST1','010-1234-5678');
select * from table_default;
