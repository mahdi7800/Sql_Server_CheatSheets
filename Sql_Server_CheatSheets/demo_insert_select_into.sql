/*
===========================================================
 File Name : demo_insert_select_into.sql
 Purpose   : Demonstrate INSERT, SELECT INTO and
             INSERT INTO ... SELECT usage
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 Notes:
 - Inserts sample customers
 - Creates new table using SELECT INTO
 - Copies data between tables
*/

-----------------------------------------------------------
-- Set Database Context
-----------------------------------------------------------


USE Northwind;
GO 



-----------------------------------------------------------
-- Step 1: Insert sample customers into Customers table
-----------------------------------------------------------

INSERT INTO Customers (CustomerID , CompanyName , Country , City)
    VALUES (N'Shuwp' , N'Shanul WordPress' ,N'IRAN',N'Tehran'),
           (N'ABCDE' , N'Alphanbet comapney',N'USA',N'NEW YORK')
GO 


-----------------------------------------------------------
-- Step 2: Create new table (UsCustomers) using SELECT INTO
-- This creates the table AND inserts USA customers
-----------------------------------------------------------

SELECT C.CustomerID , C.CompanyName , C.Country , C.City
INTO UsCustomers
FROM Customers AS C
WHERE C.Country = N'USA'


-----------------------------------------------------------
-- Step 3: Insert Canadian customers into UsCustomers
-- Demonstrates INSERT INTO ... SELECT
-----------------------------------------------------------

INSERT INTO UsCustomers (CustomerID , CompanyName , Country , City)
SELECT CustomerID , CompanyName , Country , City
FROM Customers
WHERE Country = N'Canada'
GO