CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20));


INSERT INTO departments
    (department_id, dept_name, city)
VALUES
    (1, 'IT', 'Delhi'),
    (2, 'HR', 'Noida'),
    (3, 'Finance', 'Ghaziabad');

INSERT INTO employees
    (employee_id, employee_name, email,
     department_id, salary, status)
VALUES
    (101, 'Rahul', 'rahul@example.com', 1, 45000.00, 'Active'),
    (102, 'Priya', 'priya@example.com', 2, 50000.00, 'Active'),
    (103, 'Amit', 'amit@example.com', 1, 40000.00, 'Inactive'),
    (104, 'Neha', 'neha@example.com', 3, 55000.00, 'Active');
    
-- Add a PRIMARY KEY constraint on departments.department_id.
 
 ALTER TABLE departments
ADD CONSTRAINT pk_departments
PRIMARY KEY (department_id);

-- Add a PRIMARY KEY constraint on employees.employee_id.

ALTER TABLE EMPLOYEES 
ADD CONSTRAINT PK_EMPLOYEES
PRIMARY KEY (employee_id);

-- Add a new column named location of type VARCHAR(100) to the departments table.
ALTER TABLE departments
ADD COLUMN location VARCHAR(100);

-- Rename the column dept_name to department_name in the departments table, keeping its existing data type and
 --   NOT NULL requirement.
 
 ALTER TABLE departments
CHANGE COLUMN dept_name department_name VARCHAR(80) NOT NULL;
    
 -- Modify employees.salary to DECIMAL(12,2) and ensure that it does not allow NULL values.  
 
    ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;


-- Set the default value of employees.status to Active.
ALTER TABLE employees
MODIFY COLUMN status VARCHAR(20) DEFAULT 'Active';

-- Add a UNIQUE constraint on employees.email.
ALTER TABLE employees
ADD CONSTRAINT uq_employees_email
UNIQUE (email);


-- Rename the employees table to staff.

RENAME TABLE employees TO staff;

-- Add a FOREIGN KEY constraint on staff.department_id referencing departments.department_id.
ALTER TABLE staff
ADD CONSTRAINT fk_staff_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

-- Drop the UNIQUE constraint added to staff.email in Question 7
ALTER TABLE staff
DROP INDEX uq_employees_email;

-- Drop the FOREIGN KEY constraint created in Question 9 without dropping the department_id column.
ALTER TABLE staff
DROP FOREIGN KEY fk_staff_department;

-- Drop the PRIMARY KEY constraint from the staff table, retaining its employee_id column.
ALTER TABLE staff
DROP PRIMARY KEY;

-- Drop the location column from the departments table.
ALTER TABLE departments
DROP COLUMN location;

--  Rename the database from company_training to company_management using MySQL-supported DDL operations.
--  Create the new database, move both tables to it, and remove the old empty database. (MySQL does not support a
--  direct RENAME DATABASE command.)

CREATE DATABASE company_management;
RENAME TABLE
    company_training.departments
TO
    company_management.departments;
    
    RENAME TABLE
    company_training.staff
TO
    company_management.staff;
    
    DROP DATABASE company_training;
     USE company_management;
    