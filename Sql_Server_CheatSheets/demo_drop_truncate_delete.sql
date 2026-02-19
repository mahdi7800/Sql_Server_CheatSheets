/*
===========================================================
 File Name : demo_drop_truncate_delete.sql
 Purpose   : Demonstrate DROP TABLE, TRUNCATE TABLE and
             DELETE with OUTPUT in SQL Server
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 Notes:
 - DROP removes table structure and data permanently
 - TRUNCATE clears all rows but keeps table structure
 - DELETE removes selected rows and supports OUTPUT
*/


-----------------------------------------------------------
-- Set Database Context
-----------------------------------------------------------


USE Northwind;
GO 


-----------------------------------------------------------
-- DROP TABLE Example
-- Completely removes Products table (structure + data)
-- ⚠ Not recoverable
-----------------------------------------------------------


DROP TABLE Products 
GO 



-----------------------------------------------------------
-- TRUNCATE TABLE Example
-- Removes ALL rows from Customers
-- Faster than DELETE
-- Resets IDENTITY
-- Does NOT fire triggers
-----------------------------------------------------------



TRUNCATE TABLE Customers
GO


-----------------------------------------------------------
-- DELETE with OUTPUT Example
-- Deletes customers who have NO orders
-- OUTPUT returns deleted rows for auditing or logging
-----------------------------------------------------------


DELETE FROM Customers
OUTPUT deleted.*
    WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
GO 