USE EmployeeDb


CREATE NONCLUSTERED INDEX
idx_ename
ON Emp (Ename); 


CREATE NONCLUSTERED INDEX
idx_deptno
ON Emp (Deptno); 




-- Unique Index 
CREATE UNIQUE INDEX
idx_email
ON Emp (email); 


-- To view all indexes on the given table 
EXEC sp_helpindex  'Emp'


-- Rebuild and Reorganize an Index

ALTER INDEX ALL ON Emp  REORGANIZE;
ALTER INDEX idx_ename ON Emp  REORGANIZE;



ALTER INDEX ALL ON Emp  REBUILD;
ALTER INDEX idx_ename ON Emp  REBUILD;


ALTER INDEX idx_ename ON Emp  DISABLE;
ALTER INDEX idx_ename ON Emp  REBUILD;   --  To enable  disabled index

-- Drop Index
DROP INDEX idx_ename ON Emp; 

CREATE VIEW vw_GetEmpByDeptno AS
SELECT Ename, Job, Deptno 
FROM Emp
WHERE Deptno=10;


-- Reading data from view /  Querying the view
SELECT * FROM vw_GetEmpByDeptno;
SELECT Ename, Job FROM vw_GetEmpByDeptno;


ALTER VIEW vw_GetEmpByDeptno AS
SELECT Ename, Job, Deptno, Salary
FROM Emp
WHERE Deptno=30;


-- Rename the view
EXEC sp_rename 'vw_GetEmpByDeptno','vw_GetNewEmpByDeptno'


-- Dropping the view
DROP VIEW vw_GetEmpByDeptno; 

SELECT * FROM vw_GetNewEmpByDeptno
DROP VIEW vw_GetNewEmpByDeptno; 


/*
SELECT * FROM Customers 
SELECT * FROM Orders

INSERT INTO Orders VALUES(3, '2025-08-01')
INSERT INTO Orders VALUES(2, '2025-07-31')
*/

-- Example 2: View for Customer Order Summary

ALTER VIEW vw_CustomerOrderSummary
AS
SELECT 
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    COUNT(o.Order_ID) AS TotalOrders  
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name, c.Email;


 
-- Usage: Retrieve customers who placed multiple orders
SELECT * FROM vw_CustomerOrderSummary WHERE TotalOrders > 1;



/*
SELECT * FROM Customers 
SELECT * FROM Orders

INSERT INTO Orders VALUES(3, '2025-08-01')
INSERT INTO Orders VALUES(2, '2025-07-31')
*/

-- Example 2: View for Customer Order Summary

ALTER VIEW vw_CustomerOrderSummary
AS
SELECT 
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    COUNT(o.Order_ID) AS TotalOrders  
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name, c.Email;


 
-- Usage: Retrieve customers who placed multiple orders
SELECT * FROM vw_CustomerOrderSummary WHERE TotalOrders > 1;


