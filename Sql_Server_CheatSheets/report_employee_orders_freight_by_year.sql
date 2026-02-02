/*
========================================================
 File Name : report_employee_orders_freight_by_year.sql
 Purpose   : Order count and freight summary per employee
             broken down by year, with grand total
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
========================================================

 Notes:
 - Years covered: 1996, 1997, 1998
 - Includes a grand total row using GROUPING SETS
*/


USE Northwind;
GO 

WITH T 
AS 
(
SELECT E.EmployeeID ,CONCAT(E.TitleOfCourtesy ,N' ',E.FirstName , N' ' , E.LastName) AS FullName , O.OrderID ,O.OrderDate ,O.Freight
FROM Employees AS E INNER JOIN Orders AS O ON E.EmployeeID = O.EmployeeID
)
SELECT EmployeeID , FullName ,   
       COUNT(CASE WHEN YEAR(OrderDate) = 1996 THEN 1 END ) AS [1996] , 
       COUNT(CASE WHEN YEAR(OrderDate) = 1997 THEN 1 END ) AS [1997] , 
       COUNT(CASE WHEN YEAR(OrderDate) = 1998 THEN 1 END ) AS [1998] ,
       COUNT(OrderID) AS TotalCount , 
       SUM  (CASE WHEN YEAR(OrderDate) = 1996  THEN Freight END  ) AS [Fr1996],
       SUM  (CASE WHEN YEAR(OrderDate) = 1997  THEN Freight END  ) AS [Fr1997],
       SUM  (CASE WHEN YEAR(OrderDate) = 1998  THEN Freight END  ) AS [Fr1998],
       SUM(Freight) AS TotalFreight
FROM T
GROUP BY GROUPING SETS ((EmployeeID , FullName  ) ,())
GO 

