USE camp;

-- 1.Problem
CREATE TABLE mountains(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(230) NOT NULL	
);

CREATE TABLE peaks(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
mountain_id INT,
CONSTRAINT fk_mountain_id FOREIGN KEY (mountain_id) 
REFERENCES mountains(id)
);

-- 2.Problem
SELECT v.driver_id, v.vehicle_type, 
concat(`first_name`, ' ', last_name) AS 'driver_name'
FROM campers c
JOIN vehicles v
ON c.id = v.driver_id;

-- 3.Problem
SELECT r.starting_point, r.end_point, r.leader_id,
concat(c.first_name, ' ', last_name) AS leader_name
FROM routes r
JOIN campers c
ON r.leader_id = c.id;

-- 4.Problem
DROP TABLE mountains, peaks;

CREATE TABLE mountains(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(230) NOT NULL	
);

CREATE TABLE peaks(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
mountain_id INT,
CONSTRAINT fk_mountain_id FOREIGN KEY (mountain_id) 
REFERENCES mountains(id) ON DELETE CASCADE
);

-- 5.Problem
CREATE TABLE employees(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
project_id INT(11));

CREATE TABLE projects(
id INT PRIMARY KEY AUTO_INCREMENT,
client_id INT(11),
project_lead_id INT(11) NOT NULL
);

CREATE TABLE clients(
id INT PRIMARY KEY AUTO_INCREMENT,
client_name VARCHAR(30) NOT NULL,
project_id INT(11));

ALTER TABLE employees
ADD CONSTRAINT FK_employee_project_id FOREIGN KEY (project_id)
REFERENCES projects(id);

ALTER TABLE clients
ADD CONSTRAINT FK_client_project_id FOREIGN KEY (project_id)
REFERENCES projects(id);

ALTER TABLE projects
ADD CONSTRAINT FK_project_client_id FOREIGN KEY (client_id)
REFERENCES clients(id),
ADD CONSTRAINT FK_project_employee FOREIGN KEY (project_lead_id)
REFERENCES employees(id);



