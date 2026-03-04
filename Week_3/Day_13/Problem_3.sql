USE EventDb

CREATE TABLE stores 
(
	store_id INT PRIMARY KEY,
	store_name VARCHAR(20)

);

CREATE TABLE orders1
(
    order_id INT PRIMARY KEY,
    store_id INT,
    order_status INT,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_Items
(
    item_id INT PRIMARY KEY,
    order_id INT,
    quantity INT,
    list_price INT,
    discount DECIMAL(4,2),

    FOREIGN KEY (order_id) REFERENCES orders1(order_id)
);

INSERT INTO stores 
VALUES
(1,'General Store'),
(2,'City Store'),
(3,'Small Store');

INSERT INTO orders1 
VALUES 
(101,1,4),
(102,2,4),
(103,1,2),
(104,3,4),
(105,2,1);

INSERT INTO order_Items VALUES
(1,101,2,500,0.10),
(2,101,1,900,0.05),
(3,102,3,400,0.00),
(4,104,2,300,0.15),
(5,103,1,600,0.05),
(6,105,2,800,0.20);

SELECT s.store_name,
SUM(oi.quantity * oi.list_price * (1 - oi.discount)) as totalSales
FROM stores s 
INNER JOIN orders1 o ON s.store_id = o.store_id
INNER JOIN order_Items oi ON o.order_id = oi.order_id
WHERE o.order_status = 4
GROUP BY s.store_name
ORDER BY totalSales DESC