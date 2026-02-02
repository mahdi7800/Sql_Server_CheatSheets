/*
===========================================================
 File Name : demo_subquery_operators_all_any_exists_in.sql
 Purpose   : 
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================


*/


USE Northwind;
GO

CREATE VIEW V_CustomerGermany AS 
SELECT *
FROM Customers 
WHERE Country = N'Germany'
GO



SELECT * 
FROM V_CustomerGermany 
GO 