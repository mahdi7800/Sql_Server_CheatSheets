/*
====================================================
 Stored Procedure Example

 Author      : Mahdi Davoodi

 Description :
 Creates a Stored Procedure to manage employee
 operations including Insert, Update, and Delete.

 The procedure performs different operations based
 on the operation type provided by the @Type parameter.

 Supported Operations:
 - I : Insert a new employee.
 - U : Update existing employee information.
 - D : Delete an employee.

 Features:
 - Centralized employee CRUD management.
 - Transaction handling using BEGIN TRAN / COMMIT / ROLLBACK.
 - Calls separate procedures for each operation.
 - Validates required parameters based on operation type.
 - Returns operation status through OUTPUT parameter.
 - Handles errors using TRY...CATCH.

 Parameters:
 @Type              : Operation type (I, U, D).
 @LastName          : Employee last name.
 @FirstName         : Employee first name.
 @BirthDate         : Employee birth date.
 @City              : Employee city.
 @Country           : Employee country.
 @TitleOfCourtesy   : Employee title.
 @EmployeeID        : Required for Update and Delete.
 @Result            : Returns operation result message.

 Returns:
 Operation status message through @Result.

 Date        : 2026/07/07
====================================================
*/

USE Northwind;
GO 


CREATE OR ALTER PROCEDURE usp_ProcessEmployeeOperation @type nchar(1) , @LastName nvarchar(20)=NULL , @FirstName nvarchar(10)= NULL ,@BirthDate datetime=NULL , @City nvarchar(15) = NULL , @Country nvarchar(15) = NULL , @TitleOfCourtesy nvarchar(25) = NULL , @EmployeeID int = NULL , @Result nvarchar(200) OUTPUT
AS 
BEGIN 

    /*
        Author    : Mahdi Davoudi
        Date      : 2026-07-06
        Subject : Insert or update employee information.        
        Version   : 1.0.0
        Description : Inserts a new employee or updates an existing employee based on the operation
                      type specified by the @Type parameter.

       Operation Types
       ---------------
       I = Insert new employee
       U = Update existing employee
       D = DELETE employee

       Parameters
       ----------
       @Type              : Operation type (I = Insert, U = Update D = Delete)
       @LastName          : Employee last name (Required)
       @FirstName         : Employee first name (Required)
       @BirthDate         : Employee birth date (Required)
       @City              : Employee city (Optional)
       @Country           : Employee country (Optional)
       @TitleOfCourtesy   : Courtesy title (Optional)
       @EmployeeID        : Required for Update and Delete operations.
       @Result            : Returns operation status message

       Output
       ------
       Returns a success message through @Result.
    */

    SET NOCOUNT ON;
    SET XACT_ABORT ON; 

    BEGIN TRAN 
        BEGIN TRY 
          SET @type = UPPER(@type);
          -- INSERT 
           IF @type = N'I' 
            BEGIN
                IF @EmployeeID IS NOT NULL
                  BEGIN 
                   RAISERROR('EmployeeID must not be supplied for insert.', 16, 1);
                   RETURN;
                  END 
                DECLARE @NewEmployeeID int
                EXECUTE usp_InsertEmployee @LastName = @LastName , @FirstName = @FirstName , @BirthDate = @BirthDate, @City  = @City   , @Country  = @Country , @TitleOfCourtesy = @TitleOfCourtesy , @NewEmployeeID = @NewEmployeeID OUTPUT
                SET @Result = CONCAT(N'Employee inserted successfully.', CHAR(13) + CHAR(10), N'EmployeeID : ' , @NewEmployeeID) ;
             END
           -- UPDATE 
           ELSE IF @type = N'U'   
             BEGIN 
               IF @EmployeeID IS NULL
                 BEGIN 
                   RAISERROR(N'EmployeeID is required for update.', 16, 1);
                   RETURN;
                 END 
               EXECUTE usp_UpdateEmploye  @EmployeeID = @EmployeeID, @LastName = @LastName,@FirstName = @FirstName,@BirthDate = @BirthDate,@City = @City,@Country = @Country,@TitleOfCourtesy = @TitleOfCourtesy; 
               SET @Result = N'Employee updated successfully.';
             END 
           -- DELETE
           ELSE IF @type = N'D'
             BEGIN 
                IF @EmployeeID IS NULL
                  BEGIN 
                     RAISERROR(N'EmployeeID is required for delete.', 16, 1);
                     RETURN;
                  END 
                EXECUTE usp_DeleteEmployee @EmployeeID = @EmployeeID
                SET @Result = N'Employee deleted successfully.';
             END
           ELSE
             BEGIN
                RAISERROR(N'Invalid operation type.',16,1);
                RETURN;
             END
        COMMIT TRAN;
        END TRY
        BEGIN CATCH 
           ROLLBACK TRAN;
           DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
           DECLARE @ErrorSeverity int = ERROR_SEVERITY();
           DECLARE @ErrorState int  =  ERROR_STATE();
           SELECT ERROR_PROCEDURE() AS ErrorProcedure;
           SET @Result = @ErrorMessage
           RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);
        END CATCH 

END