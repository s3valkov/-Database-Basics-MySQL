-- 13.Problem
CREATE TABLE employees(id INT(11) NOT NULL UNIQUE AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
title VARCHAR(50) NOT NULL,
notes TEXT,
PRIMARY KEY(id));

CREATE TABLE customers(account_number INT(11) NOT NULL UNIQUE AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
phone_number VARCHAR(100) NOT NULL,
emergency_name VARCHAR(50),
emergency_number INT(11),
notes TEXT,
PRIMARY KEY(account_number));

CREATE TABLE room_status(room_status VARCHAR(100) NOT NULL, 
notes TEXT,
PRIMARY KEY(room_status));

CREATE TABLE room_types(room_type VARCHAR(100) NOT NULL,
notes TEXT,
PRIMARY KEY(room_type));

CREATE TABLE bed_types(bed_type VARCHAR(100) NOT NULL,
notes TEXT,
PRIMARY KEY(bed_type));

CREATE TABLE rooms(room_number INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
room_type VARCHAR(100) NOT NULL,
bed_type VARCHAR(100) NOT NULL,
rate DOUBLE,
room_status VARCHAR(100) NOT NULL,
notes TEXT,
PRIMARY KEY(room_number));

CREATE TABLE payments(id INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
employee_id INT(11),
payment_date DATE NOT NULL,
account_number INT(11) NOT NULL,
first_date_occupied DATE NOT NULL,
last_date_occupied DATE NOT NULL,
total_days INT(11) NOT NULL,
amount_charged DOUBLE NOT NULL,
tax_rate DOUBLE NOT NULL,
tax_amount DOUBLE NOT NULL,
payment_total DOUBLE NOT NULL,
notes TEXT,
PRIMARY KEY(id));

CREATE TABLE occupancies(id INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
employee_id INT(11) NOT NULL,
date_occupied DATE NOT NULL,
account_number INT(11) NOT NULL,
room_number INT(11) NOT NULL,
rate_applied BOOLEAN,
phone_charge DOUBLE,
notes TEXT,
PRIMARY KEY(id));

INSERT INTO employees(id, first_name, last_name, title) values (1, 'First Name', 'Last Name', 'Title');
INSERT INTO employees(id, first_name, last_name, title) values (2, 'First Name', 'Last Name', 'Title');
INSERT INTO employees(id, first_name, last_name, title) values (3, 'First Name', 'Last Name', 'Title');



INSERT INTO customers(account_number, first_name, last_name, phone_number, emergency_name, emergency_number)
values(1, 'First name', 'Last name', '0987654321', 'Emergency name', 20);

INSERT INTO customers(account_number, first_name, last_name, phone_number, emergency_name, emergency_number)
values(2, 'First name', 'Last name', '0987654321', 'Emergency name', 20);

INSERT INTO customers(account_number, first_name, last_name, phone_number, emergency_name, emergency_number)
values(3, 'First name', 'Last name', '0987654321', 'Emergency name', 20);

INSERT INTO room_status(room_status) values('Room status1');
INSERT INTO room_status(room_status) values('Room status2');
INSERT INTO room_status(room_status) values('Room status3');


INSERT INTO room_types(room_type) values ('Room type1');
INSERT INTO room_types(room_type) values ('Room type2');
INSERT INTO room_types(room_type) values ('Room type3');


INSERT INTO bed_types(bed_type) values ('Bed type1');
INSERT INTO bed_types(bed_type) values ('Bed type2');
INSERT INTO bed_types(bed_type) values ('Bed type3');


INSERT INTO rooms(room_number, room_type, bed_type, room_status) values(1, 'Room type', 'Bed type', 'Room status');
INSERT INTO rooms(room_number, room_type, bed_type, room_status) values(2, 'Room type', 'Bed type', 'Room status');
INSERT INTO rooms(room_number, room_type, bed_type, room_status) values(3, 'Room type', 'Bed type', 'Room status');


INSERT INTO payments(id, employee_id, payment_date, account_number, first_date_occupied, last_date_occupied, total_days, amount_charged, tax_rate, tax_amount, payment_total) values
(1, 1, '2018-09-10', 1, '2018-09-10', '2018-09-11', 1, 20, 40, 40, 50);

INSERT INTO payments(id, employee_id, payment_date, account_number, first_date_occupied, last_date_occupied, total_days, amount_charged, tax_rate, tax_amount, payment_total) values
(2, 2, '2018-09-10', 2, '2018-09-10', '2018-09-11', 2, 20, 40, 40, 50);

INSERT INTO payments(id, employee_id, payment_date, account_number, first_date_occupied, last_date_occupied, total_days, amount_charged, tax_rate, tax_amount, payment_total) values
(3, 3, '2018-09-10', 3, '2018-09-10', '2018-09-11', 3, 20, 40, 40, 50);

INSERT INTO occupancies(id, employee_id, date_occupied, account_number, room_number, phone_charge) values(
1, 1, '2018-09-10', 1, 120, 30);

INSERT INTO occupancies(id, employee_id, date_occupied, account_number, room_number, phone_charge) values(
2, 2, '2018-09-10', 2, 120, 30);

INSERT INTO occupancies(id, employee_id, date_occupied, account_number, room_number, phone_charge) values(
3, 3, '2018-09-10', 3, 120, 30);