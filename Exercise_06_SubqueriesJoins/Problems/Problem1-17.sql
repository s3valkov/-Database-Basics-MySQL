USE soft_uni;

-- 1.Problem
SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees e
JOIN addresses a
ON e.address_id = a.address_id
ORDER BY address_id LIMIT 5;

-- 2.Problem
SELECT first_name, last_name, t.name,  address_text
FROM employees e
JOIN addresses a
ON e.address_id = a.address_id
JOIN towns t
ON a.town_id = t.town_id
ORDER BY first_name,last_name
LIMIT 5;

-- 3.Problem
SELECT e.employee_id, e.first_name, e.last_name, d.name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE d.name = 'Sales'
ORDER BY employee_id DESC;

-- 4.Problem
SELECT e.employee_id, e.first_name, e.salary, d.name
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY e.department_id DESC
LIMIT 5;

-- 5.Problem
SELECT e.employee_id, e.first_name
FROM employees e
LEFT JOIN employees_projects p
ON   p.employee_id = e.employee_id
WHERE p.project_id IS NULL
ORDER BY e.employee_id desc
LIMIT 3;

-- 6.Problem
SELECT  e.first_name, e.last_name, e.hire_date, d.name
FROM (SELECT first_name, last_name, hire_date, department_id FROM employees
WHERE DATE(hire_date) > DATE('1999-01-01')) e
JOIN departments d 
ON e.department_id = d.department_id
WHERE d.name = 'Sales' OR d.name = 'Finance'
ORDER BY hire_date;

-- 7.Problem
SELECT e.employee_id, e.first_name, p1.name
FROM employees e
JOIN employees_projects p
ON p.employee_id = e.employee_id
JOIN projects p1
ON p1.project_id = p.project_id
WHERE DATE(p1.start_date) > DATE('2002-08-13') AND p1.end_date IS NULL
ORDER BY e.first_name, p1.name
LIMIT 5;

-- 8.Problem
SELECT e.employee_id, e.first_name, IF(year(p1.start_date) >= 2005, NULL, p1.name) AS project_name
FROM (SELECT employee_id, first_name FROM employees WHERE employee_id = 24 ) e
JOIN employees_projects p
ON p.employee_id = e.employee_id
JOIN projects p1
ON p1.project_id = p.project_id
ORDER BY p1.name; 

-- 9.Problem
SELECT e.employee_id, e.first_name, e.manager_id,  m.first_name
FROM employees e
JOIN employees m
ON m.employee_id = e.manager_id
WHERE e.manager_id IN (3,7)
ORDER BY e.first_name;

-- 10.Problem
SELECT e.employee_id, concat(e.first_name, ' ', e.last_name) AS `employee_name`,  concat(m.first_name, ' ', m.last_name) AS `manager_name`, d.name
FROM employees e
JOIN employees m
ON m.employee_id = e.manager_id
JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

-- 11.Problem
SELECT AVG(salary) AS `min_salary`
FROM employees
GROUP BY department_id
ORDER BY `min_salary` LIMIT 1;

USE geography;

-- 12.Problem
SELECT c.country_code,   m.mountain_range, peak_name, elevation
FROM peaks p
JOIN mountains m
ON m.id = p.mountain_id
JOIN mountains_countries c
ON m.id = c.mountain_id
WHERE c.country_code = 'BG' AND elevation > 2835
ORDER BY elevation DESC ;

-- 13.Problem
SELECT  country_code, count(*)  AS mountain_range 
FROM mountains_countries
WHERE country_code = 'BG' OR country_code = 'RU' OR country_code = 'US'
GROUP BY country_code
ORDER BY mountain_range DESC;

-- 14.Problem
SELECT c.country_name, r.river_name
FROM rivers r
JOIN countries_rivers cr
ON cr.river_id = r.id
RIGHT JOIN countries c
ON cr.country_code = c.country_code 
WHERE c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;

-- 15.Problem
SELECT  c1.continent_code, c1.currency_code, c1.cmax AS currency_usage 
FROM 
(
	SELECT c.continent_code, c.currency_code, count(c.currency_code) AS cmax
    FROM countries c
    GROUP BY c.continent_code, c.currency_code
HAVING cmax > 1
) c1
WHERE c1.cmax >= (
	SELECT count(currency_code) AS cmax_in 
	FROM countries
	WHERE c1.continent_code = continent_code
	GROUP BY continent_code, currency_code
	HAVING cmax_in > 1
	ORDER BY cmax_in DESC
	LIMIT 1
)
ORDER BY continent_code, currency_code;

-- 16.Problem
SELECT count(c.country_code) AS `county_count` FROM countries c
LEFT JOIN mountains_countries m
ON m.country_code = c.country_code
WHERE m.country_code IS NULL;

-- 17.Problem
SELECT c.country_name, MAX(pks.elevation) AS `highest_peak_elevation`, MAX(r.length) AS `longest_river_length` FROM countries c
LEFT JOIN mountains_countries mc
ON c.country_code = mc.country_code
LEFT JOIN peaks pks
ON pks.mountain_id = mc.mountain_id
LEFT JOIN countries_rivers cr
ON cr.country_code = c.country_code
LEFT JOIN rivers r
ON r.id = cr.river_id
GROUP BY c.country_name
ORDER BY pks.elevation DESC, r.length DESC
LIMIT 5; 