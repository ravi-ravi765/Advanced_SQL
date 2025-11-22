use employee;
select * from emp;

-- Write SQL to find the 2nd highest salary in each department
select salary as second_h_salary from emp order by salary desc limit 1 offset 1;
select max(salary) as s_high from emp where salary < (
select max(salary) from emp);
