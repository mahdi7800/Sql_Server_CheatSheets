/*
====================================================
 File Name : report_products_price_range.sql
 Purpose   : Categorize products based on unit price
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
====================================================

 Price Ranges:
 - Cheap      : UnitPrice <= 10
 - Moderate  : UnitPrice > 10 AND < 50
 - Expensive : UnitPrice >= 50
*/


USE Northwind;
GO 


SELECT P.ProductID , P.ProductName , P.UnitPrice , CASE   
                                                       WHEN P.UnitPrice <= 10 THEN N'Cheap'
                                                       WHEN P.UnitPrice BETWEEN 10 AND 50 THEN 'Moderate'
                                                       WHEN P.UnitPrice >= 50 THEN N'Expensive'
                                                    END AS PriceRange
FROM Products  AS P 

GO 
