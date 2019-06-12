-- 14.Problem
CREATE DATABASE soft_uni;

CREATE TABLE towns(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE addresses(
id INT PRIMARY KEY AUTO_INCREMENT,
address_text TEXT,
town_id INT NOT NULL,
FOREIGN KEY(town_id) REFERENCES towns(id)
);

CREATE TABLE departments(
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE employees(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
job_title VARCHAR(100),
department_id INT NOT NULL,
hire_date DATE NOT NULL,
salary INT NOT NULL,
address_id INT ,
FOREIGN KEY (department_id) REFERENCES departments(id),
FOREIGN KEY (address_id) REFERENCES addresses(id) 
);

ALTER TABLE employees
MODIFY COLUMN `salary` DOUBLE;

-- 15.Problem
INSERT INTO towns (`name`) VALUES ('Sofia');
INSERT INTO towns (`name`) VALUES ('Plovdiv');
INSERT INTO towns (`name`) VALUES ('Varna');
INSERT INTO towns (`name`) VALUES ('Burgas');

INSERT INTO departments (`name`) VALUES  ('Engineering');
INSERT INTO departments (`name`) VALUES  ('Sales');
INSERT INTO departments (`name`) VALUES  ('Marketing');
INSERT INTO departments (`name`) VALUES  ('Software Development');
INSERT INTO departments (`name`) VALUES  ('Quality Assurance');

INSERT INTO employees (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`) VALUES ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500  );
INSERT INTO employees (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`) VALUES ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000  );
INSERT INTO employees (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`) VALUES ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25  );
INSERT INTO employees (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`) VALUES ('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.0);
INSERT INTO employees (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`) VALUES ('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

-- 16.Problem
SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM addresses;
SELECT * FROM employees;

-- 17.Problem
	SELECT * FROM towns ORDER BY `name`;
	SELECT * FROM departments ORDER BY `name`;
	SELECT * FROM employees ORDER BY `salary` DESC;
    
-- 18.Problem
	SELECT `name` FROM towns ORDER BY `name`;
	SELECT `name` FROM departments ORDER BY `name`;
	SELECT `first_name`, `last_name`, `job_title`, `salary` FROM employees ORDER BY `salary` DESC;

-- 19.Problem
UPDATE employees SET salary = salary * 1.1;	
SELECT salary FROM employees;

-- 20.Problem 
UPDATE payments SET `tax_rate` = tax_rate * 0.97;
SELECT tax_rate FROM payments;

-- 21.Problem
DELETE FROM occupancies;