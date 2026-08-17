/*
====================================================================
 Project     : Northwind SQL Server Examples
 File        : 03_Cursor_Grouped_Sales_Analysis.sql
 Author      : Mahdi Davoodi
 Created     : 2026-06-20

 Description :
 This script demonstrates the use of SQL Server cursors for
 processing grouped sales data.

 Examples included:

   1. Find the best-selling customer in each country.
   2. Calculate total sales for products supplied from the USA
      and purchased by customers from France, grouped by category.

 SQL Concepts:
   - Cursor Declaration
   - Cursor FETCH
   - WHILE Loop
   - @@FETCH_STATUS
   - Variables
   - Table Variables
   - Aggregation
   - GROUP BY
   - Common Table Expression (CTE)
   - Subquery
   - Cursor CLOSE and DEALLOCATE

 Database    : Northwind
====================================================================
*/

USE Northwind
GO 


/*
====================================================================
 Example 1
 Find the Best Customer in Each Country
====================================================================

 This example uses a cursor to process customer order details
 and calculate the total sales amount for each customer.

 The result returns the customer with the highest total sales
 within each country.
====================================================================
*/



DECLARE CP CURSOR 
  FOR SELECT  C.CustomerID , C.CompanyName, C.Country , O.OrderID , OD.UnitPrice , OD.Quantity
      FROM Customers AS C INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
                          INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
      ORDER BY C.Country

  FOR READ ONLY 

  DECLARE @CustomerID nchar(5) , @CompanyName nvarchar(40), @Country nvarchar(15) , @OrderID int , @UnitPrice money , @Quantity smallint
  DECLARE @OldCustomerID nchar(5) = NULL ,@OldCompanyName nvarchar(40) ,  @OldCountry nvarchar(15) 
  DECLARE @TotalSale money = 0
  DECLARE @BestCustomers TABLE (CustomerID nchar(5) , CompanyName nvarchar(40), SaleTotal money , Country nvarchar(15))

OPEN CP 



FETCH NEXT FROM CP INTO @CustomerID , @CompanyName, @Country , @OrderID , @UnitPrice , @Quantity

WHILE @@FETCH_STATUS <> -1 
  BEGIN 
   
   IF @OldCustomerID IS NULL 
     BEGIN
        SET @OldCustomerID  = @CustomerID
        SET @OldCompanyName = @CompanyName
        SET @OldCountry     = @Country
     END

   IF @OldCustomerID <> @CustomerID
     BEGIN 
       INSERT INTO @BestCustomers 
         VALUES (@OldCustomerID, @OldCompanyName, @TotalSale, @OldCountry);
         SET @TotalSale = 0

        SET @OldCustomerID  = @CustomerID
        SET @OldCompanyName = @CompanyName
        SET @OldCountry     = @Country
     END

  SET @TotalSale += @Quantity * @UnitPrice

  FETCH NEXT FROM CP INTO @CustomerID , @CompanyName, @Country , @OrderID , @UnitPrice , @Quantity
  END

IF @OldCustomerID IS NOT NULL
BEGIN
    INSERT INTO @BestCustomers
    VALUES (@OldCustomerID, @OldCompanyName, @TotalSale, @OldCountry);
END

CLOSE CP 
DEALLOCATE CP 

;WITH T 
AS
(
SELECT C.CustomerID , C.CompanyName , SUM(C.SaleTotal) AS SaleTotal  , C.Country
FROM @BestCustomers  AS C
GROUP BY C.Country ,C.CustomerID , C.CompanyName
)
SELECT * 
FROM T 
WHERE T.SaleTotal = (SELECT MAX(T2.SaleTotal) FROM T AS T2 WHERE T.Country = T2.Country )
ORDER BY T.Country
  
GO

/*
====================================================================
 Example 2
 USA Suppliers and France Customers Sales by Category
====================================================================

 This example calculates total sales for products that:

   - Are supplied by suppliers located in the USA.
   - Are purchased by customers located in France.

 The sales are grouped by product category.
====================================================================
*/


DECLARE UPAFC CURSOR 
   FOR SELECT C.CategoryID , C.CategoryName , S.Country , Cu.Country  ,OD.Quantity , OD.UnitPrice   
       FROM Categories AS C INNER JOIN Products AS P ON C.CategoryID = P.CategoryID
                            INNER JOIN Suppliers AS S ON S.SupplierID = P.SupplierID
                            INNER JOIN [Order Details] AS OD ON OD.ProductID = P.ProductID
                            INNER JOIN Orders AS O ON O.OrderID = OD.OrderID
                            INNER JOIN Customers AS Cu ON Cu.CustomerID = O.CustomerID 
       WHERE S.Country = N'USA' AND Cu.Country = N'France'
      ORDER BY C.CategoryID
   FOR READ ONLY

DECLARE @CategoryID int , @CategoryName nvarchar(50) , @CountrySuppliers nvarchar(15) , @CountryCustomer nvarchar(15) ,@Quantity smallint , @UnitPrice  money
DECLARE @OldCategoryID int , @OldCategoryName nvarchar(50) , @OldCountrySuppliers nvarchar(15) , @OldCountryCustomer nvarchar(15)
DECLARE @TotalSale money = 0 
DECLARE @UasProductAndFranceCustomer TABLE (CategoryID int , CategoryName nvarchar(50) , CountrySuppliers nvarchar(15) , CountryCustomer nvarchar(15) , TotalSale money )

OPEN UPAFC

FETCH NEXT FROM UPAFC INTO @CategoryID  , @CategoryName  , @CountrySuppliers , @CountryCustomer  ,@Quantity  , @UnitPrice  
 WHILE @@FETCH_STATUS <> -1 
  BEGIN 
    IF @OldCategoryID IS NULL 
      BEGIN 
           SET @OldCategoryID = @CategoryID
           SET @OldCategoryName  = @CategoryName
           SET @OldCountrySuppliers = @CountrySuppliers
           SET @OldCountryCustomer  = @CountryCustomer
      END 
      IF @CategoryID <> @OldCategoryID
        BEGIN 
             INSERT INTO @UasProductAndFranceCustomer 
                VALUES (@OldCategoryID , @OldCategoryName , @OldCountrySuppliers , @OldCountryCustomer , @TotalSale) 
    SET @OldCategoryID = @CategoryID;
    SET @OldCategoryName = @CategoryName;
    SET @OldCountrySuppliers = @CountrySuppliers;
    SET @OldCountryCustomer = @CountryCustomer;
        END
    SET @TotalSale += @Quantity * @UnitPrice
  FETCH NEXT FROM UPAFC INTO @CategoryID  , @CategoryName  , @CountrySuppliers , @CountryCustomer  ,@Quantity  , @UnitPrice 
  END

  IF @OldCategoryID IS NOT NULL
BEGIN
    INSERT INTO @UasProductAndFranceCustomer
    VALUES
    (
        @OldCategoryID,
        @OldCategoryName,
        @OldCountrySuppliers,
        @OldCountryCustomer,
        @TotalSale
    );
END
CLOSE UPAFC
DEALLOCATE UPAFC

SELECT * FROM @UasProductAndFranceCustomer
GO