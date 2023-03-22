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