select * 
from employees;

select first_name, last_name, job_id
from employees;

select ename, sal
from emp
order by sal desc;

select last_name
from employees
where employee_id=176;

select last_name, salary
from employees
where salary>=12000;

select last_name, salary
from employees
where salary between 5000 and 12000;

select *
from employees;

desc employees;

select last_name, department_id
from employees
where department_id in(20,50)
order by last_name, department_id;

select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct;

select last_name, employee_id, hire_date
from employees
where hire_date between '2008-02-20' and '2008-05-01'
order by hire_date desc;


select last_name, hire_date
from employees
where hire_date between '2004-01-01' and '2004-12-31'
order by hire_date;


select last_name, salary 
from employees
where department_id in(20,50) and salary between 5000 and 12000
order by salary;


desc employees;

select employee_id, last_name
from employees
where last_name like '%u%';

select employee_id, hire_date
from employees
where hire_date like '04%';

select last_name, job_id
from employees
where manager_id is null;

select distinct department_id
from employees
where job_id='ST_CLERK' and department_id is not null;

select employee_id, first_name, job_id, salary*commission_pct commission
from employees
where commission_pct is not null;

select employee_id, first_name, hire_date, replace(job_id,'IT_PROG','프로그래머')
from employees
where department_id in (60,70,80,90);

select employee_id, first_name || last_name, department_id,job_id
from employees
where job_id in ('AD_PRES', 'PU_CLERK');

select last_name, salary,
    decode(trunc(salary/2000,0),0,0.00,1,0.09,2,0.20,3,0.30,4,0.40,5,0.42,6,0.44,0.45) tax_rate
from employees
where department_id = 80;

select max(salary) - min(salary)
from employees;
select *
from employees;
select count(distinct manager_id)
from employees;


