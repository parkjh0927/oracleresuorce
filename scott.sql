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