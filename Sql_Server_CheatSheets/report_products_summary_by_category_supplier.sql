/*
===========================================================
 File Name : report_products_summary_by_category_supplier.sql
 Purpose   : Product count and maximum price grouped by
             category and supplier, including grand total
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 Notes:
 - Uses GROUPING SETS to include detailed rows and
   a grand total row in a single query
*/


USE Northwind;
GO 

SELECT C.CategoryName , Su.CompanyName , COUNT(P.ProductID) AS ProductCount , MAX(P.UnitPrice) AS MaxPrice
FROM Products AS P INNER JOIN Suppliers AS Su ON P.SupplierID = Su.SupplierID 
                   INNER JOIN Categories AS C ON P.CategoryID = C.CategoryID
GROUP BY GROUPING SETS ((C.CategoryName , Su.CompanyName),())

GO 



