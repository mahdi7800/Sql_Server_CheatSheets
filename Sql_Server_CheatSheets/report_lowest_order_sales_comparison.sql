/*
===========================================================
 File Name : report_lowest_order_sales_comparison.sql
 Purpose   : Identify lowest value orders using two
             different SQL approaches
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 This script contains two separate solutions:
 1. Window Function (RANK) approach
 2. Subquery-based approach (educational comparison)
*/


USE Northwind;
GO 

-----------------------------------------------------------
-- Solution 1: Using RANK() window function
-- Find the lowest sale order per customer
-- Then return top 3 lowest orders overall
-----------------------------------------------------------
 

WITH OrderSalesCTE
AS 
(
SELECT  O.EmployeeID,C.CustomerID , O.OrderID ,SUM(OD.Quantity * OD.UnitPrice) AS Sale ,RANK()OVER(PARTITION BY C.CustomerID ORDER BY SUM(OD.Quantity * OD.UnitPrice) ASC) AS RADIF 
FROM Orders AS O 
                 INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
                 INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
GROUP BY   O.EmployeeID , C.CustomerID , O.OrderID 

)
SELECT TOP 3 WITH TIES OrderSalesCTE.EmployeeID , E.LastName , OrderID , Sale
FROM OrderSalesCTE INNER JOIN Employees AS E ON OrderSalesCTE.EmployeeID = E.EmployeeID 
WHERE OrderSalesCTE.RADIF = 1
ORDER BY Sale ASC
GO 

-----------------------------------------------------------
-- Solution 2: Using correlated subqueries
-- Same goal, different (less efficient) technique
-----------------------------------------------------------


WITH OrderSalesSubqueryCTE 
AS 
(
SELECT E.EmployeeID , CONCAT(E.TitleOfCourtesy,E.FirstName,N' ' , E.LastName) AS FullName , O.OrderID ,
                                                                                            (SELECT C.CustomerID FROM Customers AS C WHERE O.CustomerID = C.CustomerID) AS CustomerID , 
                                                                                            (SELECT SUM(OD.Quantity * OD.UnitPrice) FROM [Order Details] AS OD  WHERE OD.OrderID = O.OrderID ) AS TotalSale  
FROM Employees AS E  INNER JOIN Orders AS O ON E.EmployeeID = O.EmployeeID
)
SELECT TOP 3 WITH TIES *
FROM OrderSalesSubqueryCTE 
ORDER BY TotalSale ASC 

GO 