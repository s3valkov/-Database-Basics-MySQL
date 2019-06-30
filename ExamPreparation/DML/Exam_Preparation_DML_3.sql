INSERT INTO travel_cards (card_number,job_during_journey,colonist_id,journey_id)
SELECT IF(YEAR(c.birth_date) > 1979,
concat(YEAR(c.birth_date),day(c.birth_date) ,substring(c.ucn,1,4) ),
concat(YEAR(c.birth_date), month(c.birth_date), substring(c.ucn,-1,4))
),
CASE
WHEN c.id MOD 2 = 0 THEN 'Pilot' 
WHEN c.id MOD 3 = 0 THEN 'Cook' 
ELSE 'Engineer'
END,
c.id,
substring(c.ucn,1,1)
FROM colonists c
WHERE id BETWEEN 96 AND 100;