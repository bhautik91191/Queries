/*! Create an “employee” database and 4 tables (hobby, employee, employee_salary, employee_hobby). */
CREATE TABLE hobby (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR (30)
);

CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	age INT,
	mobile_number VARCHAR (17),
	address VARCHAR (100),
	PRIMARY KEY (id)
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

/*! Insert multiple data in all tables */
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
VALUE (1000.00, '2015-06-24', 2);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUE (2000.00, '2022-06-24', 1);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUE (30000.00, '2022-06-01', 3);

INSERT INTO employee_hobby (fk_employee_id, fk_employee_hobby_id)
VALUE (1, 1);

INSERT INTO employee_hobby (fk_employee_id, fk_employee_hobby_id)
VALUE (2, 2);

INSERT INTO employee_hobby (fk_employee_id, fk_employee_hobby_id)
VALUE (3, 3);

/*! Delete 2 records of all tables */
DELETE FROM employee_hobby
WHERE id > 1;

DELETE FROM employee_salary
WHERE id > 1;

DELETE FROM employee
WHERE id > 1;

DELETE FROM hobby
WHERE id > 1;

/*! Truncate all tables */
TRUNCATE TABLE employee_hobby;

TRUNCATE TABLE employee_salary;

TRUNCATE TABLE employee;

TRUNCATE TABLE hobby;

/*! Create a separate select queries to get a hobby, employee, employee_salary, employee_hobby. */
SELECT * FROM hobby;

SELECT * FROM employee;

SELECT * FROM employee_salary;

SELECT * FROM employee_hobby;

/*! Create a select single query to get all employee name, all hobby_name in single column. */
SELECT CONCAT(first_name," ", NAME) AS newcolumn FROM employee, hobby;

/*! Create a select query to get  employee name, his/her employee_salary */
SELECT e.first_name, s.salary
FROM employee_salary s INNER JOIN employee e
ON s.fk_employee_id = e.id;

/*! Create a select query to get employee name, total salary of employee, 
hobby name(comma-separated - you need to use subquery for hobby name). */
SELECT CONCAT(first_name," ", last_name) AS employee_name, employee_salary.salary AS total_salary,
(SELECT GROUP_CONCAT(hobby.name) FROM hobby WHERE hobby.id = employee.id )AS employee_hobby
FROM employee 
INNER JOIN hobby ON employee.id = hobby.id
INNER JOIN employee_salary ON employee.id = employee_salary.fk_employee_id;
