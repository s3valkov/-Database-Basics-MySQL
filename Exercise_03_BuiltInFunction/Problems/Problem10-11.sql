-- 10.Problem
SELECT country_name, iso_code
FROM countries
WHERE lower(country_name) LIKE '%a%a%a%'
ORDER BY iso_code; 

-- 11.Problem
SELECT `peak_name`, `river_name`, lower(concat(`peak_name`, SUBSTRING(`river_name`,2))) AS mix
FROM peaks,rivers
WHERE right(peak_name,1) = lower(left(river_name,1))
ORDER BY mix;



 