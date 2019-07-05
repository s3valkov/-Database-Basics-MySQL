 -- 5.Problem
 SELECT id, full_name FROM clients
 ORDER BY id;
 
 -- 6.Problem
 SELECT id, concat(first_name, " " ,last_name),concat('$', salary), started_on
 FROM employees
 WHERE salary >= 10000 AND YEAR(started_on) > 2017
 ORDER BY salary DESC,id;
 
 -- 7.Problem
 SELECT c.id, concat(c.card_number, ' : ', cl.full_name )
 FROM cards c
 JOIN bank_accounts ba
 ON ba.id = c.bank_account_id
 JOIN clients cl
 ON cl.id = ba.client_id
 ORDER BY c.id DESC;
 
 -- 8.Problem
SELECT concat(e.first_name, ' ', e.last_name) full_name,
e.started_on,
count(*)  count_of_clients FROM employees_clients ec
JOIN employees e
ON e.id = employee_id
GROUP BY employee_id
ORDER BY count_of_clients DESC, ec.employee_id 
LIMIT 5;
 
 -- 9.Problem
 SELECT   b.name , count(*)
 FROM branches b
 JOIN employees e
 ON b.id = e.branch_id
 JOIN employees_clients ec
 ON e.id = ec.employee_id
JOIN clients c
ON c.id = client_id
JOIN bank_accounts ba
ON ba.client_id = c.id
JOIN cards ca
ON ca.bank_account_id = ba.id
GROUP BY b.name
ORDER BY count(*) DESC,b.name;
 