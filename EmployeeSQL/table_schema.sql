-- Drop tables if they exist
drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists salaries;
drop table if exists employees;
drop table if exists titles;
drop table if exists departments;

-- Create tables
create table departments (
	dept_no varchar not null,
	dept_name varchar not null,
	primary key (dept_no)
);

select * from departments;

create table titles (
	title_id varchar not null,
	title varchar not null,
	primary key (title_id)
);

select * from titles;

create table employees (
	emp_no INT not null,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles (title_id),
	primary key (emp_no)
);

select * from employees;

create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);

select * from salaries;

create table dept_manager (
	dept_no varchar not null,
	emp_no int not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (dept_no, emp_no)
);

select * from dept_manager;

create table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);

select * from dept_emp;