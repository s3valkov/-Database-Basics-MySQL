USE soft_uni;

-- 13.Problem
SELECT department_id, MIN(salary) AS `minimum_salary`
FROM employees
WHERE year(hire_date) > 1999 AND department_id IN (2, 5, 7)
GROUP BY department_id
ORDER BY department_id;

-- 14.Problem
SELECT department_id, AVG(IF(department_id = 1, salary + 5000, salary)) AS `avg_salary` FROM employees
WHERE salary > 30000 AND NOT manager_id = 42
GROUP BY department_id
ORDER BY department_id;

-- 15.Problem
SELECT department_id, MAX(salary) AS `max_salary`
FROM employees
GROUP BY department_id
HAVING MAX(salary) NOT BETWEEN 30000 AND 70000
ORDER BY department_id;

-- 16.Problem
	SELECT count(salary)
	FROM employees
	WHERE manager_id IS NULL;


-- 17.Problem
SELECT t1.department_id, t1.third_highest_salary FROM(SELECT department_id, (
SELECT DISTINCT salary FROM employees e2
WHERE e1.department_id = e2.department_id
ORDER BY salary DESC LIMIT 2,1
) AS `third_highest_salary` FROM employees e1) AS t1
WHERE third_highest_salary IS NOT NULL
GROUP BY department_id
ORDER BY department_id;	

-- 18.Problem
SELECT e1.first_name,e1.last_name,e1.department_id
FROM employees e1
WHERE (SELECT AVG(e.salary)
FROM employees e
GROUP BY e.department_id
HAVING e.department_id = e1.department_id) < e1.salary
ORDER BY e1.department_id, e1.employee_id LIMIT 10;

-- 19.Problem
SELECT department_id, SUM(salary) AS total_sum
FROM employees
GROUP BY department_id
ORDER BY department_id;
