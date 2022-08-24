CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	age INT,
	mobile_number VARCHAR (17),
	address VARCHAR (100),
	PRIMARY KEY (id)
);

CREATE TABLE hobby (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR (30)
);

CREATE TABLE employee_salary (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	salary DOUBLE NOT NULL,
	DATE DATE NOT NULL,
	fk_employee_id INT NOT NULL,
	FOREIGN KEY (fk_employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_hobby (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_employee_id INT,
	fk_employee_hobby_id INT,
	FOREIGN KEY (fk_employee_id) REFERENCES employee(id),
	FOREIGN KEY (fk_employee_hobby_id) REFERENCES hobby(id)
);

INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUE ('Bhautik', 'Padmani', 22, '7359333658', 'Rajkot, Gujrat.');

INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUE ('Vivek', 'Padmani', 24, '9924235609', 'surat, Gujrat.');

INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUE ('Mohit', 'Padmani', 21, '7046943074', 'ahmedabad, Gujrat.');

INSERT INTO hobby (NAME)
VALUE ('Crecket');

INSERT INTO hobby (NAME)
VALUE ('Music');

INSERT INTO hobby (NAME)
VALUE ('Chess');

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUE (1000.00, '2015-06-24', 1);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUE (2000.00, '2022-06-24', 2);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUE (30000.00, '2022-06-01', 3);

INSERT INTO employee_hobby (fk_employee_id, fk_employee_hobby_id)
VALUE (1, 1);

INSERT INTO employee_hobby (fk_employee_id, fk_employee_hobby_id)
VALUE (2, 2);

INSERT INTO employee_hobby (fk_employee_id, fk_employee_hobby_id)
VALUE (3, 3);

DELETE FROM employee_hobby
WHERE id = 1;

DELETE FROM employee_salary
WHERE id = 1;

DELETE FROM employee
WHERE id = 1;

DELETE FROM hobby
WHERE id = 1;

TRUNCATE TABLE employee_hobby;

TRUNCATE TABLE employee_salary;

TRUNCATE TABLE employee;

TRUNCATE TABLE hobby;

SELECT * FROM hobby;

SELECT * FROM employee;

SELECT * FROM employee_salary;

SELECT * FROM employee_hobby;

SELECT first_name, NAME FROM employee, hobby;

SELECT e.first_name, s.salary
FROM employee_salary s INNER JOIN employee e
ON s.id = e.id;

SELECT e.first_name, s.salary,
(SELECT hobby.name FROM hobby WHERE e.id = hobby.id)
FROM employee e, employee_salary s;