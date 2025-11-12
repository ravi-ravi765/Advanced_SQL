# Show all employees with their department names (INNER JOIN).
select * from employees;
select * from departments;

select a.name,b.dept_name from employees a inner join departments b on a.department_id = b.dept_id;

# Show all employees, even those with no department assigned (LEFT JOIN).
select a.name ,b.dept_name from employees a left join departments b on a.department_id = b.dept_id;

# Show all departments and any employees in them (RIGHT JOIN).
select a.name, b.dept_name from employees a right join departments b on a.department_id = b.dept_id;

# Show all employees and departments (FULL JOIN using UNION).
select a.name, b.dept_name from employees a left join departments b on a.department_id = b.dept_id
union
select a.name, b.dept_name from employees a right join departments b on a.department_id = b.dept_id;

SELECT name
FROM world
WHERE (LENGTH(LOWER(name)) - LENGTH(REPLACE(LOWER(name), 'a', ''))) >= 3;

-- what is subquery? 
# sub query is the query inside a query and it will execute first
# we used from , where, select to concure the subqueries

# Find all employees whose salary is greater than the company’s average salary.
select name from employees where salary >  (select  avg(salary) from employees);

# Find employees working in departments that exist in the departments table
select name from employees where department_id in (
select dept_id from departments);

# Find departments having total salary less than 1,20,000.
select dept_name from departments where dept_id in (
select department_id from (
select department_id,sum(salary) as total_sal from employees group by department_id) as total_salary where total_sal < 120000);


# Find employees whose salary is greater than the average salary of all employees.
select name from employees where salary > (
select avg(salary) from employees);

# Find employees whose department’s average salary is greater than 60,000.

select department_id,avg_sal from (
select department_id,avg(salary) avg_sal from employees group by department_id) val where avg_sal > 60000;

# Find departments where total salary is greater than the average total salary of all departments.

select dept_name from departments where dept_id in (
select department_id from (
select department_id,sum(salary) total_sal from employees group by department_id ) val where total_sal > ( select avg(salary) from employees ));

# Find employees earning more than the average salary.
select name,salary from employees where salary > (
select avg(salary) from employees);

# Find employees whose salary is equal to the maximum salary in the company.
select name,salary from employees where salary = (
select max(salary) from employees);

# Find departments where the minimum salary is greater than 50,000.
select department_id,min_sal from (
select department_id,min(salary) min_sal from employees group by department_id) t where min_sal > 50000;


# Find employees who earn more than the average salary of their own department.
select name,department_id,salary from employees e where salary >
(select avg(salary) from employees where department_id = e.department_id);

# Find departments that have more employees than the average number of employees per department.
select department_id from employees group by department_id having count(*)  > (
select avg(emp) from (
select count(*) emp from employees group by department_id) t) ;




















