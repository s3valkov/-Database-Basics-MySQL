CREATE DATABASE relationships;
USE relationships;

-- 1.Problem
CREATE TABLE passports(
passport_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
passport_number VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE persons(
person_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(45),
salary DECIMAL(11,2),
passport_id INT NOT NULL UNIQUE,
CONSTRAINT fk_person_passport FOREIGN KEY(passport_id)
REFERENCES passports(passport_id)
);

INSERT INTO passports(passport_id,passport_number)
 VALUES (101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

INSERT INTO persons(first_name, salary, passport_id) 
VALUES ('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101);

-- 2.Problem
CREATE TABLE manufacturers(
manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
established_on DATE NOT NULL);

CREATE TABLE models(
model_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
manufacturer_id INT NOT NULL,
CONSTRAINT fk_model_manufacture FOREIGN KEY(manufacturer_id)
REFERENCES manufacturers(manufacturer_id)
);

INSERT INTO manufacturers (name, established_on)
VALUES ('BMW', '1916-03-01' ),
('Tesla', '2003-01-01' ),
('Lada', '1966-05-01');

INSERT INTO models (model_id, name, manufacturer_id) 
VALUES (101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3);

-- 3.Problem
CREATE TABLE students (
student_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
name VARCHAR(30) NOT NULL
);

CREATE TABLE exams (
exam_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
name VARCHAR(45) NOT NULL
);

CREATE TABLE students_exams (
student_id INT NOT NULL,
exam_id INT NOT NULL,
CONSTRAINT PK_primary_keys PRIMARY KEY (student_id, exam_id),
CONSTRAINT fk_student_exams_student FOREIGN KEY (student_id) REFERENCES students(student_id),
CONSTRAINT fk_student_exams_exam FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

INSERT INTO students (name) 
VALUES ('Mila'),
 ('Toni'),
 ('Ron');

INSERT INTO exams (exam_id, name) 
VALUES (101, 'Spring MVC'),
 (102, 'Neo4j'),
 (103, 'Oracle 11g');

INSERT INTO students_exams (student_id, exam_id) 
VALUES 
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103);

-- 4.Problem
CREATE TABLE teachers (
teacher_id INT  PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
manager_id INT,
CONSTRAINT fk_manager_teacher FOREIGN KEY (manager_id) REFERENCES teachers(teacher_id)
);

INSERT INTO teachers (teacher_id, name) VALUES(
101, 'John');
INSERT INTO teachers (teacher_id, name, manager_id) VALUES(
105, 'Mark', 101);
INSERT INTO teachers (teacher_id, name, manager_id) VALUES(
106, 'Greta', 101);
INSERT INTO teachers (teacher_id, name, manager_id) VALUES(
103, 'Silvia', 106);
INSERT INTO teachers (teacher_id, name, manager_id) VALUES(
102, 'Maya', 106);
INSERT INTO teachers (teacher_id, name, manager_id) VALUES(
104, 'Ted', 105);

-- 5.Problem
CREATE TABLE cities (
city_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
birthday DATE NOT NULL,
city_id INT(11) NOT NULL,
CONSTRAINT fk_customer_city FOREIGN KEY (city_id)
REFERENCES cities(city_id)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT(11) NOT NULL,
CONSTRAINT FK_order_customer FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
);

CREATE TABLE item_types (
item_type_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

CREATE TABLE items (
item_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
item_type_id INT(11),
CONSTRAINT FK_item_item_types FOREIGN KEY (item_type_id)
REFERENCES item_types(item_type_id)
);

CREATE TABLE order_items (
order_id INT(11) NOT NULL,
item_id INT(11) NOT NULL,
CONSTRAINT PK_order_item_id PRIMARY KEY(order_id,item_id),
CONSTRAINT FK_order_items_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
CONSTRAINT FK_order_items_items FOREIGN KEY (item_id) REFERENCES items(item_id)
);

-- 6.Problem
CREATE TABLE students(
student_id INT(11) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
student_number VARCHAR(12) NOT NULL,
student_name VARCHAR(50) NOT NULL,
major_id INT(11) NOT NULL);

CREATE TABLE payments(
payment_id INT(11) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
payment_date DATE NOT NULL,
payment_amount DECIMAL(8,2) NOT NULL,
student_id INT(11) NOT NULL);

CREATE TABLE majors(
major_id INT(11) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
name VARCHAR(50) NOT NULL);

CREATE TABLE agenda(
student_id INT(11) NOT NULL,
subject_id INT(11) NOT NULL,
CONSTRAINT PK_student_subject_id PRIMARY KEY agenda(student_id, subject_id));

CREATE TABLE subjects(
subject_id INT(11) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
subject_name VARCHAR (50) NOT NULL);


ALTER TABLE students
ADD CONSTRAINT FK_major_id FOREIGN KEY (major_id)
REFERENCES majors (major_id);

ALTER TABLE payments
ADD CONSTRAINT FK_payments_student_id FOREIGN KEY (student_id)
REFERENCES students (student_id);

ALTER TABLE agenda
ADD CONSTRAINT FK_agenda_student_id FOREIGN KEY (student_id)
REFERENCES students (student_id),
ADD CONSTRAINT subject_id FOREIGN KEY (subject_id)
REFERENCES subjects (subject_id) ;

-- 9.Problem
SELECT mountain_range, peak_name, elevation AS peak_elevation
FROM peaks
JOIN mountains
ON mountains.id = peaks.mountain_id
WHERE peaks.mountain_id = 17
ORDER BY peak_elevation DESC;

