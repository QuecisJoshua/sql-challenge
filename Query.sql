CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date  DATE NOT NULL,
    first_name  VARCHAR(55) NOT NULL,
    last_name   VARCHAR(55) NOT NULL,
    gender      VARCHAR(55) NOT NULL,    
    hire_date   DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

DROP TABLE departments;

CREATE TABLE departments (
    dept_no     CHAR(4) NOT NULL,
    dept_name   VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no)
    
);


DROP TABLE dept_manager;
CREATE TABLE dept_manager (
   dept_no CHAR(4) NOT NULL,
   emp_no INT NOT NULL,
   from_date DATE NOT NULL,
   to_date DATE NOT NULL,
   PRIMARY KEY (emp_no,dept_no)
); 


DROP TABLE dept_emp;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no,dept_no)
);



DROP TABLE titles;

CREATE TABLE titles (
    emp_no      INT NOT NULL,
    title       VARCHAR(40) NOT NULL,
    from_date   DATE NOT NULL,
    to_date     DATE NOT NULL,
    PRIMARY KEY (emp_no,title, from_date)
); 



DROP TABLE salaries;

CREATE TABLE salaries (
    emp_no      INT  NOT NULL,
    salary      INT  NOT NULL,
    from_date   DATE NOT NULL,
    to_date     DATE NOT NULL,
    PRIMARY KEY (emp_no, from_date)
) ;



SELECT 
e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

 

SELECT
hire_date
FROM employees
WHERE extract(year from hire_date) = '1986'; 



SELECT
m.dept_no,
dept_name,
m.emp_no,
first_name,
last_name,
m.from_date,
m.to_date
FROM dept_manager m
LEFT JOIN departments on m.dept_no = departments.dept_no
LEFT JOIN employees on m.emp_no = employees.emp_no;



SELECT
e.emp_no, 
first_name, 
last_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_no = d.emp_no
LEFT JOIN departments
ON d.dept_no = departments.dept_no;

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select* from titles;



SELECT * FROM employees
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%');



Select
e.emp_no, 
first_name, 
last_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_no = d.emp_no
LEFT JOIN departments
ON d.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales';





Select
e.emp_no, 
first_name, 
last_name,
dept_name
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_no = d.emp_no
LEFT JOIN departments
ON d.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales'
OR departments.dept_name LIKE  'Development';





SELECT
last_name,
COUNT(last_name) AS "name_count"
from employees
GROUP BY
last_name
ORDER BY name_count DESC;
