/*
===============================================================================
Author      : Mahdi Davoodi
Date        : 2026/07/21
Procedure   : usp_InsertAndDeleteAndUpdateCustomer
Database    : Northwind

Description:
    Manages customer CRUD operations (Insert, Update, Delete) based on the
    specified operation type.

    This procedure acts as a controller procedure and executes the appropriate
    customer operation by calling:
        - usp_InsertCustomer
        - usp_UpdateCustomer
        - usp_DeleteCustomer

Business Rules:
    - Operation type must be specified:
        I : Insert new customer
        U : Update existing customer
        D : Delete customer
    - CustomerID and CompanyName are required for Insert operation.
    - CustomerID is required for Update and Delete operations.
    - Invalid operation types are rejected.
    - Uses transaction management to ensure data consistency.
    - Uses TRY...CATCH for exception handling.
    - Uses SET NOCOUNT ON to suppress row count messages.
    - Uses SET XACT_ABORT ON to automatically roll back the transaction
      when a runtime error occurs.

Parameters:
    @Type           : Operation type (I = Insert, U = Update, D = Delete).
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
    @Result         : Returns operation result message after execution.

Returns:
    - Returns a success message through the @Result OUTPUT parameter.
    - Executes insert, update, or delete operation based on @Type.
    - Raises an error when validation fails or operation cannot be completed.
===============================================================================
*/
USE Northwind;
GO 


CREATE OR ALTER PROC usp_InsertAndDeleteAndUpdateCustomer @Type nchar(1), @CustomerID nchar(5) ,@CompanyName nvarchar(40) = NULL , @ContactName nvarchar(30)  = NULL ,@ContactTitle nvarchar(30) = NULL ,@Address nvarchar(60)  = NULL,  @City nvarchar(15) = NULL , @Region nvarchar(15) = NULL , @PostalCode nvarchar(10) = NULL , @Country nvarchar(15)= NULL , @Phone nvarchar(24)= NULL , @Fax nvarchar(24)= NULL , @Result nvarchar(200) OUTPUT
AS 
BEGIN 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    BEGIN TRY
	  BEGIN TRAN
	     SET @Type = UPPER(@Type);

	     --Insert
		 IF @Type = N'I'
		   BEGIN 
		     IF @CustomerID IS NULL OR @CompanyName IS NULL
			   BEGIN 
			    RAISERROR(N'CustomerID and CompanyName are required for insert.', 16, 1);
				RETURN;
			   END
		     DECLARE @CustomerIDNew nchar(5)
		     EXECUTE usp_InsertCustomer @CustomerID = @CustomerID ,@CompanyName  = @CompanyName , @ContactName = @ContactName ,@ContactTitle  = @ContactTitle ,@Address = @Address,  @City = @City , @Region  = @Region , @PostalCode = @PostalCode , @Country = @Country , @Phone = @Phone , @Fax = @Fax , @Result = @CustomerIDNew OUTPUT
			 SET @Result = CONCAT(N'Customer inserted successfully. ', CHAR(13) + CHAR(10), N'CustomerID : ' , @CustomerIDNew);
		   END
		 --Delete
		 ELSE IF @Type = N'D'
		   BEGIN 
		     IF @CustomerID IS NULL
			  BEGIN 
                 RAISERROR(N'CustomerID is required for delete.', 16, 1);
                 RETURN;
			  END
		     EXECUTE usp_DeleteCustomer @Customer = @CustomerID
			 SET @Result =N'Customer deleted successfully.';
		   END
		 --UpDate
		 ELSE IF @Type =N'U'
		   BEGIN
		      IF @CustomerID IS NULL
			  BEGIN 
                 RAISERROR(N'CustomerID is required for update.', 16, 1);
                 RETURN;
			  END
		      EXECUTE usp_UpdateCustomer @CustomerID = @CustomerID , @CompanyName  = @CompanyName , @ContactName = @ContactName ,@ContactTitle  = @ContactTitle ,@Address = @Address,  @City = @City , @Region  = @Region , @PostalCode = @PostalCode , @Country = @Country , @Phone = @Phone , @Fax = @Fax
			  SET @Result = N'Customer updated successfully.';
		   END
		 ELSE 
		   BEGIN
             RAISERROR(N'Invalid operation type. Use ''I'' for Insert, ''U'' for Update, or ''D'' for Delete.',16,1);
             RETURN;
           END
	     COMMIT TRAN;
	   END TRY
	   BEGIN CATCH
	     DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
         DECLARE @ErrorSeverity int = ERROR_SEVERITY();
         DECLARE @ErrorState int  =  ERROR_STATE();
         SELECT ERROR_PROCEDURE() AS ErrorProcedure;
         RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);
	     ROLLBACK TRAN;
	   END CATCH
END
GO 