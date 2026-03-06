use AutoDb


CREATE TABLE stores
(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50)
);

CREATE TABLE products1
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    list_price DECIMAL(10,2),
    discontinued BIT
);

CREATE TABLE orders1
(
    order_id INT PRIMARY KEY,
    store_id INT,
    order_status INT,
    order_date DATE
);

CREATE TABLE order_items
(
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(4,2)
);

CREATE TABLE stocks
(
    store_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO stores VALUES
(1,'Udupi Store'),
(2,'Mangalore Store');

INSERT INTO products1 VALUES
(1,'Laptop',50000,0),
(2,'Mouse',500,0),
(3,'Keyboard',1000,1),
(4,'Monitor',8000,0);

INSERT INTO orders1 VALUES
(101,1,4,'2025-01-10'),
(102,1,4,'2025-02-15'),
(103,2,4,'2025-03-10');

INSERT INTO order_items VALUES
(101,1,2,0.10),
(101,2,3,0.05),
(102,3,1,0.00),
(103,2,4,0.10);

INSERT INTO stocks VALUES
(1,1,5),
(1,2,0),
(1,3,10),
(2,2,0),
(2,4,6);

select * from stores
select * from products1

-- Identify products sold in each store using nested queries.

SELECT *
FROM
(
    SELECT o.store_id, oi.product_id, SUM(oi.quantity) AS total_quantity
    FROM orders1 o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY o.store_id, oi.product_id
) AS sold_products;

-- Compare sold products with current stock using INTERSECT and EXCEPT operators.

SELECT store_id, product_id
FROM stocks
WHERE quantity > 0

INTERSECT

SELECT o.store_id, oi.product_id
FROM orders1 o
JOIN order_items oi
ON o.order_id = oi.order_id;


SELECT o.store_id, oi.product_id
FROM orders1 o
JOIN order_items oi
ON o.order_id = oi.order_id

EXCEPT

SELECT store_id, product_id
FROM stocks
WHERE quantity > 0;

--  Display store_name, product_name, total quantity sold.

SELECT s.store_name,
       p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM orders1 o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN stores s ON o.store_id = s.store_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY s.store_name, p.product_name;


-- Calculate total revenue per product (quantity × list_price – discount).

SELECT p.product_name,
       SUM(oi.quantity * p.list_price * (1 - oi.discount)) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Update stock quantity to 0 for discontinued products (simulation).

UPDATE stocks
SET quantity = 0
WHERE product_id IN
(
    SELECT product_id
    FROM products1
    WHERE discontinued = 1
);