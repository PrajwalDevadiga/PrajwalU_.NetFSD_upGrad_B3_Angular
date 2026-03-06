CREATE DATABASE EcommDb

USE EcommDb



------- 1. Problem ---------

--- Categories Table  ---
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
)

-- Brands Table ---
CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
)

-- Products Table ----
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2),

    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
)

-- Customers Table ---
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(20)
)

-- Stores Table ----
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
)

-- Insert data into  Categories Table----
INSERT INTO categories VALUES
(1,'Cars'),
(2,'Motorcycles'),
(3,'Trucks'),
(4,'Electric Vehicles'),
(5,'SUV')


-- Insert data into the Brands Table ---
INSERT INTO brands VALUES
(1,'Toyota'),
(2,'Honda'),
(3,'Ford'),
(4,'Tesla'),
(5,'BMW')


-- Insert  data into the Products Table --
INSERT INTO products VALUES
(1,'Toyota Camry',1,1,2023,30000),
(2,'Honda Civic',2,1,2022,25000),
(3,'Ford F150',3,3,2023,40000),
(4,'Tesla Model S',4,4,2024,80000),
(5,'BMW X5',5,5,2023,60000)


-- Insert data into the Customers Table ---
INSERT INTO customers VALUES
(1,'Ramesh','Patil','Mumbai','9876543210'),
(2,'Suresh','Sharma','Delhi','9876543211'),
(3,'Anita','Verma','Bangalore','9876543212'),
(4,'Rahul','Singh','Mumbai','9876543213'),
(5,'Priya','Kulkarni','Pune','9876543214')


-- Insert data into the Stores table ---
INSERT INTO stores VALUES
(1,'Mumbai Store','Mumbai'),
(2,'Delhi Store','Delhi'),
(3,'Bangalore Store','Bangalore'),
(4,'Pune Store','Pune'),
(5,'Hyderabad Store','Hyderabad')

-- 1. Retrieve all products with brand and category names ---

SELECT 
    p.product_name,
    b.brand_name,
    c.category_name,
    p.model_year,
    p.list_price
FROM products p
INNER JOIN brands b
    ON p.brand_id = b.brand_id
INNER JOIN categories c
    ON p.category_id = c.category_id



-- 2. Retrieve all customers from a specific city example: Mumbai---

SELECT *
FROM customers
WHERE city = 'Mumbai'



-- 3. Display total number of products available in each category

SELECT 
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name

--------------------------------------------

----- 2. Problem ----------

USE EcommDb;

-- Staff table ----
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
)

--- Insert data into the Staff Table ---
INSERT INTO staff VALUES
(1,'Amit',1),
(2,'Ravi',2),
(3,'Sneha',3),
(4,'Karan',4),
(5,'Meena',5)

-- Orders Table ----

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status INT,
    store_id INT,
    staff_id INT,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
)

--- Insert data into the Orders Table ---
INSERT INTO orders VALUES
(1,1,'2025-03-01',1,1,1),
(2,2,'2025-03-02',1,2,2),
(3,3,'2025-03-03',2,3,3),
(4,4,'2025-03-04',1,1,1),
(5,5,'2025-03-05',3,4,4)

   ---  VIEW : Product Details : Shows product, brand, category information ----

CREATE VIEW vw_ProductDetails
AS
SELECT
    p.product_name,
    b.brand_name,
    c.category_name,
    p.model_year,
    p.list_price
FROM products p
INNER JOIN brands b
    ON p.brand_id = b.brand_id
INNER JOIN categories c
    ON p.category_id = c.category_id



---  VIEW : Order Summary :Shows customer, store and staff details ---

CREATE VIEW vw_OrderSummary
AS
SELECT
    o.order_id,
    c.first_name + ' ' + c.last_name AS customer_name,
    s.store_name,
    st.staff_name,
    o.order_date,
    o.order_status
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN stores s
    ON o.store_id = s.store_id
INNER JOIN staff st
    ON o.staff_id = st.staff_id

  --- 3.INDEXES ON FOREIGN KEY COLUMNS  Improves JOIN performance


-- Index on Products Table
CREATE INDEX idx_products_brand_id
ON products(brand_id);

CREATE INDEX idx_products_category_id
ON products(category_id);


-- Index on Orders Table
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

CREATE INDEX idx_orders_store_id
ON orders(store_id);

CREATE INDEX idx_orders_staff_id
ON orders(staff_id);

--- Test the View ----

-- Test Product View
SELECT * FROM vw_ProductDetails;

-- Test Order Summary View
SELECT * FROM vw_OrderSummary;

--- PERFORMANCE TEST USING EXECUTION PLAN

-- Turn ON execution plan
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- Query before index testing example
SELECT *
FROM orders
WHERE customer_id = 1;

-- Query using JOIN
SELECT 
    p.product_name,
    b.brand_name
FROM products p
INNER JOIN brands b
    ON p.brand_id = b.brand_id;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;