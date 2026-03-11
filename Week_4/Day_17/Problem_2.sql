CREATE DATABASE addDB1;

use addDB1

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE stores(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50)
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
    order_status INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_items(
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');

INSERT INTO stores VALUES
(1,'Main Store');

INSERT INTO stocks VALUES
(1,1,10),   
(1,2,20),  
(1,3,15); 

INSERT INTO orders VALUES
(101,'2026-03-10',1,1);  

INSERT INTO orders VALUES 
(102,'2026-03-08',1,1);

INSERT INTO order_items VALUES
(101,1,2),   
(101,2,3);   

INSERT INTO order_items VALUES 
(102,3,5);

ALTER PROCEDURE dbo.cancel_order 
	@order_id INT
AS
BEGIN 
	BEGIN TRY 
		BEGIN TRANSACTION

		SAVE TRANSACTION saveCancel

		UPDATE s
		SET s.quantity = s.quantity + oi.quantity
		FROM stocks s
		JOIN order_items oi 
			ON s.product_id = oi.product_id
		WHERE oi.order_id = @order_id;

		UPDATE orders
		SET order_status = 3
		WHERE order_id = @order_id;

		COMMIT TRANSACTION;

		PRINT 'Order Cancelled Successfully';

	END TRY

	BEGIN CATCH

    ROLLBACK TRANSACTION saveCancel;

    PRINT 'Error while cancelling order';

END CATCH

END;

EXEC dbo.cancel_order 101;

SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM stocks;
SELECT * FROM orders;
SELECT * FROM order_items;
