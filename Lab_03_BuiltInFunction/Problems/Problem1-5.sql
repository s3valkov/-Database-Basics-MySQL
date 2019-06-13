-- 1.Problem
SELECT `title` FROM books
WHERE `title` LIKE 'The%'
ORDER BY id;

SELECT title FROM books WHERE
SUBSTRING(title, 1, 3) = "The";

-- 2.Problem
SELECT  REPLACE (`title`,'The', '***') AS title FROM books
WHERE title LIKE 'The%';

SELECT LENGTH(`title`) AS chars FROM books
ORDER BY chars DESC;

-- 3.Problem
SELECT ROUND(SUM(`cost`), 2) AS Total_cost FROM books;

-- 4.Problem
SELECT first_name, last_name AS full_name,
TIMESTAMPDIFF(day,`born`, `died`) AS `Days Lived`
FROM authors; 

-- 5.Problem
SELECT title FROM books
WHERE title LIKE 'Harry Potter%'; 