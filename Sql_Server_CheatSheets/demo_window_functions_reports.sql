/*
===========================================================
 File Name : demo_window_functions_reports.sql
 Purpose   : Demonstrate RANK, ROW_NUMBER, LAG and LEAD
             window functions in Northwind database
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 This script contains multiple independent examples:
 1. Employee ranking by number of orders
 2. Top customer per country by total sales
 3. Previous and next product price using subqueries
 4. Previous and next product price using LAG/LEAD
*/


USE Northwind;
GO


-----------------------------------------------------------
-- Example 1: Employee ranking by number of orders
-----------------------------------------------------------


SELECT E.EmployeeID , CONCAT(E.TitleOfCourtesy,E.FirstName,N' ' , E.LastName) AS FullName , COUNT(O.OrderID) AS OrderCount , RANK()OVER( ORDER BY COUNT(O.OrderID) DESC ) AS Rotbe
FROM Employees AS E INNER JOIN Orders AS O ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID , CONCAT(E.TitleOfCourtesy,E.FirstName,N' ' , E.LastName)

GO 

-----------------------------------------------------------
-- Example 2: Top customer per country by total sales
-----------------------------------------------------------


WITH  CustomerSalesCTE
AS 
(
SELECT C.CustomerID , C.CompanyName , C.Country , SUM (OD.Quantity * OD.UnitPrice) AS TotalSale , RANK()OVER(PARTITION BY C.Country ORDER BY SUM (OD.Quantity * OD.UnitPrice) DESC) AS BestCustomerCountryRank
FROM Orders AS O INNER JOIN Customers AS C ON O.CustomerID = C.CustomerID
                 INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID , C.CompanyName , C.Country
)
SELECT CustomerID , CompanyName , Country , TotalSale 
FROM CustomerSalesCTE 
WHERE BestCustomerCountryRank = 1 
GO 



-----------------------------------------------------------
-- Example 3: Previous and next product price using subqueries
-----------------------------------------------------------


WITH ProductRowCTE
AS 
(
SELECT ProductID , ProductName , UnitPrice , ROW_NUMBER()OVER(ORDER BY ProductID) AS RowNumber 						 
FROM Products
)
SELECT ProductID , ProductName, UnitPrice,
(SELECT UnitPrice FROM Products WHERE ProductID  = RowNumber - 1) AS PervPrice , 
(SELECT UnitPrice FROM Products WHERE ProductID  = RowNumber + 1) AS NextPrice
FROM ProductRowCTE 
GO 

-----------------------------------------------------------
-- Example 4: Previous and next product price using LAG/LEAD
-----------------------------------------------------------


SELECT ProductID , ProductName , UnitPrice , ISNULL(LAG(UnitPrice)OVER(ORDER BY ProductID  ) , 0) AS PervPrice ,
											 ISNULL(LEAD(UnitPrice)OVER(ORDER BY ProductID  ), 0) AS NextPrice
FROM Products
GO 


