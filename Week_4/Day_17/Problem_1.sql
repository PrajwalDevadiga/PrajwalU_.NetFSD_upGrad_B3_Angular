CREATE DATABASE addDB

use addDB


CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    list_price DECIMAL(10,2)
);


CREATE TABLE stores(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100)
);


CREATE TABLE stocks(
    store_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (store_id, product_id),

    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    order_date DATE,
    store_id INT,

    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);


CREATE TABLE order_items(
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO products VALUES
(1,'Laptop',50000),
(2,'Mobile',20000),
(3,'Tablet',15000),
(4,'Headphones',3000),
(5,'Smart Watch',8000);


INSERT INTO stores VALUES
(1,'Bangalore Store'),
(2,'Mangalore Store'),
(3,'Udupi Store');


INSERT INTO stocks VALUES
(1,1,50),
(1,2,40),
(1,3,30),
(2,1,20),
(2,2,25),
(3,3,15);


INSERT INTO orders VALUES
(1,'2024-01-10',1),
(2,'2024-02-15',2),
(3,'2024-03-12',3),
(4,'2024-04-05',1),
(5,'2024-05-18',2);


INSERT INTO order_items VALUES
(1,1,1,2,50000,0.10),
(2,1,4,5,3000,0.05),
(3,2,2,3,20000,0.05),
(4,3,3,4,15000,0.08),
(5,4,5,2,8000,0.02),
(6,5,2,6,20000,0.05),
(7,3,1,1,50000,0.10);


CREATE TRIGGER trg_updateStock
ON order_items
AFTER INSERT
AS
BEGIN
    IF (
        SELECT COUNT(*)
        FROM inserted i
        JOIN stocks s
        ON i.product_id = s.product_id
        WHERE s.quantity < i.quantity
    ) > 0
    BEGIN
        RAISERROR('Insufficient stock',16,1)
        ROLLBACK TRANSACTION
        RETURN
    END

    UPDATE s
    SET s.quantity = s.quantity - i.quantity
    FROM stocks s
    JOIN inserted i
    ON s.product_id = i.product_id

END



BEGIN TRY
    BEGIN TRANSACTION

        INSERT INTO orders
        VALUES (7, GETDATE(), 1)

        INSERT INTO order_items
        VALUES
        (10,7,3,5,50000,0.05),
        (11,7,4,3,20000,0.05)

    COMMIT TRANSACTION
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'Your Order Failed'
END CATCH

SELECT *
FROM stocks;

SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM stocks;
SELECT * FROM orders;
SELECT * FROM order_items;