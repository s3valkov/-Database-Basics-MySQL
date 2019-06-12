CREATE SCHEMA `gamebar`;

CREATE TABLE `employees`(
id INT AUTO_INCREMENT,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE `categories`(
id INT AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE `products`(
id INT AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
category_id INT NOT NULL,
PRIMARY KEY (`id`)
);

INSERT INTO employees (`first_name`, `last_name`)
VALUES ('Pesho', 'Peshev');

INSERT INTO employees (`first_name`, `last_name`)
VALUES ('Gosho', 'Goshev');

INSERT INTO employees (`first_name`, `last_name`)
VALUES ('Todor', 'Toshev');

ALTER TABLE employees 
ADD COLUMN  `middle_name` VARCHAR(50); 

ALTER TABLE products
ADD CONSTRAINT fk_category_id
FOREIGN KEY (category_id) REFERENCES categories (id);

ALTER TABLE employees
MODIFY COLUMN middle_name VARCHAR(100);

DROP DATABASE gamebar;


