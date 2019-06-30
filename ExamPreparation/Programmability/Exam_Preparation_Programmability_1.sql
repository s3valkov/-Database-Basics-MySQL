DELIMITER $$

-- 1.Problem
CREATE PROCEDURE `udp_commit`(username VARCHAR(45),password VARCHAR(45), message VARCHAR(55),issue_id INT)
BEGIN

DECLARE repo_id INT;
DECLARE contributor_id INT;

IF(SELECT u.username FROM users u WHERE u.username = username) IS NULL
THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'No such user!' ; 
END IF;

IF(SELECT u.username FROM users u 
WHERE u.username = username AND u.password = password) IS NULL
THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Password is incorrect';
END IF;

IF(SELECT i.id FROM issues i WHERE i.id = issue_id) IS NULL
THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'The issue does not exist!';
END IF;

SET repo_id = (SELECT repository_id FROM issues i WHERE i.id = issue_id);
SET contributor_id = (SELECT u.id FROM users u WHERE u.username = username AND u.password = password);

INSERT INTO commits (message, issue_id, repository_id, contributor_id)
VALUES (message, issue_id, repo_id,contributor_id);
END $$

-- 2.Problem
CREATE PROCEDURE `udp_findbyextension`(extension VARCHAR(45))
BEGIN
SELECT f.id, f.name, concat(f.size,'KB') FROM files f
WHERE f.name LIKE concat('%.',extension);
END$$

CALL `udp_findbyextension1`('html');