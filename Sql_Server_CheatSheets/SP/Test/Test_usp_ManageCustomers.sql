/*
====================================================
 Stored Procedure Execution Examples

 Description :
 Demonstrates how to execute Customer management
 procedures for different operations.

 Supported Operations:
 - Insert Customer
 - Update Customer
 - Delete Customer

 Output:
 Returns operation result message through @Result
 output parameter.

 Date : 2026/07/21
====================================================
*/


DECLARE @Result nvarchar(200);
DECLARE @CustomerIDNew nchar(5);


DECLARE 
    @CustomerID nchar(5) = N'TEST1',
    @CompanyName nvarchar(40) = N'Test Company',
    @ContactName nvarchar(30) = N'Mahdi Davoodi',
    @ContactTitle nvarchar(30) = N'Manager',
    @Address nvarchar(60) = N'Tehran',
    @City nvarchar(15) = N'Tehran',
    @Region nvarchar(15) = NULL,
    @PostalCode nvarchar(10) = N'12345',
    @Country nvarchar(15) = N'Iran',
    @Phone nvarchar(24) = N'02100000000',
    @Fax nvarchar(24) = NULL;


-- =================================================
-- Insert Customer Example
-- =================================================

EXECUTE usp_InsertCustomer
    @CustomerID = @CustomerID,
    @CompanyName = @CompanyName,
    @ContactName = @ContactName,
    @ContactTitle = @ContactTitle,
    @Address = @Address,
    @City = @City,
    @Region = @Region,
    @PostalCode = @PostalCode,
    @Country = @Country,
    @Phone = @Phone,
    @Fax = @Fax,
    @Result = @CustomerIDNew OUTPUT;


SET @Result = CONCAT(
    N'Customer inserted successfully.',
    CHAR(13)+CHAR(10),
    N'CustomerID : ',
    @CustomerIDNew
);


-- =================================================
-- Update Customer Example
-- =================================================

EXECUTE usp_UpdateCustomer
    @CustomerID = @CustomerID,
    @CompanyName = N'Updated Company',
    @ContactName = @ContactName,
    @City = N'New York';


SET @Result = N'Customer updated successfully.';


-- =================================================
-- Delete Customer Example
-- =================================================

EXECUTE usp_DeleteCustomer
    @Customer = @CustomerID;


SET @Result = N'Customer deleted successfully.';


-- Display Result
SELECT @Result AS Result;