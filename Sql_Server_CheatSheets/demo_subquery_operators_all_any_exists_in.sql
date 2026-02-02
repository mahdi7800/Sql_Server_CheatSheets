/*
===========================================================
 File Name : demo_subquery_operators_all_any_exists_in.sql
 Purpose   : Demonstrate usage of ALL, ANY, EXISTS and IN
             operators using Northwind sample database
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================

 This script contains multiple independent examples.
 Each query demonstrates a different subquery operator.
*/



USE Northwind;
GO 


-----------------------------------------------------------
-- Example 1: ALL
-- Find employees whose customers are NOT from Denmark
-----------------------------------------------------------



SELECT * 
FROM Employees AS E 
WHERE N'Denmark' !=  ALL (SELECT C.Country 
                         FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID 
                         WHERE O.EmployeeID = E.EmployeeID
                        )
GO 

-----------------------------------------------------------
-- Example 2: ANY
-- Find categories that have at least one product
-- with UnitPrice greater than 80
-----------------------------------------------------------



SELECT CategoryID , CategoryName 
FROM Categories AS C
WHERE 80.00 <  ANY (SELECT UnitPrice FROM Products AS P WHERE P.CategoryID = C.CategoryID)
GO

-----------------------------------------------------------
-- Example 3: EXISTS
-- Find employees who have at least one customer
-- from Denmark
-----------------------------------------------------------


SELECT * 
FROM Employees AS E 
WHERE EXISTS (SELECT 1
                         FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID 
                         WHERE O.EmployeeID = E.EmployeeID AND C.Country =N'Denmark' )
GO 


-----------------------------------------------------------
-- Example 4: IN 
-- Find categories that have products priced above 80
-----------------------------------------------------------


SELECT CategoryID , CategoryName 
FROM Categories AS C
WHERE CategoryID IN (SELECT CategoryID FROM Products AS P WHERE UnitPrice > 80)
GO



