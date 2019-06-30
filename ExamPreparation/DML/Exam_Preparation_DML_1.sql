SET SQL_SAFE_UPDATES = 0;

-- 1.Problem
INSERT INTO issues (title,issue_status,repository_id,assignee_id)
SELECT concat('Critical Problem With ',f.name, '!'),
'open',
ceil((f.id * 2)/3),
cm.contributor_id
FROM files f
JOIN commits cm
ON f.commit_id = cm.id
WHERE f.id BETWEEN 46 AND 50;

-- 2.Problem
UPDATE repositories_contributors rc
JOIN (
SELECT r.id FROM repositories r
WHERE r.id NOT IN (SELECT repository_id
FROM repositories_contributors)
ORDER BY id LIMIT 1) d
SET rc.repository_id = d.id
WHERE rc.contributor_id = rc.repository_id;

-- 3.Problem
DELETE FROM repositories
WHERE id NOT IN (SELECT repository_id FROM issues);


