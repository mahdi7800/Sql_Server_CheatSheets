/*
===========================================================
 File Name : report_top5_active_products_sales.sql
 Purpose   : Retrieve top 5 best-selling products
             that are not discontinued
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 Notes:
 - Calculates total sales as SUM(Quantity * UnitPrice)
 - Only includes active products (Discontinued = 0)
 - Orders the results descending by total sales
*/


USE Northwind;
GO 

SELECT TOP 5  P.ProductID , P.ProductName , SUM(OD.Quantity * OD.UnitPrice) AS TotalSale 
FROM Products AS P INNER JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID
WHERE Discontinued = 0 
GROUP BY P.ProductID , P.ProductName
ORDER BY TotalSale DESC
GO 