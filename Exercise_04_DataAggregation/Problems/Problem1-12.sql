SELECT * FROM gringotts.wizzard_deposits;

-- 2.Problem
SELECT MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM wizzard_deposits
GROUP BY 'longest_magic_wand';

-- 3.Problem
SELECT deposit_group, MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM wizzard_deposits
GROUP BY  `deposit_group`
ORDER BY longest_magic_wand,deposit_group;

-- 4.Problem
SELECT deposit_group
FROM wizzard_deposits
GROUP BY `deposit_group`
ORDER BY AVG(`magic_wand_size`) ASC LIMIT 1;

-- 5.Problem
SELECT deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM wizzard_deposits
GROUP BY `deposit_group`
ORDER BY total_sum;

-- 6.Problem
SELECT deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY deposit_group;

-- 7.Problem
SELECT deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY `deposit_group`
HAVING total_sum < 150000
ORDER BY total_sum DESC;

-- 8.Problem
	SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) AS 'min_deposit_charge'
	FROM wizzard_deposits
	GROUP BY `deposit_group`, `magic_wand_creator`
	ORDER BY `magic_wand_creator`, `deposit_group`;
    
-- 9.Problem
SELECT '[0-10]' AS `age_group`, COUNT(id) AS `wizard_count` FROM wizzard_deposits
WHERE age >= 0 && age <= 10
GROUP BY `age_group`;
SELECT '[11-20]' AS `age_group`, COUNT(id) AS `wizard_count` FROM wizzard_deposits
WHERE age >= 11 && age <= 20
GROUP BY `age_group`;
SELECT '[21-30]' AS `age_group`, COUNT(id) AS `wizard_count` FROM wizzard_deposits
WHERE age >= 21 && age <= 30
GROUP BY `age_group`;
SELECT '[31-40]' AS `age_group`, COUNT(id) AS `wizard_count` FROM wizzard_deposits
WHERE age >= 31 && age <= 40
GROUP BY `age_group`;
SELECT '[41-50]' AS `age_group`, COUNT(id) AS `wizard_count` FROM wizzard_deposits
WHERE age >= 41 && age <= 50
GROUP BY `age_group`;
SELECT '[51-60]' AS `age_group`, COUNT(id) AS `wizard_count` FROM wizzard_deposits
WHERE age >= 51 && age <= 60
GROUP BY `age_group`;
SELECT '[61+]' AS `age_group`, COUNT(id) AS `wizard_count` FROM wizzard_deposits
WHERE age >= 61
GROUP BY `age_group`;

-- 10.Problem
SELECT left(first_name,1) AS 'first_letter',
FROM wizzard_deposits
WHERE deposit_group = 'Troll Chest'
GROUP  BY first_letter
ORDER BY first_letter;

-- 11.Problem
SELECT deposit_group, is_deposit_expired, AVG(deposit_interest) AS 'average_interest'
FROM wizzard_deposits
WHERE deposit_start_date > '1985-01-01'
GROUP BY deposit_group, is_deposit_expired
ORDER BY deposit_group DESC, is_deposit_expired;

-- 12.Problem
SELECT sum(a.deposit_amount - b.deposit_amount) AS 'sum_difference'
FROM wizzard_deposits AS `a`, wizzard_deposits AS `b`
WHERE b.id = a.id + 1;