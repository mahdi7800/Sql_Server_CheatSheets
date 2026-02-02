/*
========================================================
 File Name : report_employee_order_count_pivot.sql
 Purpose   : Pivot report of order counts per employee
             grouped by order year
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
========================================================

 Notes:
 - Years covered: 1996, 1997, 1998
 - Uses PIVOT to transform year rows into columns
*/



USE Northwind;
GO 



WITH OrderCTE 
AS 
(
SELECT E.EmployeeID , CONCAT(E.TitleOfCourtesy,E.FirstName,N' ' , E.LastName) AS FullName , YEAR (O.OrderDate) AS YearOrder , O.OrderID
FROM Employees AS E INNER JOIN Orders AS O ON E.EmployeeID = O.EmployeeID
)
SELECT * , [1996] + [1997] + [1998] AS TotalYear
FROM OrderCTE 

PIVOT( COUNT(OrderID) FOR YearOrder IN ([1996],[1997],[1998])) AS SaleReaport
ORDER BY EmployeeID
GO 

