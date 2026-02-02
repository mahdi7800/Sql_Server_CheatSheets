/*
===========================================================
 File Name : demo_aggregation_and_groupby_reports.sql
 Purpose   : Demonstrate various aggregation and GROUP BY
             reporting scenarios in Northwind database
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 This script contains multiple independent aggregation
 examples using SUM, COUNT, GROUP BY and HAVING.
*/



USE Northwind;
GO 


-----------------------------------------------------------
-- Example 1: Products with high total sales
-----------------------------------------------------------


SELECT P.ProductID , P.ProductName , SUM (OD.Quantity * OD.UnitPrice ) AS TotalSale 
FROM Products AS P INNER JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID
WHERE P.ProductID > 50 
GROUP BY P.ProductID , P.ProductName
HAVING SUM (OD.Quantity * OD.UnitPrice ) > 10000
ORDER BY P.ProductID

GO 

-----------------------------------------------------------
-- Example 2: Customer count per country
-----------------------------------------------------------

SELECT Country  , COUNT(CustomerID) AS CountCustomerCountry
FROM Customers 
GROUP BY Country 
ORDER BY Country 
GO 


-----------------------------------------------------------
-- Example 3: Customer count per country and city
-----------------------------------------------------------


SELECT Country , City  , COUNT(CustomerID) AS CountCustomerCountry
FROM Customers 
GROUP BY Country ,City
ORDER BY City 
GO 

-----------------------------------------------------------
-- Example 4: Order count per USA customer in year 1997
-----------------------------------------------------------


SELECT C.CustomerID , C.CompanyName , C.Country , COUNT(O.OrderID) AS OrderCount
FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
WHERE C.Country = N'USA' AND YEAR(O.OrderDate) = 1997
GROUP BY C.CustomerID , C.CompanyName , C.Country
ORDER BY OrderCount DESC
GO


-----------------------------------------------------------
-- Example 5: Daily product sales in September 1997
-----------------------------------------------------------

SELECT P.ProductID , P.ProductName , O.OrderDate ,SUM(OD.Quantity * OD.UnitPrice) AS TotalSale 
FROM [Order Details] AS OD INNER JOIN Products AS P  ON OD.ProductID = P.ProductID
                           INNER JOIN Orders   AS O  ON OD.OrderID = O.OrderID
WHERE YEAR (O.OrderDate) = 1997 AND MONTH(O.OrderDate) = 9
GROUP BY P.ProductID , P.ProductName , O.OrderDate
ORDER BY  O.OrderDate ASC 
GO 


-----------------------------------------------------------
-- Example 6: Products with zero sales in September 1997
-----------------------------------------------------------


SELECT P.ProductID , P.ProductName,ISNULL(SUM(OD.Quantity * OD.UnitPrice), 0 ) AS TotalSale 
FROM [Order Details] AS OD INNER JOIN Products AS P  ON OD.ProductID = P.ProductID
                           INNER JOIN Orders   AS O  ON OD.OrderID = O.OrderID
WHERE O.OrderDate BETWEEN N'1997-09-1' AND N'1997-09-30 23:59:59'
GROUP BY ALL  P.ProductID , P.ProductName
HAVING ISNULL(SUM(OD.Quantity * OD.UnitPrice), 0 ) = 0
ORDER BY  P.ProductID ASC 
GO 