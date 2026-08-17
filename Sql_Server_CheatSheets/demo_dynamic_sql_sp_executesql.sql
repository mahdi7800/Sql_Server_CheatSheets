/*
===========================================================
 File Name : demo_dynamic_sql_sp_executesql.sql
 Purpose   : Demonstrate Dynamic SQL using sp_executesql
             with parameters
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 Notes:
 - Uses Dynamic SQL
 - Uses parameters to prevent SQL Injection
 - Calculates total sales by Employee LastName and Country
*/

-----------------------------------------------------------
-- Declare parameters
-----------------------------------------------------------

USE Northwind
GO 

-----------------------------------------------------------
-- Declare SQL variable
-----------------------------------------------------------


DECLARE @Country nvarchar(15) = N'USA',
        @LastName nvarchar(30) = N'Buchanan',
        @TotalSale money;

-----------------------------------------------------------
-- Declare SQL variable
-----------------------------------------------------------

DECLARE @SQL nvarchar(max) 

-----------------------------------------------------------
-- Build dynamic SQL with parameters
-----------------------------------------------------------

        SET @SQL = N'SELECT @TotalSale =  SUM(OD.Quantity * OD.UnitPrice) 
                   FROM Orders AS O INNER JOIN Employees AS E ON O.EmployeeID = E.EmployeeID	
                                    INNER JOIN Customers AS C ON O.CustomerID   = C.CustomerID
                                    INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
                   WHERE E.LastName = @LastName AND C.Country  = @Country
                   ';

-----------------------------------------------------------
-- Print generated SQL for debugging
-----------------------------------------------------------
PRINT @SQL 

-----------------------------------------------------------
-- Execute Dynamic SQL safely with parameters
-----------------------------------------------------------

EXEC sp_executesql 
     @SQL,
     N'@LastName nvarchar(30)', '@Country nvarchar(15)','@TotalSale money OUTPUT',
      @LastName = @LastName,
    @Country = @Country,
    @TotalSale = @TotalSale OUTPUT;



     SELECT 
    @LastName AS LastName,
    @Country AS Country,
    @TotalSale AS TotalSale;
     
GO