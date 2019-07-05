DELIMITER $$;

CREATE PROCEDURE `udp_clientinfo`(full_name VARCHAR(50))
BEGIN
SELECT c.full_name, c.age, b.account_number,concat('$',b.balance) balance
FROM clients c
JOIN bank_accounts b
ON c.id = b.client_id
WHERE full_name = c.full_name;
END $$;

CALL`udp_clientinfo`('Hunter Wesgate');

-- 2.Problem
DELIMITER $$
CREATE FUNCTION udf_client_cards_count(full_name VARCHAR(30))
RETURNS INT
BEGIN 
	DECLARE e_count INT;
	SET e_count := (SELECT  count(*)
	FROM clients c	
	JOIN bank_accounts ba
	ON ba.client_id = c.id
	JOIN cards cc
	ON cc.bank_account_id = ba.id
	WHERE c.full_name = full_name
    GROUP BY c.full_name);
RETURN e_count;
END $$

SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David';


