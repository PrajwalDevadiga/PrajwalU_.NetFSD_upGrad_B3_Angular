USE EventDb

CREATE TABLE Brands
(
    brand_ID INT PRIMARY KEY,
    brand_Name VARCHAR(50)
);

CREATE TABLE Categories 
(
    category_ID INT PRIMARY KEY,
    category_Name VARCHAR(50)

);

CREATE TABLE Products 
(
    product_ID INT PRIMARY KEY,
    product_Name VARCHAR(50),
    brand_ID INT,
    category_ID INT,
    model_year INT,
    list_price INT,

    FOREIGN KEY (brand_ID) REFERENCES Brands(brand_ID),
    FOREIGN KEY (category_ID) REFERENCES Categories (category_ID)
);


INSERT INTO Brands VALUES
(1,'Samsung'),
(2,'Apple'),
(3,'Dell'),
(4,'HP'),
(5,'Sony');

INSERT INTO Categories VALUES
(1,'Smartphones'),
(2,'Laptops'),
(3,'Televisions'),
(4,'Tablets');

INSERT INTO Products VALUES
(101,'Galaxy S23',1,1,2023,900),
(102,'iPhone 14',2,1,2023,1200),
(103,'Dell Inspiron 15',3,2,2022,400),
(104,'HP Pavilion',4,2,2023,650),
(105,'Sony Bravia 55"',5,3,2024,1100),
(106,'Galaxy Tab S8',1,4,2023,450),
(107,'iPad Air',2,4,2022,800),
(108,'Dell XPS 13',3,2,2024,1400); 

SELECT P.product_Name,B.brand_Name,C.category_Name,P.model_year,P.list_price
FROM Products P 
INNER JOIN Brands B ON P.brand_id = B.brand_id 
INNER JOIN Categories C ON P.category_ID = C.category_ID
WHERE P.list_price > 500
ORDER BY P.list_price; 