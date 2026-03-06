use AutoDb

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_value DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1,'Abhay','Jain'),
(2,'Bhavan','Gowda'),
(3,'Prajwal','Devadiga'),
(4,'Pramith','Rai'),
(5,'Sidhvin','Shetty'),
(6,'Prashanth','Poojari');


INSERT INTO orders VALUES
(101,1,4000),
(102,1,3000),
(103,1,5000),
(104,2,3000),
(105,2,1500),
(106,3,6000),
(107,3,7000),
(108,5,3000);

SELECT * FROM Customers
SELECT * FROM orders

-- Use nested query to calculate total order value per customer.

SELECT customer_id, first_name, (   SELECT SUM(o.order_value) from orders o
where o.customer_id = c.customer_id ) as total_order from customers c;

-- Classify customers using conditional logic:
   -- 'Premium' if total order value > 10000
   -- 'Regular' if total order value between 5000 and 10000
   -- 'Basic' if total order value < 5000

select c.customer_id, (select sum(o.order_value) from  orders o 
where o.customer_id = c.customer_id) as total_order,
CASE 
    When (SELECT SUM(order_value) from orders o WHERE o.customer_id = c.customer_id) > 10000 
        THEN 'Premium'
    When (SELECT SUM(order_value) from orders o WHERE o.customer_id = c.customer_id) BETWEEN 5000 AND 10000
        THEN 'Regular'
    When (SELECT SUM(order_value) from orders o WHERE o.customer_id = c.customer_id) < 5000
        THEN 'Basic'
END AS customer_type
from
customers c;

-- Use UNION to display customers with orders and customers without orders.

SELECT c.first_name,
SUM(o.order_value) as total_order_value
from customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.first_name

UNION

SELECT 
first_name,
NULL as total_order_value
from customers
WHERE customer_id NOT IN
(
    select customer_id from orders
);

-- Display full name using string concatenation.

select CONCAT(first_name ,' ' ,last_name) as full_name from customers;