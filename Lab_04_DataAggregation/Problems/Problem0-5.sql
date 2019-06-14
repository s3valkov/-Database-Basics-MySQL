USE soft_uni;

SELECT `department_id`, round(SUM(`salary`),2) AS total_salary
FROM employees
GROUP BY `department_id`;

SELECT `job_title`, round(sum(`salary`)) AS avg_salary
FROM employees
GROUP BY `job_title`
HAVING `avg_salary` > 50000 AND count(salary) > 10
ORDER BY `avg_salary` DESC;

USE restaurant;

-- 1.Problem
SELECT `department_id`, count(*) AS 'Number of employees'
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 2.Problem
SELECT `department_id`, ROUND(AVG(`salary`),2) AS 'Average Salary'
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 3.Problem
SELECT `department_id`, ROUND(MIN(`salary`),2) AS 'Min Salary'
FROM employees
GROUP BY department_id
HAVING `Min Salary` > 800
ORDER BY department_id;

-- 4.Problem
SELECT count(*) AS appertizers
FROM products
WHERE category_id = 2 AND price > 8;

-- 5.Problem
SELECT category_id,
ROUND(AVG(price),2) AS 'Average Price',
ROUND(MIN(price),2) AS 'Cheapese Product',
ROUND(MAX(price),2) AS 'Most Expencsive Product'
FROM products
GROUP BY category_id;
