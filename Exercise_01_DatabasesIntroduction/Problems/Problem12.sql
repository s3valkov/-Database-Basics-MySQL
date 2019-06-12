-- 12.Problem
CREATE DATABASE car_rental;
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(45) NOT NULL,
    daily_rate DECIMAL(2) NOT NULL,
    weekly_rate DECIMAL(2) NOT NULL,
    monthly_rate DECIMAL(2) NOT NULL,
    weekend_rate DECIMAL(2) NOT NULL
);
CREATE TABLE cars (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plate_number INT NOT NULL,
    make VARCHAR(45) NOT NULL,
    model VARCHAR(45) NOT NULL,
    car_year YEAR NOT NULL,
    category_id INT NOT NULL,
    doors INT NOT NULL,
    picture BLOB,
    car_condition TEXT NOT NULL,
    available TEXT NOT NULL
);

CREATE TABLE employees(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
title VARCHAR(45) NOT NULL,
notes TEXT
);

CREATE TABLE customers(
id INT PRIMARY KEY AUTO_INCREMENT,
driver_licence_number INT NOT NULL,
full_name VARCHAR(200) NOT NULL,
adress VARCHAR(200) NOT NULL,
city VARCHAR(45) NOT NULL,
zip_code INT NOT NULL
);
ALTER TABLE customers CHANGE `driver_license_number` `driver_licence_number` INT;

CREATE TABLE rental_orders(id INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
employee_id INT(11) NOT NULL,
customer_id INT(11) NOT NULL,
car_id INT(11) NOT NULL,
car_condition TEXT NOT NULL,
tank_level INT NOT NULL,
kilometrage_start INT(11) NOT NULL,
kilometrage_end INT(11) NOT NULL,
total_kilometrage INT(11) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_days INT NOT NULL,
rate_applied DOUBLE NOT NULL,
tax_rate DOUBLE NOT NULL,
order_status TEXT NOT NULL,
notes TEXT,
PRIMARY KEY(id));

INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES ('smart', 1, 1, 1, 1);
INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES ('smart', 1, 1, 1, 1);
INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES ('smart', 1, 1, 1, 1);
INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES ('smart', 1, 1, 1, 1);
INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES ('smart', 1, 1, 1, 1);

INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, car_condition, available) VALUES (1, 'Italy', 'Civic', 2002, 2, 4, 'Good', 'yes');
INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, car_condition, available) VALUES (1, 'Italy', 'Civic', 2002, 2, 4, 'Good', 'yes');
INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, car_condition, available) VALUES (1, 'Italy', 'Civic', 2002, 2, 4, 'Good', 'yes');
INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, car_condition, available) VALUES (1, 'Italy', 'Civic', 2002, 2, 4, 'Good', 'yes');
INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, car_condition, available) VALUES (1, 'Italy', 'Civic', 2002, 2, 4, 'Good', 'yes');

INSERT INTO employees(id, first_name, last_name, title) values (1, 'First Name', 'Last Name', 'Title');
INSERT INTO employees(id, first_name, last_name, title) values (2, 'First Name', 'Last Name', 'Title');
INSERT INTO employees(id, first_name, last_name, title) values (3, 'First Name', 'Last Name', 'Title');

INSERT INTO customers(id, driver_licence_number, full_name, adress, city, zip_code) values (1, 1, 'Full name', 'Somewhere', 'City', 123456789);
INSERT INTO customers(id, driver_licence_number, full_name, adress, city, zip_code) values (2, 1, 'Full name', 'Somewhere', 'City', 123456789);
INSERT INTO customers(id, driver_licence_number, full_name, adress, city, zip_code) values (3, 1, 'Full name', 'Somewhere', 'City', 123456789);

INSERT INTO rental_orders(id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status) values(
1, 1, 1, 1, 'Good', 10, 0, 1000000, 3000, '1999-06-07', '2000-09-10', 250, 1, 1, 'Order status');
INSERT INTO rental_orders(id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status) values(
2, 2, 2, 2, 'Good', 10, 0, 1000000, 3000, '1999-06-07', '2000-09-10', 250, 1, 1, 'Order status');
INSERT INTO rental_orders(id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status) values(
3, 3, 3, 3, 'Good', 10, 0, 1000000, 3000, '1999-06-07', '2000-09-10', 250, 1, 1, 'Order status');


