/*
===============================================================================
Author      : Mahdi Davoodi
Date        : 2026/07/06
Procedure   : usp_UpdateCustomer
Database    : Northwind

Description:
    Updates customer information in the dbo.Customers table based on CustomerID.

Business Rules:
    - CustomerID is required to identify the customer record.
    - Only provided parameters will be updated.
    - NULL parameters keep their existing values using ISNULL logic.
    - Uses TRY...CATCH for exception handling.
    - Uses SET NOCOUNT ON to suppress row count messages.
    - Uses SET XACT_ABORT ON to automatically terminate execution if a runtime
      error occurs.

Parameters:
    @CustomerID     : Unique identifier of the customer (NCHAR(5)).
    @CompanyName    : Customer company name.
    @ContactName    : Contact person's name.
    @ContactTitle   : Contact person's job title.
    @Address        : Customer address.
    @City           : Customer city.
    @Region         : Customer region/state.
    @PostalCode     : Customer postal code.
    @Country        : Customer country.
    @Phone          : Customer phone number.
    @Fax            : Customer fax number.

Returns:
    - Updates the customer record successfully.
    - Raises an error if the update operation fails.
===============================================================================
*/

USE Northwind;
GO 


CREATE OR ALTER PROC usp_UpdateCustomer  @CustomerID nchar(5) ,@CompanyName nvarchar(40) = NULL , @ContactName nvarchar(30)  = NULL ,@ContactTitle nvarchar(30) = NULL ,@Address nvarchar(60)  = NULL,  @City nvarchar(15) = NULL , @Region nvarchar(15) = NULL , @PostalCode nvarchar(10) = NULL , @Country nvarchar(15)= NULL , @Phone nvarchar(24)= NULL , @Fax nvarchar(24)= NULL 
AS 
BEGIN 
   /*
        Author    : Mahdi Davoudi
        Date      : 2026-07-06
        Subject : Update Customer details by CustomerID.
        Version   : 1.0.0
   */
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	BEGIN TRY
	  UPDATE Customers
	    SET CompanyName = ISNULL(@CompanyName,CompanyName),ContactName = ISNULL(@ContactName,ContactName),ContactTitle = ISNULL(@ContactTitle,ContactTitle),[Address] = ISNULL(@Address,[Address]),City = ISNULL(@City,City),Region = ISNULL(@Region,Region),PostalCode = ISNULL(@PostalCode,PostalCode),Country = ISNULL(@Country,Country),Phone = ISNULL(@Phone,Phone),Fax = ISNULL(@Fax,Fax)
	  WHERE CustomerID = @CustomerID
	END TRY 
	BEGIN CATCH
	    DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity int = ERROR_SEVERITY();
		DECLARE @ErrorState int  =  ERROR_STATE();
		SELECT ERROR_PROCEDURE() AS ErrorProcedure;
		RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);
	END CATCH 
END