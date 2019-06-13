-- 12.Problem
SELECT `name`, date_format(start, '%Y-%m-%d') as `start`
FROM games
WHERE YEAR(start) IN (2011,2012)
ORDER BY start LIMIT 50;

-- 13.Problem
SELECT `user_name`, substring(`email`,LOCATE('@', email) + 1) AS `Email Provider`
FROM users
ORDER BY `Email Provider` , user_name;

-- 14.Problem
SELECT `user_name`, `ip_address`
FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY `user_name`;

-- 15.Problem
SELECT 	`name` AS 'game',
IF(HOUR(start) >= 0 && HOUR(START) < 12, 'Morning',
IF(HOUR(start) >= 12 && HOUR(START) < 18, 'Afternoon',
IF(HOUR(start) >= 18 && HOUR(START) < 24, 'Evening',start))) AS 'Part of the day',

IF(duration <= 3, 'Extra Short', 
IF(duration > 3 && duration <= 6, 'Short',
IF(duration > 6 && duration <= 10, 'Long', 'Extra Long'))) AS 'Duration' FROM games;


-- 16.Problem
SELECT product_name, 
order_date, 
DATE_ADD(order_date, INTERVAL 3 DAY) as 'pay_due',
DATE_ADD(order_date, INTERVAL 1 MONTH) as 'deliver_due'
FROM orders;