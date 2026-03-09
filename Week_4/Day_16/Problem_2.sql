use EmployeeDB

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

CREATE TABLE stocks (
    store_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    store_id INT,
    order_date DATE,
    order_status INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO stores VALUES
(1,'Bangalore Store'),
(2,'Mangalore Store'),
(3,'Udupi Store');

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard'),
(4,'Monitor');

INSERT INTO stocks VALUES
(1,1,50),
(1,2,100),
(1,3,60),
(2,1,40),
(2,2,80),
(2,4,30),
(3,1,20),
(3,3,40);

INSERT INTO orders VALUES
(101,1,'2026-03-01',1),
(102,2,'2026-03-02',1),
(103,1,'2026-03-03',1),
(104,3,'2026-03-04',1);

INSERT INTO order_items VALUES
(101,1,2,50000),
(101,2,5,500),
(102,1,1,52000),
(103,3,3,1500),
(104,1,2,51000);


CREATE TRIGGER trg_stock_auto_update
ON order_items
AFTER INSERT
AS
BEGIN
    BEGIN TRY

        IF EXISTS (
            SELECT 1
            FROM inserted i
            JOIN orders o ON i.order_id = o.order_id
            JOIN stocks s 
                ON s.store_id = o.store_id 
                AND s.product_id = i.product_id
            WHERE s.quantity < i.quantity
        )
        BEGIN
            RAISERROR ('Insufficient stock for this order.',16,1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

 
        UPDATE s
        SET s.quantity = s.quantity - i.quantity
        FROM stocks s
        JOIN orders o ON s.store_id = o.store_id
        JOIN inserted i 
            ON i.order_id = o.order_id
            AND i.product_id = s.product_id;

    END TRY

    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC sp_helptext 'trg_stock_auto_update';





