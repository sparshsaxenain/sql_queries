show databases;

Create DATABASE prodapt_database;

USE prodapt_database;

create table course_list(
    course_id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(50) NOT NULL,
    course_author varchar(50) NOT NULL,
    course_date Date,
    primary key(course_id)
);

create table employee(
    emp_id INT NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    emp_profession VARCHAR(50) NOT NULL,
    emp_doj Date,
    primary key(emp_id)
);

INSERT INTO course_list(course_title, course_author, course_date) VALUES ("Java","Venkat",NOW());

INSERT INTO course_list(course_title, course_author,course_date)
    VALUES
    ("MySql","Venkat",NOW()),
    ("Angular","Venkat",NOW()),
    ("API","Venkat",NOW());


INSERT INTO employee(emp_name, emp_profession, emp_doj)
    VALUES
    ("Sparsh","ASE",NOW()),
    ("Akhilesh","ASE",NOW()),
    ("Yogita","ASE",NOW());


select * from course_list;
select course_title from course_list;

--update records

UPDATE course_list
SET course_title = "Testing"
WHERE course_id = 3;

--Delete query

DELETE from course_list
WHERE course_id = 4;

--Rename TABLES
RENAME TABLE course_list TO courses;

--alter TABLES
ALTER TABLE courses
ADD course_score VARCHAR(100) NOT NULL;


--describe table
describe courses;

--modify data type
ALTER TABLE courses
    MODIFY course_score VARCHAR(100) NOT NULL;

--modify column NAME
ALTER TABLE courses
    CHANGE COLUMN course_score course_marks INT NOT NULL;

--delete COLUMN
ALTER TABLE courses
    DROP COLUMN course_marks;

create table orders(
    OrderID Int not null,
    OrderNumber Int not null,
    emp_id int,
    Primary key(OrderID),
    Constraint FK_emp_id FOREIGN key (emp_id) REFERENCES employee(emp_id)
);

Alter table orders
add CONSTRAINT FK_emp_id FOREIGN key (emp_id) references employee(emp);

Alter table orders drop CONSTRAINT FK_emp_id;

select * from employees
order by jobTitle desc;

SELECT
    contactLastName
    contactFirstName
FROM
    customers
ORDER BY
    contactLastName DESC,
    contactFirstName ASC;


SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY
    quantityOrdered * priceEach DESC;

SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY
    subtotal DESC;

SELECT
    orderNumber, status
FROM
    oreders
ORDER BY FIELD(status,
    "In Process",
    "On Hold",
    "Cancelled",
    "Resolved",
    "Disputed",
    "Shipped");

SELECT
    firstName,
    LastName,
    reportTo
FROM
    employees
ORDER BY reportTo Desc;

---filtering queries
--Where
-- SELECT DISTINCT
-- AND
-- OR
-- IN
-- NOT IN
-- BETWEEN
-- LIMIT
-- IS NULL
    
SELECT
    firstName, lastName, jobTitle
FROM
    employees
WHERE
    jobTitle = "Sales Rep";

SELECT
    firstName, lastName, jobTitle
FROM
    employees
WHERE
    jobTitle = "Sales Rep" AND officeCode =1;

SELECT
    firstName, lastName, jobTitle, officeCode
FROM
    employees
WHERE
    jobTitle = "Sales Rep" OR officeCode =1
ORDER BY
    officeCode, jobTitle;

SELECT
    firstName, lastName, jobTitle, officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY
    officeCode;

SELECT
    firstName, LastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

-- "Tho%"
-- '%son'
-- "_r%"
-- "a_%"
-- "a__%"
-- "t%n"

SELECT
    firstName, lastName, jobTitle, officeCode
FROM
    employees
WHERE
    officeCode IN (1,2,3)
ORDER BY
    officeCode;