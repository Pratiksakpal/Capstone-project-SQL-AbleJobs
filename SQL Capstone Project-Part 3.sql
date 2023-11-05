## Nested queries

#Creating a database

CREATE DATABASE online_bookstore

#CREATING TABLES
USE online_bookstore
CREATE TABLE Customer_table(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(100)
)

INSERT INTO Customer_table (customer_id, customer_name, city)
VALUES
(1,'john smith','new york'),
(2,'jane doe','los angeles'),
(3,'bob johnson','chicago');

USE online_bookstore
CREATE TABLE Orders_table(
order_id INT,
customer_id INT,
product VARCHAR(100),
Quantity INT,
price INT,
FOREIGN KEY (customer_id) REFERENCES Customer_table(customer_id)
)

INSERT INTO Orders_table (order_id, customer_id, product, Quantity, price)
VALUES
(1, 1, 'laptop', 1, 340),
(2, 1, 'Printer', 1, 240),
(3,	2, 'Smartphone', 3,	70),
(4, 3, 'Tablet', 2, 80);

select * from Orders_table
select * from Customer_table

#Retrieve the names of all customers who have placed an order for a product with a price greater than $100

SELECT c.customer_name
from customer_table as c
join Orders_table as o on c.customer_id = o.customer_id
where o.price > 100;

#List the products that have been ordered by customers from the same city as customer 'John Smith'.
 
 SELECT o.product
FROM Orders_table o
JOIN Customer_table c ON o.customer_id = c.customer_id
WHERE c.city = (
    SELECT city
    FROM Customer_table
    WHERE customer_name = 'John Smith'
);

#Find the order IDs and total order amounts for orders that contain at least one product with a quantity greater than 2.

SELECT order_id, SUM(Quantity * price) AS total_order_amount
FROM Orders_table
GROUP BY order_id
HAVING MAX(Quantity) > 2;

#=======================================END OF THE PROJECT===============================================
