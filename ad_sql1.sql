# What is SQL, RDBMS, Database vs Table
-- SQL  (sql stands for structured Query Language used to query data from database or perform operation on database)
-- RDBMS (RDBMS stands for relational database management system . it is a structured system where storing and managing data in 
-- table format where each table have some relations )

-- table is nothing but rows and columns

# Create a simple employee database and query data
create database employee;
use employee;

/*
Write SQL to create a table employees with name, age, salary
Insert 10 rows and practice filtering (e.g., employees > 30 years old)
*/

create table emp(
name varchar(20) not null,
age int not null,
salary int not null
);

insert into emp value 
('balu',45,50000),
('giri',33,70000),
('venkat',28,80000),
('mohan',24,90000),
('kali',23,10000),
('sruthihasan',35,20000)
;

select * from emp where age > 30;

# Sorting and filtering (ORDER BY, LIMIT)
select * from emp order by salary desc limit 1 offset 1;

# Day 6: INSERT, UPDATE, DELETE
insert into emp value ('ajay',77,90000);
select * from emp;
set sql_safe_updates = 0;
update emp set salary = 1000 where name = 'ajay';
set sql_safe_updates = 1;

select * from emp;

set sql_safe_updates = 0;
delete from emp  where name = 'ajay';
set sql_safe_updates = 1;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'IT', 'Bangalore'),
(2, 'HR', 'Pune'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Mumbai'),
(5, 'Operations', 'Hyderabad');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    department_id INT,
    join_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(dept_id)
);


INSERT INTO employees (emp_id, name, age, salary, department_id, join_date) VALUES
(101, 'Ravi', 28, 55000, 1, '2020-06-10'),
(102, 'Sneha', 32, 72000, 2, '2019-04-21'),
(103, 'Arjun', 26, 50000, 3, '2021-02-11'),
(104, 'Neha', 29, 60000, 1, '2022-03-05'),
(105, 'Ajay', 31, 65000, 2, '2021-07-15'),
(106, 'Priya', 27, 48000, 3, '2020-10-12'),
(107, 'Karan', 35, 75000, 4, '2018-09-01'),
(108, 'Meena', 30, 58000, 5, '2022-11-10'),
(109, 'Vikram', 33, 80000, 1, '2017-08-18'),
(110, 'Rahul', 25, 45000, 5, '2023-01-25');

select * from employees;
select * from departments;

# GROUP BY & Aggregate Functions
-- Find the total salary per department
select dept_name,sum(salary) from employees e inner join departments d on e.department_id = d.dept_id group by dept_name;

-- Find the number of employees per department
select dept_name,count(*) from employees e inner join departments d on e.department_id = d.dept_id group by dept_name;

-- Find the minimum and maximum salary in each department
select dept_name , min(salary) as min_sal , max(salary) as max_sal 
from employees e inner join departments d on e.department_id = d.dept_id group by dept_name;

-- Find the average salary of the company
select avg(salary) from employees ;


-- Find departments having total salary less than 1,20,000.
select dept_name,sum(salary) as sal from employees e inner join 
departments d on e.department_id = d.dept_id group by dept_name having sal < 120000;

-- Find departments with average salary greater than 60,000 and employee count more than 1.
select dept_name, avg(salary) as avg_sal, count(*) no_emp from employees e inner join departments d 
on e.department_id = d.dept_id group by dept_name having avg_sal > 60000 and no_emp > 1;

-- Find departments where maximum salary < 70,000.
select dept_name,max(salary) as max_sal from employees e inner join departments d on e.department_id = d.dept_id group by dept_name
having max_sal < 70000;

-- group by
# group by used to group the rows by columns

-- having 
# having clause used to filter the aggreated records

-- where clause 
# where clause is used to  filter the records based on some condition












