/*
===============================================================================
Author      : Mahdi Davoodi
Date        : 2026/07/12
Procedure   : usp_InsertCustomer
Database    : Northwind

Description:
    Inserts a new customer into the dbo.Customers table.

Business Rules:
    - CustomerID must be unique.
    - CompanyName is required for creating a new customer.
    - Optional customer information can be provided such as contact details,
      address, phone number, and fax.
    - Uses TRY...CATCH for exception handling.
    - Uses SET NOCOUNT ON to suppress row count messages.
    - Uses SET XACT_ABORT ON to automatically terminate the batch and roll back
      the transaction if a runtime error occurs.

Parameters:
    @CustomerID     : Unique identifier of the customer (NCHAR(5)).
    @CompanyName    : Customer company name (NVARCHAR(40)).
    @ContactName    : Contact person's name.
    @ContactTitle   : Contact person's job title.
    @Address        : Customer address.
    @City           : Customer city.
    @Region         : Customer region/state.
    @PostalCode     : Customer postal code.
    @Country        : Customer country.
    @Phone          : Customer phone number.
    @Fax            : Customer fax number.
    @Result         : Returns the inserted CustomerID after successful insertion.

Returns:
    - Returns the inserted CustomerID through the @Result OUTPUT parameter.
    - Raises an error if the insert operation fails.
===============================================================================
*/


USE Northwind;
GO 


CREATE OR ALTER PROCEDURE usp_InsertCustomer @CustomerID nchar(5) ,@CompanyName nvarchar(40) , @ContactName nvarchar(30)  = NULL ,@ContactTitle nvarchar(30) = NULL ,@Address nvarchar(60)  = NULL,  @City nvarchar(15) = NULL , @Region nvarchar(15) = NULL , @PostalCode nvarchar(10) = NULL , @Country nvarchar(15)= NULL , @Phone nvarchar(24)= NULL , @Fax nvarchar(24)= NULL , @Result nchar(5) OUTPUT
AS 
BEGIN 
     /*
        Author      : Mahdi Davoodi
        Date        : 2026/07/12
        Procedure   : usp_InsertCustomer
        Description : Insert a new customer into dbo.Customers
    */
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
  BEGIN TRY 
              
          INSERT INTO dbo.Customers(CustomerID,CompanyName,ContactName,ContactTitle,[Address],City,Region,PostalCode,Country,Phone,Fax)
            VALUES (@CustomerID,@CompanyName,@ContactName,@ContactTitle,@Address,@City,@Region,@PostalCode,@Country,@Phone,@Fax)

            SET @Result = @CustomerID
  END TRY 
  BEGIN CATCH 
           DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
           DECLARE @ErrorSeverity int = ERROR_SEVERITY();
           DECLARE @ErrorState int  =  ERROR_STATE();
           SELECT ERROR_PROCEDURE() AS ErrorProcedure;
           RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);
  END CATCH 
END