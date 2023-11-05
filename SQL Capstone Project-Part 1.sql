#Session 2: Creating a Database
#CREATING DATABASE

Create database AbleJobs

#CREATING TABLES

USE AbleJobs
CREATE TABLE sales1 (
    salesman_id INT PRIMARY KEY,
    salesman_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    commission FLOAT
);
SHOW TABLES
USE AbleJobs
CREATE TABLE sales2 (
    customer_id INT NOT NULL,
    cust_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES sales1(salesman_id)
);
Use AbleJobs
Select * from sales1

#ENTERING DATA INTO TABLES

INSERT INTO sales1 (salesman_id, salesman_name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

INSERT INTO sales2 (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Camron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007);

SELECT * FROM sales1;

#Session 3: Other Basic Queries
#Changing commission of salesman with name of ‘Pit Alex’ to 0.22
UPDATE sales1
SET commission = 0.22
WHERE salesman_id = 5005; 

#Changing city of salesman with salesman_id of ‘5003’ to Paris
UPDATE sales1
SET city = 'paris'
where salesman_id = '5003';

#Changing grade of customer with name of ‘Graham Zusi’ to 300

SELECT * FROM sales2;
UPDATE sales2
SET grade = 300
WHERE salesman_id  = 3005;

#Changing the city of the customer with the cust_id '3009' to 'London'

UPDATE sales2
SET city = 'London'
WHERE salesman_id = 3009;

#Session 4: Functions and Wildcards
#From the above table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.

SELECT salesman_id, salesman_name, city, commission
FROM sales1
WHERE city = 'Paris' OR city = 'Rome';

#From the following table, write a SQL query to find the details of those salespeople who live in cities apart from 'Paris' and 'Rome'. Return salesman_id, name, city, commission.

SELECT salesman_id, salesman_name, city, commission
FROM sales1
WHERE city NOT IN ('paris','rome')

#From the following table, write a SQL query to find the details of salespeople who get the commission in the range from 0.12 to 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.

SELECT salesman_id, salesman_name, city, commission
FROM sales1
WHERE commission between 0.12 AND 0.14;

#From the following table, write a SQL query to find the details of those salespeople whose name starts with any letter within 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.

SELECT salesman_id, salesman_name, city, commission
FROM sales1
WHERE salesman_name LIKE '[B-K]%';

SELECT salesman_id, salesman_name, city, commission
FROM sales1
WHERE salesman_name >= 'A' AND salesman_name < 'L';

#From the following table, write a SQL query to find the details of the customers whose name begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.

SELECT * FROM sales2;

SELECT customer_id, cust_name, city, grade, salesman_id
FROM sales2
WHERE cust_name LIKE 'B%';

#From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM sales2
WHERE cust_name LIKE '%n';

#From the following table, write a SQL query to find the details of those salespeople whose name starts with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission.

SELECT salesman_id, salesman_name, city, commission
FROM sales1
WHERE salesman_name LIKE 'N__l%';

#Unions and Joins

#creating the table - orders

Show tables
USE AbleJobs
CREATE TABLE orders (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

Show tables

#Loading data from a CSV file

LOAD DATA INFILE 'Book1.csv' 
INTO TABLE orders
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES; 

Describe orders

select * from orders

#From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.

SELECT SUM(purch_amt) AS total_purchase_amount
FROM orders;

#From the following table, write a SQL query to calculate average purchase amount of all orders. Return average purchase amount.

SELECT AVG(purch_amt) AS total_purchase_amount
FROM orders;

#From the following table, write a SQL query to count the number of unique salespeople. Return number of salespeople.

SELECT COUNT(DISTINCT salesman_id) AS number_of_salespeople
FROM orders;

#From the following table, write a SQL query to count the number of customers. Return number of customers.

SELECT COUNT(DISTINCT customer_id) AS number_of_customer
FROM orders;

#======================================END=========================================

