CREATE DATABASE AutoDb

use AutoDb

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2)
);

INSERT INTO products 
VALUES
(1,'Sedan Car',1,2019,22000.00),
(2,'Compact Car',1,2020,18000.00),
(3,'Luxury Sedan',1,2021,35000.00),
(4,'SUV Standard',2,2018,27000.00),
(5,'SUV Premium',2,2021,42000.00),
(6,'Mini SUV',2,2020,24000.00),
(7,'Pickup Basic',3,2019,26000.00),
(8,'Pickup Advanced',3,2022,38000.00),
(9,'Heavy Pickup',3,2021,45000.00),
(10,'Electric Car',4,2022,50000.00),
(11,'Electric Compact',4,2021,42000.00),
(12,'Electric Luxury',4,2023,65000.00);

SELECT * FROM products;

-- Retrieve product details (product_name, model_year, list_price).

SELECT product_name, model_year, list_price from products;

-- Compare each product’s price with the average price of products in the same category using a nested query.

SELECT product_name, category_id, list_price, 
( SELECT AVG(list_price) from products where category_id = p.category_id) as categoryAverage from Products p;

-- Display only those products whose price is greater than the category average.

SELECT product_name, category_id, list_price from products p
where list_price > ( SELECT AVG(list_price) 
from products where category_id = p.category_id);

-- Show calculated difference between product price and category average.

select product_name, list_price, list_price -  (select avg(list_price) from products where category_id = p.category_id) as difference 
from products p
where list_price  > (select avg(list_price) from products where category_id = p.category_id);

-- Concatenate product name and model year as a single column (e.g., 'ProductName (2017)').

select CONCAT(product_name, ' (', model_year, ')') as product_details, list_price 
FROM products;
