-- 1.Problem
INSERT INTO comments (content,user_id,post_id)
SELECT concat('Omg!' , u.username , '!This is so cool!'),
ceil((p.id * 3) / 2),
p.id 
FROM posts p
JOIN users u
ON p.user_id = u.id
WHERE p.id BETWEEN 1 and 10;

-- 2.Problem
UPDATE users uout
SET profile_picture_id = (SELECT IF(COUNT(uf.user_id) = 0, u.id, COUNT(uf.user_id)) FROM (SELECT * FROM users) u
LEFT JOIN users_followers uf
ON u.id = uf.user_id
WHERE uout.id = u.id
GROUP BY uf.user_id)
WHERE profile_picture_id IS NULL;

-- 3.Problem
DELETE FROM users
WHERE users.id = (SELECT u.id FROM (SELECT * FROM users u
LEFT JOIN users_followers uf
ON uf.user_id = u.id
WHERE user_id IS NULL AND follower_id IS NULL) u
WHERE users_id.u.id
);

