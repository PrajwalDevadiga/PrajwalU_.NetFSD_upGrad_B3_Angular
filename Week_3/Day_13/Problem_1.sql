Use EventDb 

CREATE TABLE Customers 
(
	Customer_Id INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50)
);

CREATE TABLE Orders
(
	Order_Id INT PRIMARY KEY,
	Customer_Id INT,
	Order_Date DATE,
	Order_Status INT,

	FOREIGN KEY (Customer_Id) REFERENCES Customers(Customer_Id)

); 

INSERT INTO Customers VALUES
(1,'Abhay','Padmashali'),
(2,'Prajwal','Devadiga'),
(3,'Bhavan','Gowda'),
(4,'Sidhvin','Shetty');

INSERT INTO Orders VALUES
(101,1,'2026-03-01',1),
(102,2,'2026-02-25',4),
(103,3,'2026-02-20',2),
(104,3,'2026-02-25',3),
(105,4,'2026-02-15',1),
(106,4,'2026-02-10',4);

SELECT C.FirstName,
	   C.LastName,
	   O.Order_Id,
	   O.Order_Date,
	   O.Order_Status
FROM Customers C 
INNER JOIN Orders O
ON C.Customer_Id = O.Customer_Id
WHERE O.Order_Status = 1 OR Order_Status = 4 
ORDER BY O.Order_Date DESC;