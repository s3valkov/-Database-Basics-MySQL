-- 0.Problem
CREATE DATABASE minions; 

-- 1.Problem
CREATE TABLE minions(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45),
`age` INT
);

CREATE TABLE towns(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45)
);

-- 2.Problem
ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_minion
FOREIGN KEY (town_id) REFERENCES towns (id);

-- 3.Problem
 INSERT INTO towns (`id`, `name`) 
 VALUES (1, 'Sofia');
 INSERT INTO towns (`id`, `name`) 
 VALUES (2, 'Plovdiv');
 INSERT INTO towns (`id`, `name`) 
 VALUES (3, 'Varna');
 
 INSERT INTO minions (`id`, `name`, `age`, `town_id`) 
VALUES (1, 'Kevin', 22, 1);
INSERT INTO minions (`id`, `name`, `age`, `town_id`) 
VALUES (2, 'Bob', 15, 3);
INSERT INTO minions (`id`, `name`, `town_id`)
 VALUES (3, 'Steward', 2);

-- 4.Problem
TRUNCATE TABLE minions;

-- 5.Problem
DROP TABLE minions;
DROP TABLE towns;

-- 6.Problem
CREATE TABLE people(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
picture VARBINARY(2),
height DECIMAL(2),	
weight DECIMAL(2),
gender CHAR(1) NOT NULL,
birthdate DATETIME NOT NULL,
biography LONGTEXT
);

INSERT INTO people (`name`, `gender`, `birthdate`) 
VALUES ('Gosho', 'm', '1998/3/09');
INSERT INTO people (`name`, `gender`, `birthdate`)
 VALUES ('Pesho', 'm', '1998/3/09');
INSERT INTO people (`name`, `gender`, `birthdate`) 
VALUES ('Mara', 'f', '1998/3/09');
INSERT INTO people (`name`, `gender`, `birthdate`) 
VALUES ('Stoq', 'f', '1998/3/09');
INSERT INTO people (`name`, `gender`, `birthdate`)
 VALUES ('Petra', 'f', '1998/3/09');

-- 7.Problem
CREATE TABLE users (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(30)  NOT NULL,
`password` VARCHAR(26) NOT NULL,
profile_picture BLOB,
last_login_time DATETIME,
is_deleted BOOLEAN
);

INSERT INTO users (`username`, `password`) VALUES ('Gosho1', '1234');
INSERT INTO users (`username`, `password`) VALUES ('Gosho2', '1234');
INSERT INTO users (`username`, `password`) VALUES ('Gosho3', '1234');
INSERT INTO users (`username`, `password`) VALUES ('Gosho4', '1234');
INSERT INTO users (`username`, `password`) VALUES ('Gosho', '1234');

-- 8.Problem
ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users PRIMARY KEY (id, username);

-- 9.Problem
ALTER TABLE users
MODIFY last_login_time DATETIME DEFAULT CURRENT_TIMESTAMP;

-- 10.Problem
ALTER TABLE users
DROP PRIMARY KEY, ADD PRIMARY KEY (id),
ADD CONSTRAINT UNIQUE (username);