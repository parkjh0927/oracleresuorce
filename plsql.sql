-- PL/SQL : SQL 만으로는 구현이 어렵거나 구현 불가능한 작업을 수행하기 위해 오라클에서 제공하는 프로그래밍 언어

-- 실행 결과를 화면에 출력
SET SERVEROUTPUT on;

-- 블록 : DECLEAR ~ BEGIN ~ END
BEGIN
    dbms_output.put_line('Hello PL/SQL');
END;
/

-- 변수 선언
DECLARE
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('V_ENAME : ' || v_ename);
    dbms_output.put_line('V_EMPNO : ' || v_empno);
END;
/


-- 상수 선언
DECLARE
    v_tax CONSTANT NUMBER(4) := 7788;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/

-- 변수 + DEFAULT(기본값)
DECLARE
    v_tax NUMBER(4) DEFAULT 10;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/

-- 변수 + NOT NULL
DECLARE
    v_tax NUMBER(4) NOT NULL;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/

-- 변수 + NOT NULL + DEFAULT
DECLARE
    v_tax NUMBER(4) NOT NULL DEFAULT 10;
BEGIN
    dbms_output.put_line('V_TAX : ' || v_tax);
END;
/

-- 변수와 상수의 자료형
-- 스칼라 : 오라클이 사용하는 타입(NUMBER, CHAR, DATE...)
-- 참조형 : 오라클 데이터 베이스에 존재하는 특정 테이블의 열의 자료형이나 하나의 행 구조를 참조하는 자료형
--  1) 변수이름 테이블명.열이름%TYPE : 특정 테이블에 속한 열과 괕은 크기의 자료형을 사용
--  2) 변수이름 테이블명%ROWTYPE : 특정 테이블에 속한 행구조 전체 참조
DECLARE
    v_deptno dept.deptno%TYPE := 50;
BEGIN
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
END;
/

DECLARE
    -- V_DEPT_ROW 변수가 DEPT 테이블의 한 행의 구조를 참조
    v_dept_row dept%rowtype := 50;
BEGIN
    SELECT
        deptno,
        dname,
        loc
    INTO v_dept_row
    FROM
        dept
    WHERE
        deptno = 40;

    dbms_output.put_line('V_DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('V_DEPTNO : ' || v_dept_row.dname);
    dbms_output.put_line('V_DEPTNO : ' || v_dept_row.loc);
END;
/

-- 조건문 : IF, IF~THEN~END IF,

DECLARE
    v_number NUMBER := 15;
BEGIN
    -- V_NUMBER 홀수, 짝수 구별
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('V_NUMBER 는 홀수');
    ELSE
        dbms_output.put_line('V_NUMBER 는 짝수');
    END IF;
END;
/
-- 학점 출력

DECLARE
    v_number NUMBER := 87;
BEGIN
    IF v_number >= 90 THEN
        dbms_output.put_line('A 학점');
    ELSIF v_number >= 80 THEN
        dbms_output.put_line('B 학점');
    ELSIF v_number >= 70 THEN
        dbms_output.put_line('C 학점');
    ELSIF v_number >= 60 THEN
        dbms_output.put_line('D 학점');
    ELSE
        dbms_output.put_line('E 학점');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 87;
BEGIN
    CASE trunc(v_number / 10)
        WHEN 10 THEN
            dbms_output.put_line('A 학점');
        WHEN 9 THEN
            dbms_output.put_line('B 학점');
        WHEN 8 THEN
            dbms_output.put_line('C 학점');
        WHEN 7 THEN
            dbms_output.put_line('D 학점');
        ELSE
            dbms_output.put_line('E 학점');
    END CASE;
END;
/

-- 반복문
-- LOOP ~ END LOOP, WHILE LOOP, FOR LOOP, Cusor FOR LOOP

DECLARE
    v_num NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('V_NUM : ' || v_num);
        v_num := v_num + 1;
        EXIT WHEN v_num > 4;
    END LOOP;
END;
/

DECLARE
    v_num NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('V_NUM : ' || v_num);
        v_num := v_num + 1;
        EXIT WHEN v_num > 4;
    END LOOP;
END;
/

DECLARE
    v_num NUMBER := 0;
BEGIN
    WHILE v_num < 4 LOOP
        dbms_output.put_line('V_NUM : ' || v_num);
        v_num := v_num + 1;
    END LOOP;
END;
/

BEGIN
    FOR i IN REVERSE 0..4 LOOP
        dbms_output.put_line('i : ' || i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 0..10 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        dbms_output.put_line('i : ' || i);
    END LOOP;
END;
/


-- 커서 : SELECT 문 또는 데이터 조작어 같은 SQL 문을 실행했을 때
--       해당 SQL 문을 처리하는 정보를 저장한 메모리 공간(포인터)

-- 명시적 커서
-- 1) 커서 선언 2) 커서 열기 3) 커서에서 얻어온 데이터 사용 4) 커서 닫기

-- 결과가 단일행 일 때
DECLARE
    -- V_DEPT_ROW 변수가 DEPT 테이블의 한 행의 구조를 참조
    v_dept_row dept%rowtype;
    
    -- 커서 선언
    CURSOR c1 IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept
    WHERE
        deptno = 40;

BEGIN
    -- 커서 열기
    OPEN c1;
    --커서에서 얻어온 데이터 사용
    FETCH c1 INTO v_dept_row;
    dbms_output.put_line('V_DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('V_DEPTNO : ' || v_dept_row.dname);
    dbms_output.put_line('V_DEPTNO : ' || v_dept_row.loc);
    --커서 닫기
    CLOSE c1;
END;
/

-- 결과가 여러행 일 때
DECLARE
    -- V_DEPT_ROW 변수가 DEPT 테이블의 한 행의 구조를 참조
    v_dept_row dept%rowtype;
    
    -- 커서 선언
    CURSOR c1 IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept;

BEGIN
    -- 커서 열기
    OPEN c1;
    LOOP 
    --커서에서 얻어온 데이터 사용
        FETCH c1 INTO v_dept_row;
        -- 루프 탈출 : 커서이름%NOTFOUND => 수행된 FETCH 문을 통해 추출된 행이 있으면 FALSE, 없으면 TRUE 반환
        EXIT WHEN c1%notfound;
        dbms_output.put_line('V_DEPTNO : ' || v_dept_row.deptno);
        dbms_output.put_line('V_DEPTNO : ' || v_dept_row.dname);
        dbms_output.put_line('V_DEPTNO : ' || v_dept_row.loc);
    END LOOP;
    --커서 닫기
    CLOSE c1;
END;
/


-- for loop + 커서 : open, fetch, close 자동
DECLARE
    -- 커서 선언
    CURSOR c1 IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept;

BEGIN
    FOR c1_rec IN c1 LOOP
        dbms_output.put_line('DEPTNO : '
                             || c1_rec.deptno
                             || 'DEPTNO : '
                             || c1_rec.dname
                             || 'DEPTNO : '
                             || c1_rec.loc);
    END LOOP;
END;
/


-- 커서 + 파라미터
DECLARE
    -- V_DEPT_ROW 변수가 DEPT 테이블의 한 행의 구조를 참조
    v_dept_row dept%rowtype;
    
    -- 커서 선언
    CURSOR c1 (
        p_deptno dept.deptno%TYPE
    ) IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept
    WHERE
        deptno = p_deptno;

BEGIN
    -- 커서 열기
    OPEN c1(10);
    LOOP 
    --커서에서 얻어온 데이터 사용
        FETCH c1 INTO v_dept_row;
        -- 루프 탈출 : 커서이름%NOTFOUND => 수행된 FETCH 문을 통해 추출된 행이 있으면 FALSE, 없으면 TRUE 반환
        EXIT WHEN c1%notfound;
        dbms_output.put_line('10번 부서 DEPTNO : '
                             || v_dept_row.deptno
                             || 'V_DEPTNO : '
                             || v_dept_row.dname
                             || 'V_DEPTNO : '
                             || v_dept_row.loc);

    END LOOP;
    --커서 닫기
    CLOSE c1;
END;
/

-- 커서 + 파라미터 입력받기
DECLARE
    --사용자가 입력한 부서 번호를 저장하는 변수
    v_deptno dept.deptno%TYPE;

    -- 커서 선언
    CURSOR c1 (
        p_deptno dept.deptno%TYPE
    ) IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept
    WHERE
        deptno = p_deptno;

BEGIN

    -- 사용자 입력 : &변수
    v_deptno := &input_deptno;
    FOR c1_rec IN c1(v_deptno) LOOP
        dbms_output.put_line('DEPTNO : '
                             || c1_rec.deptno
                             || ' DNAME : '
                             || c1_rec.dname
                             || ' LOC : '
                             || c1_rec.loc);
    END LOOP;

END;
/

-- 묵시적 커서 : 별다른 선언 없이 SQL 문 사용
--             여러 행의 결과를 가지는 커서는 명시적 커서로만 사용 함

-- SQL%notfound : 묵시적 커서 안에 추출된 행이 있으면 false, 없으면 true 반환
--                DMl 명령어로 영향을 받는 행이 없을 경우네도 true

-- sql%found : 묵시적 커서 안에 추출된 행이 있으면 true, 없으면 false 반환
--             영향을 받는 행이 있다면 true

-- sql%rowcount : 묵시적 커서에 현재까지 추출한 행 수 또는 DML 명령어로 영향받는 행 수 반환
-- SQL%isopen : 묵시적 커서는 자동으로 sql 문을 실행한 후 close 되므로 이 속성은 항상 false 반환

BEGIN
    UPDATE dept_temp
    SET
        dname = 'DATABASE'
    WHERE
        deptno = 50;

    dbms_output.put_line('갱신된 행의 수 : ' || SQL%rowcount);
    IF ( SQL%found ) THEN
        dbms_output.put_line('갱신 대상 행 존재 여부 : TRUE');
    ELSE
        dbms_output.put_line('갱신 대상 행 존재 여부 : FALSE');
    END IF;

    IF ( SQL%isopen ) THEN
        dbms_output.put_line('커서의 open 여부 : TRUE');
    ELSE
        dbms_output.put_line('커서의 open 여부 : FALSE');
    END IF;

END;
/

-- 예외 처리
DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT
        dname
    INTO v_wrong
    FROM
        dept
    WHERE
        deptno = 10;

EXCEPTION
    WHEN value_error THEN
        dbms_output.put_line('예외 처리 : 수치 또는 값 오류발생');
END;
/

DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT
        dname
    INTO v_wrong
    FROM
        dept
    WHERE
        deptno = 10;
    dbms_output.put_line('예외 발생 시 다음 문장은 실행되지 않음');
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('예외 처리 : 요구보다 많은 행 추출 오류 발생');
    WHEN value_error THEN
        dbms_output.put_line('예외 처리 : 수치 또는 값 오류발생');
    WHEN others THEN
        dbms_output.put_line('예외 처리 : 사전 정의 외 오류발생');
END;
/



DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT
        dname
    INTO v_wrong
    FROM
        dept
    WHERE
        deptno = 10;
    dbms_output.put_line('예외 발생 시 다음 문장은 실행되지 않음');
EXCEPTION
    WHEN others THEN
        dbms_output.put_line('예외 처리 : 사전 정의 외 오류발생');
        dbms_output.put_line('SQLCODE : ' || to_char(SQLCODE));
        dbms_output.put_line('SQLERRM : ' || sqlerrm);
END;
/

-- 명시적 커서를 사용하여 EMP 테이블의 전체 데이터를 조회한 후 데이터 출력
-- FOR LOOP 사용
declare
    cursor c1 is
    select * from emp;
begin
    for c1_rec in c1 loop
        dbms_output.put_line('EMPNO : ' || c1_rec.empno || ' ENAME : ' || c1_rec.ename || ' JOB : ' || c1_rec.job);
    end loop;
end;
/

-- (저장) 프로시저 : 특정 처리 작업을 수행하는 데 사용(다른 응용 프로그램에서 호출 가능)

--create [or replace] procedure 프로시저명
--is | as
--begin
--      실행부
--EXCEPTION
--      예외부
--END;


create or replace procedure pro_noparam
is
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('V_ENAME : ' || v_ename);
    dbms_output.put_line('V_EMPNO : ' || v_empno);
END;
/

-- 실행
execute pro_noparam;

-- 블록 안에서 실행
begin
    pro_noparam;
end;
/

-- 프로시저 삭제
drop procedure pro_noparam;

-- 파라미터 프로시저
-- in(default) : 프로시저 호출 시 값을 입력받음
-- out : 프로시저 호출할 때 값 반환
-- in out : 호출할 때 값을 입력 받은 후 실행 결과 값 반환
create or replace procedure pro_param(param1 in number, param2 number, param3 number :=3, param4 number default 4)
is
    
BEGIN

    dbms_output.put_line('param1 : ' || param1);
    dbms_output.put_line('param2 : ' || param2);
    dbms_output.put_line('param3 : ' || param3);
    dbms_output.put_line('param4 : ' || param4);
END;
/

execute pro_param(1,2,8,9);

execute pro_param(1,2);

create or replace procedure pro_param_out(in_empno in emp.empno%type, out_ename out emp.ename%type, out_sal out emp.sal%type)
is
   
BEGIN
    select ename, sal into out_ename, out_sal
    from emp
    where empno = in_empno;
END;
/

--DECLARE
--    v_ename emp.ename%type;
--    v_sal emp.sal%type;
--BEGIN
--    pro_param_out(7788,v_ename, v_sal);
--    dbms_output.put_line('V_ENAME : ' || v_ename);
--    dbms_output.put_line('V_EMPNO : ' || v_sal);
--END;
--/


-- 트리거 : 데이터베이스 안의 특정 상황이나 동작, 즉 이벤트가 발생할 경우 자동으로 실행되는 기능 정의
-- 회원테이블에서 회원이 삭제가 되면 해당 회원을 다른 테이블로 이동

--create [or replace] trigger 트리거이름
--before | after
--insert | update | delete on 테이블 명
--for each row when 조건식
--enable | disable
--
--declare
--    선언부
--begin
--    실행부
--exception
--    예외부
--end;

create table emp_trg as select * from emp;

-- emp_trg 테이블에 dml 명령어 사용 시 주말일 경우는 dml 명령 실행 취소

-- log 기록 트리거

-- 로그 기록 테이블
create table emp_trg_log(
    tablename varchar2(10),
    dml_type varchar2(10),
    empno number(4),
    user_name varchar2(30),
    change_date date
);

create or replace trigger trg_emp_nodml_weekend
after
insert or update or delete on emp_trg
for each row
begin
    if to_char(sysdate, 'DY') in ('토','일') then
        if inserting then
            insert into emp_trg_log
            values ('EMP_TRG', 'INSERT', :new.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
        elsif updating then
            insert into emp_trg_log
            values ('EMP_TRG', 'INSERT', :new.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
        elsif deleting then
             insert into emp_trg_log
            values ('EMP_TRG', 'INSERT', :new.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
        else
            insert into emp_trg_log
            values ('EMP_TRG', 'INSERT', :new.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
        end if;
    end if;
end;
/

update emp_trg set sal = 8000 where empno = 7369;

