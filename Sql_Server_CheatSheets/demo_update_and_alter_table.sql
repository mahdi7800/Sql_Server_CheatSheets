/*
===========================================================
 File Name : demo_update_and_alter_table.sql
 Purpose   : Demonstrate UPDATE with conditions,
             ALTER TABLE ADD column with DEFAULT,
             and calculated UPDATE using subquery
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 Notes:
 - Updates discontinued products stock
 - Adds Bonus column to Employees
 - Calculates employee bonus based on 1997 sales
*/

-----------------------------------------------------------
-- Set Database Context
-----------------------------------------------------------

USE Northwind;
GO 

-----------------------------------------------------------
-- Step 1: Set UnitsInStock to zero for discontinued products
-- OUTPUT shows old and new values
-----------------------------------------------------------

UPDATE Products
 SET UnitsInStock = 0
 OUTPUT inserted.* , deleted.*
 WHERE Discontinued = 1 

 GO 


 -----------------------------------------------------------
-- Step 2: Add Bonus column to Employees table
-- Default value is 0 for existing rows
-----------------------------------------------------------


 ALTER TABLE Employees 
   ADD Bouns money NOT NULL DEFAULT (0)
GO 


-----------------------------------------------------------
-- Step 3: Calculate bonus for each employee
-- Bonus = 1% of total sales in year 1997
-----------------------------------------------------------


UPDATE Employees 
  SET Bouns = (SELECT SUM ((OD.Quantity * OD.UnitPrice) * (1-OD.Discount) * 0.01)  
               FROM Orders AS O INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID 
               WHERE O.EmployeeID = Employees.EmployeeID AND YEAR (O.OrderDate) = 1997
               )
GO 


-----------------------------------------------------------
-- Step 4: Calculate bonus ONLY for employees
-- who handled at least 40 orders in 1997
-----------------------------------------------------------


UPDATE Employees 
  SET Bouns = (SELECT SUM ((OD.Quantity * OD.UnitPrice) * (1-OD.Discount) * 0.01)  
               FROM Orders AS O INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID 
               WHERE O.EmployeeID = Employees.EmployeeID AND YEAR (O.OrderDate) = 1997
               HAVING COUNT(O.OrderID) >= 40
               )
GO 
  