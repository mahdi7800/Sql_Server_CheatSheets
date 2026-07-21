/*
===============================================================================
Author      : Mahdi Davoodi
Date        : 2026/07/21
Procedure   : usp_DeleteCustomer
Database    : Northwind

Description:
    Deletes a customer from the dbo.Customers table.

Business Rules:
    - A customer cannot be deleted if related orders exist.
    - Returns an error if the specified customer does not exist.
    - Uses TRY...CATCH for error handling.
    - Uses SET NOCOUNT ON to suppress row count messages.
    - Uses SET XACT_ABORT ON to terminate and roll back the transaction
      automatically if a runtime error occurs.

Parameters:
    @Customer    : Customer identifier (NCHAR(5))

Returns:
    - Successfully deletes the customer.
    - Raises an error if the customer has related orders.
    - Raises an error if the customer is not found.
===============================================================================
*/

USE Northwind;
GO 

CREATE OR ALTER PROCEDURE usp_DeleteCustomer @Customer nchar(5) 
AS 
BEGIN
     /*
         Author      : Mahdi Davoodi
         Date        : 2026/07/21
         Description : Deletes a customer from dbo.Customers after validating that no related orders exist.
    */   
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
  BEGIN TRY 
     IF EXISTS (SELECT CustomerID FROM dbo.Orders WHERE CustomerID = @Customer)
       BEGIN 
          RAISERROR(N'Customer cannot be deleted because related orders exist.',16,2);
          RETURN;
       END
		DELETE dbo.Customers
		WHERE CustomerID = @Customer
     IF @@ROWCOUNT = 0 
       BEGIN 
           RAISERROR(N'Customer not found.',16,2);
           RETURN;
       END
  END TRY
  BEGIN CATCH
		   DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
           DECLARE @ErrorSeverity int = ERROR_SEVERITY();
           DECLARE @ErrorState int  =  ERROR_STATE();
           SELECT ERROR_PROCEDURE() AS ErrorProcedure;
           RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);
  END CATCH 

END