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

