-- 1.Problem
SELECT `first_name`, `last_name` 
FROM employees
WHERE lower(`first_name`) LIKE 'sa%'
ORDER BY employee_id;

-- 2.Problem
SELECT `first_name`, `last_name`
FROM employees
WHERE lower(last_name) LIKE '%ei%'
ORDER BY employee_id;

-- 3.Problem
SELECT `first_name`
FROM employees
WHERE department_id IN(3,10) AND EXTRACT(YEAR FROM hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;

-- 4.Problem
SELECT first_name, last_name
FROM employees
WHERE  lower(job_title) NOT LIKE '%engineer%'
ORDER BY employee_id;

-- 5.Problem
SELECT `name` 
FROM towns
WHERE char_length(`name`) IN (5,6)
ORDER BY `name`;

-- 6.Problem
	SELECT * FROM towns
	WHERE LEFT(`name`, 1) IN ('M','K','E','B')
	ORDER BY `name`;

-- 7.Problem
SELECT * FROM towns
WHERE LEFT(`name`, 1)  NOT IN ('R','B','D')
ORDER BY `name`;

-- 8.Problem
CREATE VIEW  `v_employees_hired_after_2000` AS
SELECT first_name, last_name FROM employees
WHERE year(hire_date) > 2000;

SELECT * FROM v_employees_hired_after_2000 ;

-- 9.Problem
SELECT first_name, last_name 
FROM employees
WHERE char_length(last_name) = 5;

