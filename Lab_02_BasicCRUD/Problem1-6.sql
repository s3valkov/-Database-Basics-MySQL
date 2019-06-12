-- 1.Problem
SELECT id, first_name, last_name, job_title
FROM employees
ORDER BY id;

-- 2.Problem
SELECT id, concat(first_name, ' ', last_name) AS full_name, job_title, salary
FROM employees
WHERE salary >= 1000
ORDER BY id;

-- 3.Problem
UPDATE employees
SET salary = salary * 1.1
WHERE job_title = 'Therapist';

SELECT salary FROM employees
ORDER BY salary ASC;

-- 4.Problem
SELECT * FROM employees
ORDER BY salary DESC LIMIT 1;

-- 5.Problem
SELECT * FROM employees
WHERE department_id = 4 AND salary >= 1600
ORDER BY id;

-- 6.Problem
	DELETE FROM employees
	WHERE department_id IN (1,2);

	SELECT * FROM employees
	ORDER BY id; 