CREATE DATABASE day16

use day16

CREATE TABLE stores(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50)
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    store_id INT,
    order_date DATE,
    order_status INT,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_items(
    order_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id)REFERENCES products(product_id)
);

INSERT INTO stores VALUES
(1,'Udupi Store'),
(2,'Mangalore Store');

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Keyboard'),
(3,'Mouse'),
(4,'Monitor'),
(5,'Printer');

INSERT INTO orders VALUES
(101,1,'2026-03-01',4),
(102,1,'2026-03-02',4),
(103,2,'2026-03-03',4),
(104,2,'2026-03-05',4);

INSERT INTO order_items VALUES
(101,1,2,50000,0.10),
(101,2,3,2000,0.05),
(102,3,5,500,0.00),
(103,4,1,15000,0.10),
(104,5,2,8000,0.05);


-- Create a stored procedure to generate total sales amount per store.

CREATE PROCEDURE sp_totalSalesPerStore 
AS
BEGIN 
    SELECT s.store_name,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_Sales
        FROM stores s
        JOIN orders o
        ON s.store_id = o.store_id
        JOIN order_items oi
        ON o.order_id = oi.order_id
        WHERE o.order_status = 4
        GROUP BY s.store_name
END

EXEC sp_totalSalesPerStore;

CREATE PROCEDURE sp_getOrdersByDate
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    SELECT *
    FROM orders
    WHERE order_date BETWEEN @start_date AND @end_date

END

EXEC sp_GetOrdersByDate '2026-03-01','2026-03-02'

CREATE FUNCTION dbo.getTopFiveData() RETURNS TABLE
AS 
RETURN 
(
    SELECT TOP 5 
    p.product_name,
    SUM(oi.quantity) AS total_products 
    FROM products p 
    join order_items oi 
    ON oi.product_id = p.product_id
    GROUP BY p.product_name
    ORDER BY total_products DESC
)

SELECT * FROM dbo.getTopFiveData()