-- 1.Problem
SELECT * FROM departments;

-- 2.Problem
SELECT `name` FROM departments;

-- 3.Problem
SELECT first_name, last_name, salary 
FROM employees
ORDER BY employee_id;

-- 4.Problem
SELECT first_name, middle_name, last_name
FROM employees
ORDER BY employee_id;

-- 5.Problem
SELECT concat(first_name, '.', last_name, '@softuni.bg') AS full_email_address
FROM employees;

-- 6.Problem
SELECT DISTINCT salary 
FROM employees;

-- 7.Problem
SELECT * FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id;

-- 8.Problem
SELECT first_name, last_name, job_title
FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;

-- 9.Problem
SELECT concat_ws(' ', first_name, middle_name, last_name) AS 'Full Name'
FROM employees
WHERE SALARY IN (25000,14000,12500,23600);

-- 10.Problem
SELECT first_name, last_name FROM employees
WHERE manager_id IS NULL;

-- 11.Problem
SELECT first_name, last_name, salary
FROM employees
WHERE salary >= 50000
ORDER BY salary;

-- 12.Problem
SELECT first_name,last_name
FROM employees
ORDER BY salary DESC LIMIT 5;

-- 13.Problem
SELECT first_name, last_name
FROM employees
WHERE  NOT department_id = 4;

-- 14.Problem
SELECT * FROM employees
ORDER BY salary DESC, first_name, last_name DESC, middle_name, employee_id;

-- 15.Problem
CREATE VIEW `v_employees_salaries` AS
SELECT first_name,last_name, salary FROM employees;

SELECT * FROM v_employees_salaries;

-- 16.Problem
CREATE VIEW `v_employees_job_titles` AS
SELECT concat_ws(' ', first_name, middle_name, last_name) AS full_name, job_title
FROM employees;

SELECT * FROM v_employees_job_titles;

-- 17.Problem
SELECT DISTINCT job_title
FROM employees
ORDER BY job_title; 

-- 18.Problem
SELECT * FROM projects
ORDER BY start_date LIMIT 10;

-- 19.Problem
SELECT first_name, last_name, hire_date 
FROM employees
ORDER BY hire_date DESC LIMIT 7;

-- 20.Problem
UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN (1, 2, 4, 11) AND employee_id > 0;

SELECT salary FROM employees;



