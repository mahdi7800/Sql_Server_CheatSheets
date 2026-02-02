/*
/*
===========================================================
 File Name : demo_subquery_operators_all_any_exists_in.sql
 Purpose   : Demonstrate usage of subqueries and operators 
             (ALL, ANY, EXISTS, IN) using Northwind database
 Database  : Northwind
 Author    : Mahdi Davoudi
 Date      : 2026/01/23
===========================================================
 Notes:
 - This script creates a simple view of customers in Germany
 - Demonstrates how to create a VIEW and query it
 - Can be extended to practice subquery operators

*/


USE Northwind;
GO

/*
===========================================================
 Step 1: Create a view for customers in Germany
===========================================================
 Purpose:
   - Simplify queries that need German customers
   - Demonstrate use of CREATE VIEW
*/


CREATE VIEW V_CustomerGermany AS 
SELECT *
FROM Customers 
WHERE Country = N'Germany'
GO

/*
===========================================================
 Step 2: Query the view
===========================================================
 Purpose:
   - Retrieve all columns for customers in Germany
   - Demonstrate how to use the created view
*/

SELECT * 
FROM V_CustomerGermany 
GO 