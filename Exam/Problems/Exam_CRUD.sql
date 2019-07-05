-- 1.Problem
INSERT INTO cards(card_number,card_status,bank_account_id)
SELECT REVERSE(c.full_name),
'Active',
c.id
FROM clients c
WHERE c.id BETWEEN 191 AND 200;

-- 2.Problem
SET SQL_SAFE_UPDATES = 0;
DELETE FROM employees 
WHERE id NOT IN (
SELECT employee_id FROM employees_clients);

-- 3.Problem
UPDATE clients
SET id = (SELECT employee_id  FROM employees_clients
GROUP BY employee_id
ORDER BY count(*) desc,employee_id LIMIT 1)
WHERE id IN (
SELECT employee_id FROM employees_clients 
WHERE employee_id = client_id
);