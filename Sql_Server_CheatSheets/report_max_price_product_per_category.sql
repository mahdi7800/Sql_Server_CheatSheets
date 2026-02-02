/*
===========================================================
 File Name : report_max_price_product_per_category.sql
 Purpose   : Retrieve the most expensive product
             per category using two SQL approaches
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 This script demonstrates two methods:
 1. Correlated subqueries with TOP
 2. JOIN combined with MAX aggregation
*/


USE Northwind;
GO 

-----------------------------------------------------------
-- Method 1: Correlated subqueries
-- Uses TOP and ORDER BY for each column
-- Less efficient, but useful for learning
-----------------------------------------------------------

SELECT  C.CategoryID , C.CategoryName , (SELECT TOP 1 ProductID FROM Products AS P WHERE P.CategoryID = C.CategoryID ORDER BY P.UnitPrice DESC) AS  ProductID ,
                                        (SELECT TOP 1 ProductName FROM Products AS P WHERE P.CategoryID = C.CategoryID ORDER BY UnitPrice DESC) AS  ProductName ,
                                        (SELECT TOP 1 UnitPrice FROM Products AS P WHERE P.CategoryID = C.CategoryID ORDER BY UnitPrice DESC) AS  UnitPrice
FROM Categories AS C
ORDER BY C.CategoryID
GO 


-----------------------------------------------------------
-- Method 2: JOIN with MAX(UnitPrice)
-- Cleaner and more performant approach
-----------------------------------------------------------


SELECT  C.CategoryID , C.CategoryName , P.ProductID , P.ProductName ,  P.UnitPrice
FROM Categories AS C INNER JOIN Products AS P ON C.CategoryID = P.CategoryID
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products WHERE Products.CategoryID = C.CategoryID)
ORDER BY C.CategoryID 
GO 
