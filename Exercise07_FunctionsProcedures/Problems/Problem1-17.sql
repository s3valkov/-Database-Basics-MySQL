USE soft_uni;
DELIMITER $$;

-- 1.Problem
CREATE PROCEDURE `usp_get_employees_salary_above_35000`()
BEGIN
SELECT first_name, last_name
FROM employees
WHERE salary > 35000
ORDER BY first_name, last_name, employee_id ASC;

END $$;



-- 2.Problem
CREATE PROCEDURE `usp_get_employees_salary_above`(given_salary DECIMAL(19,4))
BEGIN
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.salary >= given_salary
ORDER BY e.first_name, e.last_name, e.employee_id ASC;
END $$;  

CALL `usp_get_employees_salary_above`(10000);

-- 3.Problem
CREATE PROCEDURE `usp_get_towns_starting_with`(startsWith VARCHAR(22))
BEGIN
SELECT t.`name`
FROM towns t
WHERE t.`name` LIKE concat(startsWith, '%')
ORDER BY t.`name`;
END $$;

-- 4.Problem
CREATE PROCEDURE `usp_get_employees_from_town` (town_name VARCHAR(222))
BEGIN
SELECT e.first_name, e.last_name
FROM employees e
JOIN addresses a
ON e.address_id = a.address_id
JOIN towns t
ON t.town_id = a.town_id
WHERE t.name = town_name
ORDER BY e.first_name, e.last_name;
END $$;


-- 5.Problem
CREATE  FUNCTION `ufn_get_salary_level`(input_salary DOUBLE)
RETURNS VARCHAR(10) 
BEGIN
DECLARE result VARCHAR(10);
RETURN CASE
WHEN input_salary < 30000 THEN 'Low'
WHEN input_salary >= 30000 AND input_salary <= 50000 THEN 'Average'
WHEN input_salary > 50000 THEN 'High'
END;
END $$;

-- 6.Problem
CREATE  PROCEDURE `usp_get_employees_by_salary_level`(salary_level VARCHAR(100))
BEGIN
SELECT e.first_name, e.last_name
FROM employees e
WHERE
CASE
WHEN salary < 30000 THEN 'Low'
WHEN salary >= 30000 AND salary <= 50000 THEN 'Average'
WHEN salary > 50000 THEN 'High'
END = salary_level
ORDER BY e.first_name DESC, e.last_name DESC;
END $$;

-- 7.Problem
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BIT
DETERMINISTIC
BEGIN
RETURN IF(LOWER(word) REGEXP CONCAT('^[', LOWER(set_of_letters), ']+$'), TRUE, FALSE);
END $$;

-- 8.Problem
CREATE PROCEDURE `usp_get_holders_full_name`() 
BEGIN
SELECT concat(a.first_name,' ', a.last_name) AS `full_name`
FROM account_holders a
ORDER BY full_name;
END $$;


-- 9.Problem
CREATE PROCEDURE `usp_get_holders_with_balance_higher_than`(account_value DOUBLE)
BEGIN
SELECT ah.first_name, ah.last_name
FROM account_holders ah
JOIN accounts a
ON a.account_holder_id = ah.id
GROUP BY ah.id
HAVING SUM(a.balance) > account_value
ORDER BY a.id;
END $$;

CALL usp_get_holders_with_balance_higher_than(7000);

-- 10.Problem
CREATE FUNCTION `ufn_calculate_future_value`(initial_sum DOUBLE, rate DOUBLE, years INT)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE sum_of_future_value DOUBLE;
    SET sum_of_future_value := initial_sum *( POW( (rate + 1),years ));
    RETURN sum_of_future_value;
END$$;

-- 11.Problem
CREATE PROCEDURE usp_calculate_future_value_for_account(acc_id INT, int_rate DECIMAL(12,4))
BEGIN
DECLARE fv DECIMAL(10,4);
SET fv = (SELECT balance FROM accounts WHERE id = acc_id) *( POW( (1 + int_rate), 5) );
SELECT 
a.id AS `account_id`, 
ah.first_name, ah.last_name, 
a.balance AS `current_balance`,
fv
FROM account_holders ah
JOIN accounts a
ON a.account_holder_id = ah.id
WHERE a.id = acc_id;
END $$;

CALL usp_calculate_future_value_for_account(3,0.15) ; 

-- 12.Problem
CREATE PROCEDURE `usp_deposit_money` (account_id INT, money_amount DECIMAL(12,4))
BEGIN
UPDATE accounts
SET balance = balance + ROUND(money_amount,4)
WHERE id = account_id;

	IF(money_amount <= 0) THEN
	ROLLBACK;	
	END IF;

	IF ((SELECT count(id) FROM accounts WHERE id = account_id) <>1) THEN
    ROLLBACK;
    END IF;

COMMIT;
END$$


-- 13.Problem
CREATE PROCEDURE `usp_withdraw_money` (account_id INT, money_amount DECIMAL(12,4))
BEGIN
START TRANSACTION;
UPDATE accounts a
SET balance = balance - money_amount
WHERE a.id = account_id;

	IF(money_amount < 0) THEN
	ROLLBACK;	
	END IF;

    IF((SELECT balance FROM accounts WHERE id = account_id) < money_amount) THEN
	ROLLBACK;
	END IF;

COMMIT;
END$$


-- 14.Problem
	CREATE PROCEDURE `usp_transfer_money`(from_account_id INT, to_account_id INT, amount DOUBLE)
	BEGIN
	START TRANSACTION ;
	UPDATE accounts a
	SET balance = balance + amount
	WHERE a.id = to_account_id;

	UPDATE accounts a
	SET balance = balance - amount
	WHERE a.id = from_account_id;

		IF(amount < 0) THEN
		ROLLBACK;	
		END IF;
		
		IF((SELECT balance FROM accounts WHERE id = from_account_id) < amount) THEN
		ROLLBACK;
		END IF;
		
		IF ((SELECT count(id) FROM accounts WHERE id = from_account_id) <>1) THEN
		ROLLBACK;
		END IF;
		
		IF ((SELECT count(id) FROM accounts WHERE id = to_account_id) <>1) THEN
		ROLLBACK;
		END IF;
		
		COMMIT;
	END$$
    
-- 15.Problem
CREATE TABLE logs (log_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
account_id INT(11) NOT NULL, old_sum DECIMAL(12,4) NOT NULL, new_sum DECIMAL(12,4) NOT NULL);


CREATE TRIGGER tr_update_sum AFTER UPDATE ON accounts
FOR EACH ROW
BEGIN
INSERT INTO logs (account_id, old_sum, new_sum) VALUES
(old.id, old.balance, new.balance);
END$$

-- 16.Problem 
CREATE TABLE logs (log_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
account_id INT(11) NOT NULL, old_sum DECIMAL(12,4) NOT NULL, new_sum DECIMAL(12,4) NOT NULL);

CREATE TRIGGER tr_update_sum AFTER UPDATE ON accounts
FOR EACH ROW
BEGIN
INSERT INTO logs (account_id, old_sum, new_sum) VALUES
(old.id, old.balance, new.balance);
END;

CREATE TABLE notification_emails(id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
recipient INT(11) NOT NULL, subject VARCHAR(50) NOT NULL, body TEXT NOT NULL);

CREATE TRIGGER tr_notification_on_update AFTER INSERT ON logs
FOR EACH ROW
BEGIN
INSERT INTO notification_emails(recipient, subject, body) VALUES
(new.account_id, 
CONCAT('Balance change for account: ', new.account_id),
CONCAT('On ', CURDATE(), ' your balance was changed from ', new.old_sum, ' to ', new.new_sum));
END;   