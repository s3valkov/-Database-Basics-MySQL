-- 1.Problem
-- First
SELECT e.employee_id, concat(e.`first_name`, ' ', e.`last_name`) AS full_name,
d.department_id, d.name
FROM departments AS d
JOIN employees AS e
ON e.employee_id = d.manager_id
ORDER BY employee_id
LIMIT 5;

-- Second
SELECT e.employee_id, concat(e.`first_name`, ' ', e.`last_name`) AS full_name,
d.department_id, d.name
FROM employees AS e
JOIN departments AS d
ON d.manager_id = e.employee_id
ORDER BY employee_id
LIMIT 5;

-- 2.Problem
SELECT t.town_id, t.name, a.address_text
FROM towns t
JOIN addresses a
ON t.town_id = a.town_id
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY town_id, address_id;

-- 3.Problem
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE manager_id IS NULL;

-- 4.Problem
SELECT count(*) AS count 
FROM employees
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
);