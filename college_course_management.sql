/*Create a College Course Management System using Course and Faculty tables.--
--Create Course and Faculty tables with suitable attributes.
Apply appropriate Primary Key and Foreign Key constraints.
Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
Insert at least 5 faculty records and 5 course records.
Display courses having credits between 2 and 4.
Display courses whose names start with a particular letter using LIKE.
Display courses belonging to a selected set of departments using IN.
Display unique department names using DISTINCT.
Update the faculty assigned to a particular course.
Delete a course based on a suitable condition.
Add a new column to the Course table using ALTER.
Display the final Course records. */

CREATE DATABASE college_management_system01;
USE college_management_system01;

CREATE TABLE course(
course_name VARCHAR(100) NOT NULL UNIQUE,
course_id INT PRIMARY KEY,
course_dept VARCHAR(100),
credit INT CHECK(credit >= 1 AND credit <= 5)
);

CREATE TABLE faculty(
faculty_name VARCHAR(100),
faculty_id INT PRIMARY KEY,
course_name VARCHAR(100),
Salary DECIMAL(10, 2) DEFAULT 3000.00,
FOREIGN KEY (course_name)
REFERENCES course(course_name)
);

INSERT INTO course
VALUES 
('CSE', 1, 'AIT', 4),
('AIML', 3, 'AIT', 3),
('Math', 2, 'IT', 2),
('DBMS', 7, 'LAW', 5),
('Science', 4, 'BT', 1);

INSERT INTO faculty
VALUES
('Riya', 123, 'CSE', 40000.00),
('Priya', 124, 'AIML', 55000.00),
('Rahul', 223, 'Math', 45000.00),
('Raj', 143, 'Science', 60000.00),
('Leo', 127, 'CSE', 40000.00);

SET sql_safe_updates = 0;

SELECT*FROM course
WHERE credit BETWEEN 2 AND 4;

SELECT*FROM course
WHERE course_name LIKE 'A%';

SELECT *FROM course
WHERE course_dept IN ('AIT', 'IT');

SELECT DISTINCT course_dept
FROM course;

UPDATE faculty
set faculty_name = 'Ajay'
WHERE course_name = 'Math';

DELETE FROM course
WHERE credit = 2;

ALTER TABLE course
ADD COLUMN faculty_name VARCHAR(100);

INSERT INTO course (faculty_name)
VALUES ('Riya'), ('Priya'), ('Rahul'), ('Raj'), ('Leo');

SELECT*FROM course;

ALTER TABLE course
ADD UNIQUE(course_name);

ALTER TABLE course
ADD CHECK(credit >= 1 AND credit <= 5);

ALTER TABLE course
MODIFY course_dept VARCHAR(100) NOT NULL;

UPDATE course
SET faculty_name = 'Riya'
WHERE course_id = 1;

UPDATE course
SET faculty_name = 'Priya'
WHERE course_id = 3;

UPDATE course
SET faculty_name = 'Rahul'
WHERE course_id = 2;

UPDATE course
SET faculty_name = 'Raj'
WHERE course_id = 4;

UPDATE course
SET faculty_name = 'Leo'
WHERE course_id = 7;

SELECT*FROM course;