/*
===========================================================
 File Name : demo_custom_orderby_case.sql
 Purpose   : Demonstrate custom sorting using CASE
             expression in ORDER BY clause
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 Custom sort priority:
 1. France
 2. UK
 3. Germany
 4. USA
 5. All other countries
*/


USE Northwind;
GO 

SELECT *
FROM Customers 
ORDER BY  CASE Country 
                     WHEN N'France' THEN N'France'
                     WHEN N'UK'      THEN N'UK'
                     WHEN N'Germany'THEN N'Germany'
                     WHEN N'USA'THEN N'USA'
        END DESC , Country 

GO 
