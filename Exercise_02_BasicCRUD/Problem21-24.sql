-- 21.Problem
SELECT peak_name 
FROM peaks
ORDER BY peak_name;

-- 22.Problem
SELECT country_name, population
FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC; 

-- 23.Problem
SELECT country_name, country_code, IF(currency_code = 'EUR', 'EURO', 'NOT EURO')
FROM countries
ORDER BY country_name;

-- 24.Problem
SELECT `name` FROM characters
ORDER BY name;